package semicoloncolonel.mobilestream.patches.yahoonews.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo News 100.1.1 — video ads opt-out and tracking IDs.
//
// Yahoo's video player (com.verizondigitalmedia) reads its settings from
// SapiMediaItemProviderConfig. When isAdsOptOut() is true, each video request
// sends dnt=true and leaves out the device ID. It now always answers true, and
// the IDs the player could still attach answer empty: the device ID used for
// ads (getEffectiveDeviceId) and the Yahoo AXID list (getCurrentAxidsJsonString).
//
// Every Yahoo News patch depends on this one, so it applies whenever any of
// them is chosen.
// ─────────────────────────────────────────────────────────────────────────────

internal const val SAPI_CONFIG =
    "Lcom/verizondigitalmedia/mobile/client/android/sapiMediaItemProvider/config/SapiMediaItemProviderConfig;"

internal object AdsOptOutFingerprint : Fingerprint(
    definingClass = SAPI_CONFIG,
    name = "isAdsOptOut",
    parameters = listOf(),
    returnType = "Z",
)

internal object EffectiveDeviceIdFingerprint : Fingerprint(
    definingClass = SAPI_CONFIG,
    name = "getEffectiveDeviceId",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

internal object CurrentAxidsFingerprint : Fingerprint(
    definingClass = SAPI_CONFIG,
    name = "getCurrentAxidsJsonString",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

internal val videoOptOutPatch = bytecodePatch {
    execute {
        AdsOptOutFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
        EffectiveDeviceIdFingerprint.method.addInstructions(
            0,
            """
                const-string v0, ""
                return-object v0
            """,
        )
        CurrentAxidsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
