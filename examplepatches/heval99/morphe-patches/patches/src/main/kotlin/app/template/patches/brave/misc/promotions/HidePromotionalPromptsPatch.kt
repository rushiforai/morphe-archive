package app.template.patches.brave.misc.promotions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BRAVE_EXPERIMENTAL
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val SHARED_PREFERENCES = "Landroid/content/SharedPreferences;"

/**
 * Overrides the value a method reads for [prefKey] from SharedPreferences: finds the
 * `const-string prefKey` followed closely by `getter`, and sets the getter's result register
 * to [value] right after its move-result.
 */
context(_: BytecodePatchContext)
private fun forcePrefRead(
    prefKey: String,
    getter: String,
    value: Int,
    definingClass: String? = null,
    strings: List<String>? = null,
) {
    val fingerprint = Fingerprint(
        definingClass = definingClass,
        strings = strings,
        filters = listOf(
            string(prefKey),
            methodCall(
                definingClass = SHARED_PREFERENCES,
                name = getter,
                location = InstructionLocation.MatchAfterWithin(5),
            ),
        ),
    )
    val moveResultIndex = fingerprint.instructionMatches[1].index + 1
    val method = fingerprint.method
    val register = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
    // const/16 takes any 8-bit register; const/4 would fail above v15.
    method.addInstruction(moveResultIndex + 1, "const/16 v$register, $value")
}

@Suppress("unused")
val hidePromotionalPromptsPatch = bytecodePatch(
    name = "Hide promotional prompts",
    description = "Experimental: stops the recurring \"Set Brave as default browser\" dialog, " +
        "the \"Rate Brave\" dialog and card, retention and Rewards promo notifications, the " +
        "search widget promo and the VPN card in Settings.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BRAVE_EXPERIMENTAL)

    execute {
        // ── 1. Default browser nag (system RoleManager dialog after 7 and 15 days) ─────────
        //  The startup check skips the whole nag when the stored day count is -1, which is
        //  Brave's own "never again" value.
        forcePrefRead(
            prefKey = "brave_default_timer_day",
            getter = "getInt",
            value = -1,
            strings = listOf("brave_default_app_open_counter"),
        )

        // ── 2. "Rate Brave" startup dialog and Brave News feed card ────────────────────────
        //  Settings > Rate Brave opens the dialog directly and keeps working.
        Fingerprint(
            returnType = "Z",
            parameters = listOf("Landroid/content/Context;"),
            strings = listOf("qa_force_rate_dialog", "next_rate_date"),
        ).method.returnEarly(false)

        // ── 3. Retention and Rewards promo notifications ───────────────────────────────────
        //  a(Context, Intent) only posts the notification; onReceive (tap handling) is kept.
        Fingerprint(
            definingClass = "Lorg/chromium/chrome/browser/notifications/retention/RetentionNotificationPublisher;",
            returnType = "V",
            parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
            strings = listOf("notification_type"),
            custom = { method, _ -> method.name != "onReceive" },
        ).method.returnEarly()

        // ── 4. "Try the Brave Search widget" popup ─────────────────────────────────────────
        forcePrefRead(
            prefKey = "should_show_search_widget_promo",
            getter = "getBoolean",
            value = 0,
        )

        // ── 5. Brave VPN callout card in Settings ──────────────────────────────────────────
        forcePrefRead(
            prefKey = "brave_vpn_callout",
            getter = "getBoolean",
            value = 0,
            definingClass = "Lorg/chromium/chrome/browser/settings/BraveMainPreferencesBase;",
        )
    }
}
