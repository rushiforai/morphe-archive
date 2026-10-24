package app.dieroboter.patches.videotogif

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.dieroboter.patches.shared.Constants.COMPATIBILITY_VIDEO_TO_GIF
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

private val HIDDEN_SETTINGS_KEYS = setOf(
    "pref_support",
    "pref_rate_us",
    "pref_share_app"
)

/**
 * Internal resource step for "Hide settings buttons".
 *
 * Two files:
 * - res/xml/ph_settings.xml (the PremiumHelper 5.3.2 settings screen):
 *   the "VIP Customer Support" row (PremiumSupportPreference, key
 *   pref_support), the "Rate us" row (RateUsPreference, key
 *   pref_rate_us) and the "Share app" row (SafeClickPreference, key
 *   pref_share_app) each get app:isPreferenceVisible="false" — the same
 *   attribute the file itself already uses to keep "Manage subscriptions"
 *   hidden until it applies. The rows stay in the hierarchy: the
 *   settings fragment (PhSettingsFragment) looks every key up with
 *   findPreference and null-checks the results, and its only setVisible
 *   call targets pref_delete_account, so nothing re-shows these rows
 *   and nothing dereferences a missing preference.
 * - res/layout/activity_home.xml: the home bar's RecyclerView
 *   (@id/home_tool) drops from spanCount 3 to 2, so the two buttons
 *   that remain after the bytecode step removes the rate button split
 *   the bar evenly instead of leaving an empty third column.
 *
 * Both edits fail loudly if their anchors are absent, so an upstream
 * rework cannot turn them into silent no-ops.
 */
private val hideSettingsButtonsResourcePatch = resourcePatch {
    execute {
        document("res/xml/ph_settings.xml").use { document ->
            val elements = document.getElementsByTagName("*")
            val hidden = mutableSetOf<String>()
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                val key = element.getAttribute("app:key")
                    .ifEmpty { element.getAttribute("android:key") }
                if (key in HIDDEN_SETTINGS_KEYS) {
                    element.setAttribute("app:isPreferenceVisible", "false")
                    hidden += key
                }
            }
            val missing = HIDDEN_SETTINGS_KEYS - hidden
            if (missing.isNotEmpty()) {
                throw PatchException("Settings rows not found in ph_settings.xml: $missing")
            }
        }

        document("res/layout/activity_home.xml").use { document ->
            val views = document.getElementsByTagName(
                "androidx.recyclerview.widget.RecyclerView"
            )
            var resized = false
            for (i in 0 until views.length) {
                val element = views.item(i) as Element
                if (element.getAttribute("android:id") == "@id/home_tool") {
                    if (element.getAttribute("app:spanCount") != "3") {
                        throw PatchException(
                            "Unexpected home_tool spanCount in activity_home.xml: " +
                                element.getAttribute("app:spanCount")
                        )
                    }
                    element.setAttribute("app:spanCount", "2")
                    resized = true
                }
            }
            if (!resized) {
                throw PatchException("home_tool RecyclerView not found in activity_home.xml")
            }
        }
    }
}

/**
 * Hide settings buttons (GIF Maker 2.0.8).
 *
 * The settings rows are hidden by the resource step above. This
 * bytecode step hides the remaining rate surface: the star button on
 * the home screen's bottom bar.
 *
 * The bar is a RecyclerView (@id/home_tool in activity_home.xml) fed
 * by HomeFactory (L4/j).a(), which builds the tool list
 * [HOME_TOOL_RATE, HOME_TOOL_SETTING, HOME_TOOL_FEEDBACK] (the third
 * entry is HOME_TOOL_PREMIUM instead when the premium verdict is off)
 * as a filled-new-array and maps each entry to its icon. The patch
 * rewrites that one instruction to a two-element array without the
 * rate entry — the surviving registers are taken from the instruction
 * itself — so the rate button is never created. Its click branch in
 * ActivityHome becomes unreachable and is left in place; the support
 * (feedback) button on the same bar is untouched.
 *
 * The "Rate us" settings row is additionally hidden by "Disable rate
 * prompts" (a constructor-level setVisible(false)); this patch owns
 * the row independently of that one.
 */
@Suppress("unused")
val hideSettingsButtonsPatch = bytecodePatch(
    name = "Hide settings buttons",
    description = "Hides the 'VIP Customer Support', 'Rate us' and 'Share app' rows " +
        "in the settings screen, and the rate button on the home screen bar. " +
        "The support button on the home screen is not affected.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VIDEO_TO_GIF)
    dependsOn(hideSettingsButtonsResourcePatch)

    execute {
        val method = HomeToolsFingerprint.method
        val instructions = method.implementation!!.instructions

        val arrayIndex = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.FILLED_NEW_ARRAY &&
                (instruction as? ReferenceInstruction)?.reference?.toString() == "[LL4/j\$b;"
        }
        if (arrayIndex < 0) {
            throw PatchException("Home tools array not found in HomeFactory.a()")
        }
        val loadsRate = (0 until arrayIndex).any { index ->
            (instructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                "LL4/j\$b;->HOME_TOOL_RATE:LL4/j\$b;"
        }
        if (!loadsRate) {
            throw PatchException("HOME_TOOL_RATE load not found before the home tools array")
        }
        val arrayInstruction = instructions[arrayIndex] as Instruction35c
        if (arrayInstruction.registerCount != 3) {
            throw PatchException(
                "Expected 3 home tools in HomeFactory.a(), " +
                    "found ${arrayInstruction.registerCount}"
            )
        }

        method.replaceInstruction(
            arrayIndex,
            "filled-new-array {v${arrayInstruction.registerD}, " +
                "v${arrayInstruction.registerE}}, [LL4/j\$b;"
        )
    }
}
