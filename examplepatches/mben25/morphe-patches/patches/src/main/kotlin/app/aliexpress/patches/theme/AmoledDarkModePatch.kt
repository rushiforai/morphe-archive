package app.aliexpress.patches.theme

import app.aliexpress.patches.shared.Constants.COMPATIBILITY_ALIEXPRESS
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import org.w3c.dom.Element

// ── How AliExpress dark mode works (8.162.8, obfuscated names) ────────────────
//
// The app ships a full dark theme (values-night, color-night, drawable-night, plus
// night-aware DX/ADC templates), driven by `u90/f`:
//
//   d() "isDarkNow" = i() && e()        → AppCompatDelegate.setDefaultNightMode(2 or 1)
//   i()             = system uiMode is night
//   e()             = f() && g()
//   f() / h()       = c.c() [Orange `global_enable_dark_mode_v2`, default true]
//                     && !b.a() [device blacklist, cached from b.c()]
//                     — h() also decides whether Settings shows the "Dark mode" row
//   g()             = c.d() [the in-app switch]
//
// b.c() blacklists the redmi/xiaomi/poco brands outright, so on a Redmi f() is false:
// no Settings row and never dark, whatever the system theme. The patch:
//   1. b.c() → false, so the feature and its Settings row are available on every device;
//   2. c.d() → true until the user has touched the switch, so the app follows the system
//      theme out of the box. Turning the switch off still works: the app's own setter sets
//      `is_local_dark_mode_changed`, after which the original logic runs untouched.
//   3. Night background/surface colors flattened from #191919/#1b1b1b to #000000.

/**
 * Night-qualified colors (res/values-night/colors.xml) that paint backgrounds or surfaces in
 * dark gray, flattened to pure black. Text/icon colors are left alone.
 */
private val AMOLED_NIGHT_COLOR_OVERRIDES = mapOf(
    "om_dark_white_bg" to "#000000",
    "msg_ui_floating_background" to "#000000",
    "search_box_bg_color" to "#000000",
)

private val amoledNightColorsPatch = resourcePatch {
    execute {
        document("res/values-night/colors.xml").use { document ->
            val colors = document.getElementsByTagName("color")
            for (i in 0 until colors.length) {
                val color = colors.item(i) as Element
                val newValue = AMOLED_NIGHT_COLOR_OVERRIDES[color.getAttribute("name")] ?: continue
                color.textContent = newValue
            }
        }
    }
}

@Suppress("unused")
val amoledDarkModePatch = bytecodePatch(
    name = "AMOLED dark mode",
    description = "Unlocks AliExpress' built-in dark mode on every device (Redmi/Xiaomi/POCO are " +
        "blacklisted by the app), turns it on by default so the app follows the system theme " +
        "(it can still be switched off in Settings > Dark mode), and makes dark backgrounds pure black.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    dependsOn(amoledNightColorsPatch)

    execute {
        // 1. Never blacklisted. `.locals 10`, so v0 is a plain local.
        DarkModeDeviceBlacklistFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // 2. Default the switch to on while the user has not changed it. `.locals 6`.
        LocalDarkModeEnabledFingerprint.method.apply {
            // The prefs reader `b(String, String)Z` — "true".equals(prefs.getString(key, def)).
            val prefsReader = LocalDarkModeEnabledFingerprint.classDef.methods.firstOrNull {
                it.returnType == "Z" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Ljava/lang/String;")
            }?.let { "${it.definingClass}->${it.name}(Ljava/lang/String;Ljava/lang/String;)Z" }
                ?: throw PatchException("AliExpress: dark mode prefs reader not found.")

            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "is_local_dark_mode_changed"
                    const-string v1, "false"
                    invoke-virtual {p0, v0, v1}, $prefsReader
                    move-result v0
                    if-nez v0, :original
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
