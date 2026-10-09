/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.tiktok.misc.theme

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.diagnostics.BUILD_DETAILS_ASSET
import app.morphe.patches.tiktok.misc.diagnostics.BuildChoice
import app.morphe.patches.tiktok.misc.diagnostics.BuildDetails
import app.morphe.patches.tiktok.misc.diagnostics.buildChoicePatch
import java.io.File
import org.w3c.dom.Document
import org.w3c.dom.Element

@Suppress("unused")
val amoledThemePatch = resourcePatch(
    name = "AMOLED dark theme",
    description = "Replaces TikTok's dark background palette with black or a chosen color. The light theme keeps its colors. It rewrites TikTok's resources, so patching with it on is slower when the manager's memory limit is low. Give the manager 768 MB or more. At 640 MB it still finishes, just more slowly.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(buildChoicePatch(BuildChoice.AMOLED))
    val background by colorOption(
        key = "backgroundColor",
        default = "#000000",
        title = "Dark background color",
        description = "An opaque hex color. Black turns off OLED pixels on the main dark surfaces.",
        values = mapOf("Black" to "#000000", "Mocha" to "#181825", "Dark gray" to "#121212"),
    )
    execute {
        val packageRoot = get("res").parentFile
        val decodedRoots = decodedPackageRoots(packageRoot)
        val collisions = renamedPathCollisions(
            entries = listApkEntries("res/"),
            decodedDirectories = decodedResourceDirectories(decodedRoots),
            aliasOf = { name -> get(name).relativeTo(packageRoot).invariantSeparatorsPath },
            isDecoded = { name -> decodedRoots.any { it.resolve(name).isFile } },
        )
        if (collisions.isNotEmpty()) throw PatchException(renamedPathsRefusal(collisions.size))
        val color = background ?: throw PatchException("Choose a background color")
        if (!Regex("#[0-9a-fA-F]{6}|#[fF]{2}[0-9a-fA-F]{6}").matches(color)) {
            throw PatchException("Background color must be opaque #RRGGBB or #FFRRGGBB")
        }
        // The dark token block's background grays under this build's own names. Read before any
        // file is touched: a build whose palette was never read is refused with nothing changed.
        val backgrounds = darkBackgroundColors(packageMetadata.versionName)
        val found = mutableSetOf<String>()
        val styleItemsFound = mutableSetOf<String>()
        val valuesDirectories = get("res").listFiles().orEmpty()
            .filter { it.isDirectory && it.name.startsWith("values") }
        valuesDirectories.map { it.resolve("colors.xml") }.filter { it.exists() }.forEach { file ->
            document(file.relativeTo(get(".")).invariantSeparatorsPath).use { xml ->
                val colors = xml.getElementsByTagName("color")
                for (index in 0 until colors.length) {
                    val entry = colors.item(index) as Element
                    val name = entry.getAttribute("name")
                    if (name in backgrounds) {
                        entry.textContent = color
                        found.add(name)
                    }
                }
            }
        }
        // The comments sheet and the share sheet never touch colors.xml. Both fill with
        // attr/a24 (traced on 47.0.3: the comment page's af4/af9 shapes, and the Tux sheet's
        // background attribute b79), which the dark themes send to attr/aia, and every value aia
        // has is a literal inside a <style>. 46.x reached the same sheets through agk (comments)
        // and c3 (share), which 47.x keeps as dark surface tokens of their own. Only a dark
        // literal is rewritten, so a light style's white stays white.
        valuesDirectories.map { it.resolve("styles.xml") }.filter { it.exists() }.forEach { file ->
            document(file.relativeTo(get(".")).invariantSeparatorsPath).use { xml ->
                styleItemsFound += rewriteDarkStyleItems(xml, SHEET_STYLE_ITEMS, color)
            }
        }
        if (found != backgrounds) throw PatchException("Dark background palette is incomplete: $found")
        // The palette check above refuses every build whose names weren't read, so this is a
        // build whose sheet names are known, and one missing means an identity is wrong.
        if (styleItemsFound != SHEET_STYLE_ITEMS) {
            throw PatchException("Dark sheet style items are incomplete: $styleItemsFound")
        }
        BuildDetails.amoled(get(BUILD_DETAILS_ASSET), color)
    }
}

internal fun renamedPathsRefusal(collisions: Int) =
    "AMOLED dark theme: this TikTok APK was merged from a split bundle in a way that moved " +
        "its resource files into new folders, and $collisions of their paths clash with the " +
        "names the resource rebuild gives other files. The rebuild would drop files and " +
        "TikTok would crash at launch. Nothing was changed. Patch the .apkm in Morphe Manager, " +
        "which keeps TikTok's own paths, or patch the full APK from APKMirror."

/**
 * The decoded package directories: the one holding [packageRoot] and its siblings that have a
 * `res` directory. Every resource package decodes to its own directory, and a clash can be in
 * any of them.
 */
internal fun decodedPackageRoots(packageRoot: File): List<File> =
    (listOf(packageRoot) + packageRoot.parentFile?.listFiles().orEmpty()
        .filter { it.isDirectory && it.resolve("res").isDirectory })
        .distinctBy { it.absoluteFile.normalize() }

/** Every `res/<folder>` the decoder wrote, across [roots]. */
internal fun decodedResourceDirectories(roots: List<File>): Set<String> =
    roots.flatMapTo(mutableSetOf()) { root ->
        root.resolve("res").listFiles().orEmpty().filter { it.isDirectory }.map { "res/${it.name}" }
    }

/**
 * Input resource paths that Morphe's resource rebuild can drop: a path whose own file was
 * decoded under another name (the path map renamed it) while another resource's decoded file
 * sits at that same path.
 *
 * <p>The decoder writes every resource file to `res/<type>/<entry name>` and records the
 * original archive path beside it; the rebuild renames each file back. TikTok's own paths are
 * short folders (`res/b/cfz.xml`), so nothing clashes, and Morphe Manager's merge of an .apkm
 * keeps them. The desktop CLI's merge moves every file into a folder named for its type and
 * keeps the short name, so entry `ac`'s file becomes `res/drawable/a0.xml`, which is also where
 * entry `a0`'s file decodes. On APKMirror's 46.2.3 and 47.0.3 bundles that made 14,468 and
 * 14,925 such clashes, the rebuild lost 1,375 and 1,361 files, all clashing paths, and TikTok died
 * inflating its first feed layout on the S22 (2026-09-18). Manager's merge of the same bundles
 * and both universal APKs have none and lose nothing. A file kept at its own path (Play's
 * `res/xml/splits0.xml` in a universal APK) is not a clash: its alias is itself.
 */
internal fun renamedPathCollisions(
    entries: Iterable<String>,
    decodedDirectories: Set<String>,
    aliasOf: (String) -> String,
    isDecoded: (String) -> Boolean,
): List<String> = entries.filter { name ->
    // The folder check comes first and is free: a clash can only sit where the decoder writes,
    // and on a clean input none of the archive's folders is one of those.
    name.substringBeforeLast('/', "") in decodedDirectories && aliasOf(name) != name && isDecoded(name)
}

/**
 * The dark theme's background grays, per build: the opaque dark grays of the color token block
 * the dark app themes set, which the surfaces read. The names are each build's own and move:
 * 47.0.3 and 47.1.3 each added a color ahead of the block, so every gray moved one name along,
 * and an older build's names there are an accent and see-through white overlays, which the patch
 * painted black until this was read off the fixture (AmoledPaletteTest holds every fixture's
 * block to its entry here). Only the declared build is listed, so a build the bundle moves to
 * needs its own entry read off its fixture. The block's pure black is a token of its own and
 * stays.
 */
internal val DARK_BACKGROUND_COLORS: Map<String, Set<String>> = linkedMapOf(
    "47.1.4" to setOf("a40", "a42", "a43", "a45", "a4c"),
)

/** This build's background grays, or a refusal: a name carried over from another build is a guess. */
internal fun darkBackgroundColors(versionName: String?): Set<String> =
    versionName?.let { DARK_BACKGROUND_COLORS[it] } ?: throw PatchException(unreadPaletteRefusal(versionName))

internal fun unreadPaletteRefusal(versionName: String?): String {
    val build = if (versionName.isNullOrBlank()) "this TikTok build" else "TikTok $versionName"
    val known = DARK_BACKGROUND_COLORS.keys.toList()
    val builds = if (known.size == 1) known.single() else known.dropLast(1).joinToString(", ") + " and " + known.last()
    return "AMOLED dark theme hasn't read the dark palette of $build, so nothing was changed. " +
        "TikTok renames its colors from one build to the next, and a name taken from another " +
        "build can paint an accent or an overlay black. The palette is known for TikTok $builds."
}

/** The builds the bundle declares. */
internal fun declaredVersions(): Set<String> =
    AppCompatibilities.tiktok().flatMap { it.targets }.mapNotNull { it.version }.toSet()

/**
 * The dark tokens behind TikTok's sheets. agk and c3 were the comments and share sheets' own
 * through 46.x and are dark surfaces of their own on 47.x. aia is the dark value for
 * UISheetFlat1 (attr/a24), which the comment panel, the share sheet and TikTok's other sheets,
 * panels and modals fill with (AmoledSheetTokensTest). 47.1.4 keeps every attr where 47.0.3 had
 * it (TuxSheet's background attribute is 0x7f0609fb), so the three names hold there. On 46.x
 * aia was another surface tier, which is why only a build whose palette was read is patched.
 */
internal val SHEET_STYLE_ITEMS = setOf("agk", "c3", "aia")

/**
 * Sets every `<item name="...">` in the named set whose value is a dark opaque colour literal
 * to [color], and returns the names it changed. A value that is a reference, translucent or
 * light is left alone: those are the light theme's and the overlays', not the surface.
 */
internal fun rewriteDarkStyleItems(styles: Document, names: Set<String>, color: String): Set<String> {
    val changed = mutableSetOf<String>()
    val items = styles.getElementsByTagName("item")
    for (index in 0 until items.length) {
        val item = items.item(index) as Element
        val name = item.getAttribute("name")
        if (name !in names || !isDarkOpaqueLiteral(item.textContent)) continue
        item.textContent = color
        changed.add(name)
    }
    return changed
}

/** `#RRGGBB` or `#FFRRGGBB`, every channel under 0x40: a surface colour, not a text or an overlay. */
internal fun isDarkOpaqueLiteral(value: String): Boolean {
    val hex = value.trim().removePrefix("#")
    val rgb = when (hex.length) {
        6 -> hex
        8 -> if (hex.startsWith("ff", ignoreCase = true)) hex.substring(2) else return false
        else -> return false
    }
    if (!rgb.all { it.isDigit() || it.lowercaseChar() in 'a'..'f' }) return false
    return rgb.chunked(2).all { it.toInt(16) < 0x40 }
}
