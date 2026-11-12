package app.template.patches.flashscore.misc.font

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import org.w3c.dom.Element

private const val STYLES = "res/values/styles.xml"

/**
 * The layouts that set a custom family inline (26.11.4): the match page header, the squad rows and
 * the tooltip. A layout that is gone in a later build is skipped; the patch fails only if none is
 * left to rewrite.
 */
internal val FONT_LAYOUTS = listOf(
    "res/layout/duel_detail_header_with_tabs.xml",
    "res/layout/fragment_event_participant_page_squad_row.xml",
    "res/layout/tooltip_with_tip.xml",
)

/**
 * The XML half of "Use system font" (a dependency, not listed on its own). Flashscore's text
 * appearances and three layouts name the custom Livesport families directly (`@font/livesport`,
 * `@font/livesport_bold`, `@font/livesport_extrabold`, `@font/flashscore_numbers_regular`, ...),
 * so every TextView that uses them keeps the condensed app font even when the Compose typography
 * is redirected.
 *
 * Each reference is replaced with the matching system family, keeping the weight: extrabold ->
 * `sans-serif-black`, bold/medium -> `sans-serif-medium`, regular -> `sans-serif`. The font files
 * themselves are left in the APK; nothing else in the resource table is touched.
 *
 * Fixed 2026-11-07: the layouts were not rewritten at all (the match page header kept the custom
 * font). They are rewritten in finalize, one file at a time: decoding the whole layout tree would
 * reset the Settings layout that the Patch settings row patch edits.
 */
internal val useSystemFontStylesPatch = resourcePatch(
    description = "Points the app's XML text styles and layouts at the system font.",
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    execute {
        decode(STYLES)
        var replaced = 0

        // <item name="android:fontFamily">@font/...</item> in the text appearances.
        document(STYLES).use { doc ->
            val items = doc.getElementsByTagName("item")
            for (index in 0 until items.length) {
                val item = items.item(index) as? Element ?: continue
                val name = item.getAttribute("name")
                if (name != "android:fontFamily" && name != "fontFamily") continue
                val value = item.textContent?.trim().orEmpty()
                if (!value.startsWith("@font/")) continue
                item.textContent = systemFamily(value)
                replaced++
            }
        }

        if (replaced == 0) {
            throw PatchException("$STYLES: no @font/ reference was rewritten")
        }
    }

    // fontFamily="@font/..." attributes set inline in the layouts.
    finalize {
        var replaced = 0
        for (layout in FONT_LAYOUTS) {
            val decoded = runCatching { decode(layout).toList() }.getOrDefault(emptyList())
            if (decoded.isEmpty() || !get(layout).exists()) continue
            document(layout).use { doc ->
                val elements = doc.getElementsByTagName("*")
                for (index in 0 until elements.length) {
                    val element = elements.item(index) as? Element ?: continue
                    val attributes = element.attributes
                    for (a in 0 until attributes.length) {
                        val attribute = attributes.item(a)
                        if (!attribute.nodeName.endsWith("fontFamily")) continue
                        if (!attribute.nodeValue.startsWith("@font/")) continue
                        attribute.nodeValue = systemFamily(attribute.nodeValue)
                        replaced++
                    }
                }
            }
        }
        if (replaced == 0) {
            throw PatchException("no layout of ${FONT_LAYOUTS.joinToString()} sets a @font/ family any more")
        }
    }
}

/** Maps a `@font/...` reference to the system family with the closest weight. */
private fun systemFamily(resource: String): String {
    val name = resource.substringAfterLast('/').lowercase()
    return when {
        "extrabold" in name || "extra_bold" in name -> "sans-serif-black"
        "bold" in name || "medium" in name || "semi" in name -> "sans-serif-medium"
        else -> "sans-serif"
    }
}
