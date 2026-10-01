package anxyis.morphe.patches.pure.content

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import org.w3c.dom.Element

/**
 * Dev Settings "Extra Features" section (replaces Tanryu's "TanRyu Features").
 *
 * FACTS (5.0.270, verified against stock + Tanryu trees):
 * - Stock res/xml/dev_preferences.xml has NO mod section; Tanryu prepends
 *   two PreferenceCategory blocks: "TanRyu Features" (7 switches) + "Old
 *   Settings" (Telegram promo + 7 legacy prefs moved from preferences.xml).
 * - Of the 7 feature toggles, only ONE has app code behind it in Tanryu's
 *   tree: amoledTheme (read by com/tanryu/optimizer ThemeAndRenderOptimizer,
 *   CoolBoot, portal — all DROPPED engine code in Pure). The other 6 keys
 *   (unlock120fps, renderPreview, hqPlayback, unlockExport, noWatermark,
 *   forceHwAccel) are read NOWHERE in Tanryu's dex (verified: zero hits in
 *   all 9 dex string pools) — pure placebo switches.
 * - The "Old Settings" legacy prefs (watermark, lowQualityPreview,
 *   controlpadAccel, thumbBounds, recentMediaSize, grayTheme,
 *   clearExportCache) DO have stock backing: same keys + handlers exist in
 *   stock preferences.xml / hQZ/iE (watermark auto-removed from dev screen
 *   at runtime). Moving them here only duplicates UI.
 *
 * Pure policy: ship the LOOK (Extra Features header + the 6 placebo
 * switches users expect, WITHOUT the Telegram promo and WITHOUT the
 * engine-wired amoledTheme which has no backing code in Pure) and DON'T
 * duplicate the legacy prefs (their stock homes work; moving them would
 * orphan the preferences.xml copies... actually both would work — but the
 * earlier Pure build already deleted the Telegram row and users asked only
 * for the feature toggles, so keep it minimal and honest).
 *
 * Implementation: DOM surgery on res/xml/dev_preferences.xml — insert the
 * Extra Features PreferenceCategory as the FIRST child of the root
 * PreferenceScreen. All literals (titles/summaries); keys preserved
 * verbatim so any future reader finds them. No @string/@array refs (all
 * inline, like Tanryu's block) — zero new resource dependencies.
 */
private const val HEADER_KEY = "header.com.tanryu.motion.features"

private val SWITCHES = listOf(
    Triple(
        "Unlock 120 FPS",
        "com.alightcreative.motion.unlock120fps",
        "Enable 120 FPS export and playback",
    ),
    Triple(
        "Render Preview",
        "com.alightcreative.motion.renderPreview",
        "Enable real-time render preview while editing",
    ),
    Triple(
        "High Quality Playback",
        "com.alightcreative.motion.hqPlayback",
        "Use higher quality playback rendering",
    ),
    Triple(
        "Unlock All Export Options",
        "com.alightcreative.motion.unlockExport",
        "Enable the custom export-options flag",
    ),
    Triple(
        "Disable Watermark",
        "com.alightcreative.motion.noWatermark",
        "Enable the custom export watermark flag",
    ),
    Triple(
        "Force Hardware Acceleration",
        "com.alightcreative.motion.forceHwAccel",
        "Enable the custom hardware-rendering flag",
    ),
)

@Suppress("unused")
val devPrefsSectionPatch = resourcePatch(
    name = "Extra settings",
    description = "Adds extra toggles in Developer Settings.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        document("res/xml/dev_preferences.xml").use { doc ->
            val root = doc.documentElement
            if (root.tagName != "PreferenceScreen") {
                throw PatchException(
                    "Pure: dev_preferences root = ${root.tagName}, expected PreferenceScreen",
                )
            }
            // Idempotence guard: exactly one header with our key.
            var existing = 0
            val cats = doc.getElementsByTagName("PreferenceCategory")
            for (i in 0 until cats.length) {
                val el = cats.item(i) as? Element ?: continue
                if (el.getAttribute("android:key") == HEADER_KEY) existing++
            }
            if (existing != 0) {
                throw PatchException("Pure: Extra Features header already present x$existing")
            }
            val category = doc.createElement("PreferenceCategory")
            category.setAttribute("android:layout", "@layout/dev_pref_header")
            category.setAttribute("android:title", "Extra Features")
            category.setAttribute("android:key", HEADER_KEY)
            category.setAttribute("app:iconSpaceReserved", "false")
            for ((title, key, summary) in SWITCHES) {
                val sw = doc.createElement("SwitchPreference")
                sw.setAttribute("android:title", title)
                sw.setAttribute("android:key", key)
                sw.setAttribute("android:summary", summary)
                sw.setAttribute("android:defaultValue", "false")
                sw.setAttribute("app:iconSpaceReserved", "false")
                category.appendChild(sw)
            }
            root.insertBefore(category, root.firstChild)
            // Assert: 1 header + 6 switches.
            var switches = 0
            val all = doc.getElementsByTagName("SwitchPreference")
            for (i in 0 until all.length) {
                val el = all.item(i) as? Element ?: continue
                if (el.parentNode == category) switches++
            }
            if (switches != 6) {
                throw PatchException("Pure: Extra Features switches = $switches, expected 6")
            }
        }
    }
}
