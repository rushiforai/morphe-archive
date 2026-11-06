package app.zdrgon.patches.isslivenow.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.isslivenow.shared.Constants.COMPATIBILITY_ISS_LIVE_NOW

/**
 * ISS Live Now — Enable Premium.
 *
 * The app sells Pro as a single one-time product,
 * "isshdlive.proversion.purchased" (the paywall's "remove ads" offer).
 * Buying it ends — after a backend validation of the purchase — in one
 * local entitlement: the writer Ls2;->P0 (setProVersion) stores the
 * SharedPreferences boolean "pro_version", and every premium check in
 * the app reads it through one static method:
 *
 *   Ls2;->d0(Landroid/content/Context;)Z
 *     -> prefs boolean "pro_version", default false
 *
 * 49 call sites across 31 classes (MainActivity, PaywallActivity, the
 * TV UI, the billing helper, the ad paths) all go through that reader;
 * nothing reads the preference directly and nothing asks a server at
 * read time.
 *
 * This patch pins that reader to true, so the app runs with its Pro
 * state on: ads stay off and Pro features unlock, in the same state a
 * completed purchase produces. The pin is at the reader, so it does
 * not matter what any sync stores afterwards — the stored value is
 * simply never consulted.
 *
 * The patch creates no purchase and touches nothing in the billing
 * library; it only changes the app's own answer to its own question.
 * The paywall screen still opens if tapped, but the app already
 * believes Pro is active.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Turns on the app's Pro state (no ads, Pro features) as if the Pro version were purchased.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ISS_LIVE_NOW)

    execute {
        ProVersionFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
