/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.misc.branding

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.theme.decodedPackageRoots
import app.morphe.patches.tiktok.misc.theme.decodedResourceDirectories
import app.morphe.patches.tiktok.misc.theme.renamedPathCollisions
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val DRAWABLE = "android:drawable"
private const val FILL_COLOR = "android:fillColor"
private const val ADAPTIVE_ICON = "adaptive-icon"
private const val MONOCHROME = "monochrome"

/** The fill of the note itself in TikTok's foreground; the cyan and red slivers are its echo. */
internal const val GLYPH_FILL = "#ffffffff"

/**
 * The looks this patch offers. Each one only rewrites the adaptive icon, so it shows on Android 8
 * and up; older launchers keep TikTok's own PNGs.
 */
internal enum class IconStyle(val key: String, val label: String, val background: String?, val glyph: String?) {
    TIKTOK("tiktok", "TikTok colors", null, null),
    BLACK("black", "Black background", "#ff000000", null),
    WHITE_ON_BLACK("white-on-black", "White on black", "#ff000000", "#ffffffff"),
    BLACK_ON_WHITE("black-on-white", "Black on white", "#ffffffff", "#ff000000"),
}

@Suppress("unused")
val customLauncherIconPatch = resourcePatch(
    name = "Custom launcher icon",
    description = "Gives TikTok's launcher icon a themed version, so on Android 13 and up it takes " +
        "your wallpaper's color when themed icons are on. Its options can also swap in a black " +
        "background or a plain one-color note on Android 8 and up.",
    default = false,
) {
    category("Settings")
    compatibleWith(*AppCompatibilities.tiktok())
    val style by stringOption(
        key = "iconStyle",
        default = IconStyle.TIKTOK.key,
        values = IconStyle.entries.associate { it.label to it.key },
        title = "Icon style",
        description = "TikTok colors keeps the icon as it is. Black background puts TikTok's note " +
            "on pure black, and the two plain styles draw only the note in one color. Every " +
            "style gets the themed icon.",
        required = true,
    )

    execute {
        // Checked before anything is read, so a refused style changes nothing.
        val chosen = iconStyle(style)
        val packageRoot = get("res").parentFile
        val decodedRoots = decodedPackageRoots(packageRoot)
        val collisions = renamedPathCollisions(
            entries = listApkEntries("res/"),
            decodedDirectories = decodedResourceDirectories(decodedRoots),
            aliasOf = { name -> get(name).relativeTo(packageRoot).invariantSeparatorsPath },
            isDecoded = { name -> decodedRoots.any { it.resolve(name).isFile } },
        )
        if (collisions.isNotEmpty()) throw PatchException(renamedIconPathsRefusal(collisions.size))

        val res = get("res")
        val icons = launcherIconReferences(readXml(get("AndroidManifest.xml")))
        val adaptiveIcons = icons.flatMap { adaptiveIconFiles(res, it) }.distinct()
        if (adaptiveIcons.isEmpty()) {
            throw PatchException("Custom launcher icon: TikTok's icon ${icons.joinToString()} has no adaptive version to restyle.")
        }
        // A dry run on a throwaway copy of each icon first: a refusal leaves every file as it was.
        val layers = adaptiveIcons.associateWith { file ->
            IconLayers.of(res, readXml(file)).also { restyleAdaptiveIcon(readXml(file), it, chosen) }
        }
        for ((file, layer) in layers) {
            document(file.relativeTo(get(".")).invariantSeparatorsPath).use { icon ->
                restyleAdaptiveIcon(icon, layer, chosen)
            }
        }
    }
}

internal fun renamedIconPathsRefusal(collisions: Int) =
    "Custom launcher icon: this TikTok APK was merged from a split bundle in a way that moved " +
        "its resource files into new folders, and $collisions of their paths clash with the " +
        "names the resource rebuild gives other files. Nothing was changed. Patch the .apkm in " +
        "Morphe Manager, which keeps TikTok's own paths, or patch the full APK from APKMirror."

/** The chosen style, or a refusal that names the ones there are. */
internal fun iconStyle(raw: String?): IconStyle {
    val key = raw?.trim().orEmpty()
    return IconStyle.entries.firstOrNull { it.key.equals(key, ignoreCase = true) || it.label.equals(key, ignoreCase = true) }
        ?: throw PatchException(
            "Custom launcher icon: \"$key\" isn't a style. Pick one of " +
                IconStyle.entries.joinToString { it.key } + ".",
        )
}

/**
 * The icon references the launcher can show: the application's icon and round icon, and the
 * icon of any launcher entry that names its own. On 47.x all of them are `@mipmap/c`.
 */
internal fun launcherIconReferences(manifest: Document): Set<String> {
    val application = manifest.getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("Custom launcher icon: TikTok's manifest has no application element.")
    val entries = (manifest.getElementsByTagName("activity").elements() +
        manifest.getElementsByTagName("activity-alias").elements()).filter { it.isLauncherEntry() }
    return (listOf(application) + entries)
        .flatMap { listOf(it.getAttribute("android:icon"), it.getAttribute("android:roundIcon")) }
        .filterTo(linkedSetOf()) { it.isNotEmpty() }
}

/** `@drawable/c27` or `@com.zhiliaoapp.musically:mipmap/c` as type and name, or null for anything else. */
internal fun appResource(reference: String): Pair<String, String>? {
    val match = Regex("""@(?:([\w.]+):)?(\w+)/([\w.]+)""").matchEntire(reference.trim()) ?: return null
    if (match.groupValues[1] == "android") return null
    return match.groupValues[2] to match.groupValues[3]
}

/** The decoded XML files of [reference] in every configuration, `res/<type>[-qualifiers]/<name>.xml`. */
internal fun decodedXmlFiles(res: File, reference: String): List<File> {
    val (type, name) = appResource(reference) ?: return emptyList()
    return res.listFiles().orEmpty()
        .filter { it.isDirectory && (it.name == type || it.name.startsWith("$type-")) }
        .sortedBy { it.name }
        .map { it.resolve("$name.xml") }
        .filter { it.isFile }
}

/** The configurations of an icon that are adaptive icons (TikTok's mipmap-anydpi-v26). */
internal fun adaptiveIconFiles(res: File, reference: String): List<File> =
    decodedXmlFiles(res, reference).filter { readXml(it).documentElement?.tagName == ADAPTIVE_ICON }

/** The one vector a layer draws, or null when it is a PNG, a color or more than one file. */
internal fun layerVector(res: File, reference: String): Element? {
    val files = decodedXmlFiles(res, reference)
    val file = files.singleOrNull() ?: files.firstOrNull { it.parentFile.name == appResource(reference)?.first } ?: return null
    return readXml(file).documentElement?.takeIf { it.tagName == "vector" }
}

/** What an adaptive icon draws: the vectors behind its background and foreground layers. */
internal class IconLayers(val background: Element?, val foreground: Element) {
    companion object {
        fun of(res: File, icon: Document): IconLayers {
            val root = icon.documentElement
            val foreground = root.layer("foreground")
            val vector = foreground?.let { drawnVector(res, it) } ?: throw PatchException(
                "Custom launcher icon: the icon's foreground \"${foreground?.getAttribute(DRAWABLE).orEmpty()}\" " +
                    "isn't a single vector, so the note can't be read from it. Nothing was changed.",
            )
            return IconLayers(root.layer("background")?.let { drawnVector(res, it) }, vector)
        }

        /** The vector a layer element draws inline, or the one its drawable names. */
        private fun drawnVector(res: File, layer: Element): Element? =
            layer.layer("vector") ?: layerVector(res, layer.getAttribute(DRAWABLE))
    }
}

/**
 * Restyles one adaptive icon in place and gives it a themed layer.
 *
 * <p>Each new layer is an inline vector inside the layer's element, which AdaptiveIconDrawable
 * reads when the element names no drawable. TikTok's own drawables stay untouched, so nothing
 * else that draws them changes. The themed layer is the foreground's white note alone: Android
 * 13 launchers draw that shape in the wallpaper color, and the cyan and red slivers would only
 * thicken it. An icon that already has a themed layer keeps it. Returns whether one was added.
 */
internal fun restyleAdaptiveIcon(icon: Document, layers: IconLayers, style: IconStyle): Boolean {
    val root = icon.documentElement
    if (root?.tagName != ADAPTIVE_ICON) throw PatchException("Custom launcher icon: the icon isn't an adaptive icon.")
    val note = glyphVector(icon, layers.foreground, GLYPH_FILL)
    style.background?.let { color ->
        val background = layers.background ?: throw PatchException(
            "Custom launcher icon: the icon's background isn't a single vector, so the " +
                "\"${style.label}\" style can't recolor it. Nothing was changed.",
        )
        val layer = root.layer("background") ?: throw PatchException("Custom launcher icon: the icon has no background layer.")
        layer.drawInline(recolored(icon, background, color))
    }
    style.glyph?.let { color ->
        val layer = root.layer("foreground") ?: throw PatchException("Custom launcher icon: the icon has no foreground layer.")
        layer.drawInline(glyphVector(icon, layers.foreground, color))
    }
    if (root.layer(MONOCHROME) != null) return false
    val monochrome = icon.createElement(MONOCHROME)
    monochrome.appendChild(note)
    root.appendChild(monochrome)
    return true
}

/** A copy of [vector] in [target] with every path filled with [color]. */
internal fun recolored(target: Document, vector: Element, color: String): Element {
    val copy = copyInto(target, vector) { true }
    val paths = copy.getElementsByTagName("path").elements()
    if (paths.isEmpty()) throw PatchException("Custom launcher icon: the icon's background has no shape to recolor.")
    paths.forEach { it.setAttribute(FILL_COLOR, color) }
    return copy
}

/** A copy of [vector] in [target] that keeps only the note's white paths, filled with [color]. */
internal fun glyphVector(target: Document, vector: Element, color: String): Element {
    val copy = copyInto(target, vector) { element ->
        element.tagName != "path" || isGlyphFill(element.getAttribute(FILL_COLOR))
    }
    val paths = copy.getElementsByTagName("path").elements()
    if (paths.isEmpty()) {
        throw PatchException("Custom launcher icon: the icon's foreground has no white note to draw. Nothing was changed.")
    }
    paths.forEach { it.setAttribute(FILL_COLOR, color) }
    return copy
}

private fun isGlyphFill(color: String): Boolean = color.lowercase() in setOf(GLYPH_FILL, "#ffffff", "#fff")

/**
 * Copies [source] and the child elements [keep] accepts into [target], attribute by attribute,
 * so the copy belongs to [target] whatever DOM implementation read [source]. Namespace
 * declarations stay behind: the adaptive icon's root declares `android`, and any other prefix the
 * source declares moves to that root so the copy still resolves.
 */
internal fun copyInto(target: Document, source: Element, keep: (Element) -> Boolean): Element {
    val root = target.documentElement
    val copy = target.createElement(source.tagName)
    val attributes = source.attributes
    for (index in 0 until attributes.length) {
        val attribute = attributes.item(index)
        val name = attribute.nodeName
        if (name == "xmlns" || name.startsWith("xmlns:")) {
            if (name != "xmlns" && !root.hasAttribute(name)) root.setAttribute(name, attribute.nodeValue)
            continue
        }
        copy.setAttribute(name, attribute.nodeValue)
    }
    for (child in source.childNodes.elements()) {
        if (keep(child)) copy.appendChild(copyInto(target, child, keep))
    }
    return copy
}

/** Draws [vector] inside this layer element instead of the drawable it named. */
private fun Element.drawInline(vector: Element) {
    removeAttribute(DRAWABLE)
    while (firstChild != null) removeChild(firstChild)
    appendChild(vector)
}

private fun Element.layer(tag: String): Element? = childNodes.elements().firstOrNull { it.tagName == tag }

/** A read-only parse: the files read here are never written back. */
internal fun readXml(file: File): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file)
