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
import org.w3c.dom.Document
import org.w3c.dom.Element

@Suppress("unused")
val amoledThemePatch = resourcePatch(
    name = "AMOLED dark theme",
    description = "Replaces TikTok's dark background palette with black or a chosen color. The light theme keeps its colors. It is the one patch that rewrites resources, so patching with it on needs the memory limit raised to 768 MB.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4703())
    val background by colorOption(
        key = "backgroundColor",
        default = "#000000",
        title = "Dark background color",
        description = "An opaque hex color. Black turns off OLED pixels on the main dark surfaces.",
        values = mapOf("Black" to "#000000", "Mocha" to "#181825", "Dark gray" to "#121212"),
    )
    execute {
        document("AndroidManifest.xml").use { manifest ->
            if (isMergedSplitBundle(manifest)) throw PatchException(MERGED_BUNDLE_REFUSAL)
        }
        val color = background ?: throw PatchException("Choose a background color")
        if (!Regex("#[0-9a-fA-F]{6}|#[fF]{2}[0-9a-fA-F]{6}").matches(color)) {
            throw PatchException("Background color must be opaque #RRGGBB or #FFRRGGBB")
        }
        // Verified dark-only palette in 46.2.3 and 47.0.3. Window backgrounds already resolve
        // attr/fx_ to a40; the light styles use their separate light palette. a4a is the
        // fifth member of the same dark token block (attr/fxx), read by 48 layouts.
        val backgrounds = setOf("a3y", "a40", "a41", "a43", "a4a")
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
        // The comments sheet and the share sheet never touch colors.xml: the sheet shape's
        // fill is attr/a1b, which the dark themes send to attr/agk, and every value agk has is
        // a literal inside a <style>. The share panel's fill is attr/p7 -> attr/c3, the same
        // way. Only a dark literal is rewritten, so a light style's white stays white.
        valuesDirectories.map { it.resolve("styles.xml") }.filter { it.exists() }.forEach { file ->
            document(file.relativeTo(get(".")).invariantSeparatorsPath).use { xml ->
                styleItemsFound += rewriteDarkStyleItems(xml, SHEET_STYLE_ITEMS, color)
            }
        }
        if (found != backgrounds) throw PatchException("Dark background palette is incomplete: $found")
        checkSheetStyleItems(styleItemsFound, packageMetadata.versionName, declaredVersions())
    }
}

internal const val MERGED_BUNDLE_REFUSAL =
    "AMOLED dark theme: this TikTok APK was merged from a split bundle (an .apkm file), and " +
        "rebuilding its resources loses about 1,400 of them, so TikTok would crash at launch. " +
        "Nothing was changed. Untick this patch, or patch the full APK from APKMirror."

/**
 * Whether the APK was merged from split APKs rather than shipped whole.
 *
 * <p>This is the one patch that rewrites resources, and on the APKMirror 46.2.3 bundle merged
 * by Morphe the rewritten APK came out with 1,375 resource entries pointing at files it no
 * longer carried (23,668 res files in, 22,293 out). TikTok then died inflating its first feed
 * layout (layout/ceo, a missing background drawable) on the S22, 2026-09-18. The same patch
 * on the universal APK leaves nothing dangling. Every whole APK on the desk keeps Play's
 * `com.android.vending.splits` meta-data, and merging removes it, so its absence is the tell.
 */
internal fun isMergedSplitBundle(manifest: Document): Boolean {
    val metaData = manifest.getElementsByTagName("meta-data")
    for (index in 0 until metaData.length) {
        val name = (metaData.item(index) as Element).getAttribute("android:name")
        if (name == "com.android.vending.splits") return false
    }
    return true
}

/** The builds this patch is declared for, where the sheet style names are known to be right. */
internal fun declaredVersions(): Set<String> =
    AppCompatibilities.tiktok4703().flatMap { it.targets }.mapNotNull { it.version }.toSet()

/**
 * On a declared build every sheet item has to have been found: the names are that build's,
 * and one missing means an identity is wrong. On a build the patch was forced onto, the
 * names are not promised. What matched was rewritten, and the failure is nothing matching
 * at all, which says the sheet lookup itself no longer works there. 46.7.3 has the comments
 * sheet's item and not the share sheet's, and a whole patch that fails over one grey sheet
 * on a build it never claimed is the wrong trade.
 */
internal fun checkSheetStyleItems(found: Set<String>, versionName: String?, declared: Set<String>) {
    if (found == SHEET_STYLE_ITEMS) return
    if (versionName != null && versionName in declared) {
        throw PatchException("Dark sheet style items are incomplete: $found")
    }
    if (found.isEmpty()) throw PatchException("No dark sheet style item was found on $versionName")
}

/** The style items behind the comments sheet (agk) and share sheet (c3) through 47.0.3. */
internal val SHEET_STYLE_ITEMS = setOf("agk", "c3")

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
