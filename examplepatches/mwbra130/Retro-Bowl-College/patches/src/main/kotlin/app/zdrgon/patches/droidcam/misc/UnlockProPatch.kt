package app.zdrgon.patches.droidcam.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.droidcam.shared.Constants.COMPATIBILITY_DROIDCAM

/**
 * Unlocks DroidCam Pro by forcing the license-verdict parser to return
 * 2 (the one-time Pro verdict) for every server reply.
 *
 * The app re-verifies silently on its own schedule (handler what=15,
 * arg1=2, arg2=-4): the applier calls the parser with the literal body
 * "not-null" when Play reports no purchase, and any verdict > 0 takes
 * the licensed branch — it writes the a_time preference roughly 7 days
 * out, resets the failure counter, and the UI treats the app as Pro.
 * Because the check re-runs on its own, the grant keeps renewing
 * itself; no purchase flow or user action is needed.
 *
 * Verified live on DroidCam 9.0 (vc76), 2026-11-04: Frida tracing
 * showed the applier calling the parser with "not-null" repeatedly
 * from startup; with the parser forced to 2, a_time went from 0 to
 * now + 7 days and the GET PRO page showed as granted.
 *
 * Requires "Disable PairIP protection" (+ its runtime files): without
 * them the re-signed app never gets far enough to verify anything.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks DroidCam Pro (HD/4K, no watermark, all options): the license " +
        "verdict is forced to Pro and renews itself at every silent re-check. " +
        "Requires 'Disable PairIP protection'. DroidCam 9.0 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DROIDCAM)

    execute {
        VerdictParserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x2
                return v0
            """,
        )
    }
}
