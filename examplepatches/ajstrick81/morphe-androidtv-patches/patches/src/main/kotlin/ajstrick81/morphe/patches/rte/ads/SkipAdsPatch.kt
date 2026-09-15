package ajstrick81.morphe.patches.rte.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import ajstrick81.morphe.patches.rte.shared.Constants

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Suppresses client-side (VOD) Google IMA ads in the RTÉ Player Android TV app " +
        "by neutering the IMA AdsManager start and ad-event handler. Live DAI (server-stitched " +
        "SSAI) is not affected — that can't be removed client-side without breaking live content.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // Hook 1 — neuter the client VOD AdsManager start (return-void so the
        // loaded VAST AdsManager never begins playing ads). methodOrNull so a
        // future re-anchor miss degrades gracefully instead of aborting.
        ClientAdsManagerStartFingerprint.methodOrNull?.addInstructions(0, "return-void")

        // Hook 2 — neuter the client IMA AdEvent handler (belt-and-suspenders).
        ClientAdEventHandlerFingerprint.methodOrNull?.addInstructions(0, "return-void")

        // Hook 3 (seamless) — empty the ad-break SCHEDULE. z2/y.b(List)[J converts
        // the IMA cue points to a long[] of break times that becomes the player's
        // ad-break state; returning an empty long[] means no markers and no
        // scheduled pauses, so content plays straight through — while
        // onAdsManagerLoaded still runs, so content is never gated (unlike v2, which
        // hung on an infinite spinner). Hooks 1/2 remain as backup for the ad-play
        // path. Return a fresh empty long[0].
        CuePointsToTimesFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                new-array v0, v0, [J
                return-object v0
            """,
        )
    }
}
