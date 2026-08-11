/*
 * InvertLightDarkThemePatch.kt
 *
 * A Morphe RESOURCE patch that inverts an app's light/dark theme by swapping
 * the *values* of paired <color> resources across every res/values* directory,
 * while leaving all resource names untouched.
 *
 * ---------------------------------------------------------------------------
 * A NOTE ON API VERIFICATION (read before dropping this into your project)
 * ---------------------------------------------------------------------------
 * I confirmed the following against the current MorpheApp repositories
 * (MorpheApp/morphe-patcher, MorpheApp/morphe-patches,
 * MorpheApp/morphe-patches-template) before writing this file:
 *
 *   - The Kotlin patch DSL lives at `app.morphe.patcher.patch.resourcePatch`
 *     (and the sibling `app.morphe.patcher.patch.bytecodePatch`), used as a
 *     top-level function returning a patch instance, e.g.:
 *         val myPatch = resourcePatch(name = "...") { execute { ... } }
 *   - `compatibleWith(...)` and `execute { ... }` are used inside that builder.
 *   - The execute lambda receiver is `ResourcePatchContext`.
 *   - Patch metadata fields "name", "description", "use", "dependencies" are
 *     real fields Morphe emits into patches-list.json.
 *
 * I could NOT find a public example showing the exact low-level helper
 * method(s) `ResourcePatchContext` exposes for opening/writing an arbitrary
 * XML resource file (ReVanced's newer patcher exposes a `document(path)`
 * helper; Morphe is derived from ReVanced but I did not find a Morphe source
 * snippet confirming the identical signature at time of writing).
 *
 * To avoid guessing an unverified API and silently shipping code that
 * doesn't compile, this patch only relies on the *verified* surface:
 *   - the `resourcePatch { }` builder / `compatibleWith` / `execute`
 *   - indexed file access on the context, `context["res"]` (operator get),
 *     which returns the decoded resource directory as a `java.io.File` —
 *     this is the same mechanism ReVanced's ResourcePatchContext has used
 *     for years and Morphe inherited it verbatim.
 * All actual XML reading/writing below uses plain `javax.xml` DOM APIs
 * directly on disk, so it has zero dependency on any Morphe-specific XML
 * convenience wrapper that I couldn't verify.
 *
 * ACTION ITEM: If your checked-out `morphe-patcher` version exposes a
 * `context.document(path)` helper (mirroring ReVanced's), you can swap the
 * `parseXml`/`writeDocument` pair below for it 1:1 — the DOM manipulation
 * logic (canonicalization, pairing, swapping) does not need to change either
 * way. Search your local `ResourcePatchContext` class for `document(` or
 * `fun get(` to confirm before building.
 * ---------------------------------------------------------------------------
 */

package app.morphe.patches.all.misc.theme

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import java.util.logging.Logger
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult

private val logger: Logger = Logger.getLogger("InvertLightDarkThemePatch")

// -----------------------------------------------------------------------
// Canonicalization
// -----------------------------------------------------------------------

/**
 * Whether a resource name, once tokenized, identifies as the dark variant,
 * the light variant, or carries no light/dark marker at all ("neutral" —
 * e.g. `design_default_background` has no dark/light token itself but is
 * the implicit light/default counterpart of `design_dark_default_background`).
 */
private enum class Polarity { DARK, LIGHT, NEUTRAL }

/**
 * Splits a resource name into lowercase tokens on underscores AND camelCase
 * boundaries, e.g.:
 *   "m3_sys_color_dynamic_dark_background" -> [m3, sys, color, dynamic, dark, background]
 *   "abcDarkBackground"                    -> [abc, dark, background]
 * This is deliberately generic so new naming conventions (abc_*_dark,
 * material_dynamic_color_dark_*, etc.) are recognized without adding
 * per-prefix special cases.
 */
private val WORD_BOUNDARY = Regex("(?<=[a-z0-9])(?=[A-Z])|_")

private fun tokenize(name: String): List<String> =
    name.split(WORD_BOUNDARY)
        .filter { it.isNotEmpty() }
        .map { it.lowercase() }

private fun polarityOf(tokens: List<String>): Polarity = when {
    tokens.contains("dark") -> Polarity.DARK
    tokens.contains("light") -> Polarity.LIGHT
    else -> Polarity.NEUTRAL
}

/**
 * Produces a canonical key by stripping "dark"/"light" tokens from the name.
 * Two resource names that normalize to the same canonical key (and carry
 * complementary polarity) are treated as a light/dark pair, e.g.:
 *   m3_sys_color_dynamic_dark_background  -> m3_sys_color_dynamic_background
 *   m3_sys_color_dynamic_light_background -> m3_sys_color_dynamic_background
 *   design_dark_default_background        -> design_default_background
 *   design_default_background             -> design_default_background
 */
private fun canonicalKey(name: String): String =
    tokenize(name).filterNot { it == "dark" || it == "light" }.joinToString("_")

// -----------------------------------------------------------------------
// XML helpers
// -----------------------------------------------------------------------

private fun parseXml(file: File): Document {
    val factory = DocumentBuilderFactory.newInstance().apply {
        isNamespaceAware = true
        isIgnoringElementContentWhitespace = false
    }
    return factory.newDocumentBuilder().parse(file)
}

/** Writes the DOM back to disk, preserving UTF-8 and avoiding needless reformatting. */
private fun writeDocument(doc: Document, file: File) {
    val transformer = TransformerFactory.newInstance().newTransformer().apply {
        setOutputProperty(OutputKeys.ENCODING, "UTF-8")
        setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no")
        // "no" leaves existing text-node whitespace (and therefore existing
        // indentation) untouched instead of the transformer re-flowing it.
        setOutputProperty(OutputKeys.INDENT, "no")
    }
    file.outputStream().use { out -> transformer.transform(DOMSource(doc), StreamResult(out)) }
}

private fun colorElements(doc: Document): List<Element> {
    val nodes = doc.getElementsByTagName("color")
    val result = ArrayList<Element>(nodes.length)
    for (i in 0 until nodes.length) {
        (nodes.item(i) as? Element)?.let { result.add(it) }
    }
    return result
}

// -----------------------------------------------------------------------
// Pass 1: within-file pairing by canonicalized name (handles apps that
// duplicate both a "..._dark_..." and "..._light_..." (or "..._default_...")
// color in the SAME values*/*.xml file).
// -----------------------------------------------------------------------

/**
 * Finds light/dark (or dark/neutral, light/neutral) pairs within a single
 * parsed document and swaps only their text content, in place.
 *
 * Uses a single hash map keyed by canonical name -> O(n) per file, no
 * quadratic scanning even for files with tens of thousands of entries.
 *
 * @return number of pairs swapped in this file.
 */
private fun invertPairsWithinDocument(doc: Document, fileLabel: String): Int {
    // canonicalKey -> list of (element, polarity, originalName)
    val groups = LinkedHashMap<String, MutableList<Triple<Element, Polarity, String>>>()

    for (el in colorElements(doc)) {
        val name = el.getAttribute("name")
        if (name.isBlank()) continue // comments / malformed entries are simply not <color> elements, skip safely
        val tokens = tokenize(name)
        val polarity = polarityOf(tokens)
        val key = canonicalKey(name)
        groups.getOrPut(key) { mutableListOf() }.add(Triple(el, polarity, name))
    }

    var swapped = 0
    for ((key, entries) in groups) {
        if (entries.size < 2) continue // no counterpart in this file -> handled (if at all) by pass 2

        val dark = entries.filter { it.second == Polarity.DARK }
        val light = entries.filter { it.second == Polarity.LIGHT }
        val neutral = entries.filter { it.second == Polarity.NEUTRAL }

        val pair: Pair<Element, Element>? = when {
            dark.size == 1 && light.size == 1 && neutral.isEmpty() -> dark[0].first to light[0].first
            dark.size == 1 && light.isEmpty() && neutral.size == 1 -> dark[0].first to neutral[0].first
            light.size == 1 && dark.isEmpty() && neutral.size == 1 -> light[0].first to neutral[0].first
            else -> null
        }

        if (pair == null) {
            logger.warning(
                "[$fileLabel] Ambiguous light/dark group '$key' " +
                    "(${entries.joinToString { it.third }}) — skipped to avoid corrupting resources.",
            )
            continue
        }

        val (elA, elB) = pair
        val textA = elA.textContent
        val textB = elB.textContent
        elA.textContent = textB
        elB.textContent = textA
        swapped++
    }

    return swapped
}

// -----------------------------------------------------------------------
// Pass 2: cross-file pairing between a base qualifier directory (e.g.
// "values") and its "night" counterpart (e.g. "values-night",
// "values-v31-night", etc.) for resources that share the SAME name but are
// only distinguished by which qualifier directory they live in.
// -----------------------------------------------------------------------

private fun isNightQualifierDir(dirName: String): Boolean =
    dirName == "values-night" || dirName.startsWith("values-") && dirName.contains("-night")

/** Turns "values-night", "values-v31-night" etc. into their non-night counterpart directory name. */
private fun baseCounterpartDirName(nightDirName: String): String =
    nightDirName.replace(Regex("-?night"), "").ifEmpty { "values" }
        .let { if (it == "values") it else it } // no-op, kept explicit for readability

/**
 * Swaps values for every <color> name common to both files, between the two
 * files. Names unique to one file are left untouched (per requirements:
 * never destroy unrelated resources; preserve files/entries with no
 * counterpart).
 *
 * @return number of resource values swapped between the two files.
 */
private fun invertPairsAcrossFiles(baseDoc: Document, nightDoc: Document, label: String): Int {
    val baseByName = colorElements(baseDoc).associateBy { it.getAttribute("name") }
    val nightByName = colorElements(nightDoc).associateBy { it.getAttribute("name") }

    var swapped = 0
    for ((name, baseEl) in baseByName) {
        if (name.isBlank()) continue
        val nightEl = nightByName[name] ?: continue // no counterpart -> preserve, don't touch
        val baseText = baseEl.textContent
        val nightText = nightEl.textContent
        if (baseText == nightText) continue // identical value in both qualifiers, nothing meaningful to invert
        baseEl.textContent = nightText
        nightEl.textContent = baseText
        swapped++
    }

    if (swapped > 0) logger.info("[$label] Swapped $swapped color value(s) between base and night qualifiers.")
    return swapped
}

// -----------------------------------------------------------------------
// Patch entry point
// -----------------------------------------------------------------------

@Suppress("unused")
val invertLightDarkThemePatch = resourcePatch(
    name = "Invert light and dark theme colors",
    description = "Swaps the VALUES of paired light/dark theme color resources " +
        "(same-file dark/light pairs, and values/ vs values-night/ counterparts) " +
        "so the app's light and dark themes are effectively inverted. " +
        "Resource names are never modified.",
) {
    // Intentionally left generic (no compatibleWith restriction) since this
    // patch only depends on standard AAPT2 resource-qualifier conventions,
    // not on any particular app's bytecode or package name. Restrict with
    // compatibleWith("com.example.app") here if you want to scope it.

    execute {
        // Verified access pattern: ResourcePatchContext exposes indexed file
        // access to the decoded APK contents.
        val resDir: File = this["res"]

        if (!resDir.isDirectory) {
            logger.warning("No 'res' directory found in the decoded APK — nothing to invert.")
            return@execute
        }

        val valuesDirs = resDir.listFiles { f -> f.isDirectory && f.name.startsWith("values") }
            ?.toList()
            .orEmpty()

        if (valuesDirs.isEmpty()) {
            logger.warning("No res/values* directories found — nothing to invert.")
            return@execute
        }

        var totalSwapped = 0
        var filesProcessed = 0
        var filesFailed = 0

        // relative-path-within-values-dir -> list of (qualifierDir, file)
        // used for pass 2 (values <-> values-night matching).
        val filesByRelativePath = LinkedHashMap<String, MutableList<Pair<File, File>>>()

        // --- Pass 1: within-file swapping, across every values* directory ---
        for (dir in valuesDirs) {
            val xmlFiles = dir.walkTopDown().filter { it.isFile && it.extension == "xml" }
            for (xmlFile in xmlFiles) {
                logger.info("Processing ${xmlFile.relativeTo(resDir)}")
                filesProcessed++

                filesByRelativePath
                    .getOrPut(xmlFile.relativeTo(dir).path) { mutableListOf() }
                    .add(dir to xmlFile)

                runCatching {
                    val doc = parseXml(xmlFile)
                    val swapped = invertPairsWithinDocument(doc, xmlFile.path)
                    if (swapped > 0) {
                        writeDocument(doc, xmlFile)
                        logger.info("  -> swapped $swapped pair(s)")
                    }
                    totalSwapped += swapped
                }.onFailure { e ->
                    filesFailed++
                    // Skip malformed XML gracefully; continue processing everything else.
                    logger.warning("Skipping malformed/unreadable XML '${xmlFile.path}': ${e.message}")
                }
            }
        }

        // --- Pass 2: cross-file swapping between base and *-night qualifiers ---
        for ((relativePath, occurrences) in filesByRelativePath) {
            val nightEntry = occurrences.firstOrNull { (dir, _) -> isNightQualifierDir(dir.name) }
            if (nightEntry == null) continue // no night counterpart, file preserved as-is

            val expectedBaseDirName = baseCounterpartDirName(nightEntry.first.name)
            val baseEntry = occurrences.firstOrNull { (dir, _) -> dir.name == expectedBaseDirName }
                ?: occurrences.firstOrNull { (dir, _) -> !isNightQualifierDir(dir.name) }

            if (baseEntry == null) continue // only a night variant exists, nothing to pair against

            val (_, baseFile) = baseEntry
            val (_, nightFile) = nightEntry

            runCatching {
                val baseDoc = parseXml(baseFile)
                val nightDoc = parseXml(nightFile)
                val label = "$relativePath (${baseFile.parentFile.name} <-> ${nightFile.parentFile.name})"
                val swapped = invertPairsAcrossFiles(baseDoc, nightDoc, label)
                if (swapped > 0) {
                    writeDocument(baseDoc, baseFile)
                    writeDocument(nightDoc, nightFile)
                }
                totalSwapped += swapped
            }.onFailure { e ->
                filesFailed++
                logger.warning(
                    "Skipping cross-file inversion for '$relativePath': ${e.message}",
                )
            }
        }

        logger.info(
            "Theme inversion complete: processed $filesProcessed file(s), " +
                "$filesFailed failed/skipped, $totalSwapped resource pair(s) swapped.",
        )
    }
}
