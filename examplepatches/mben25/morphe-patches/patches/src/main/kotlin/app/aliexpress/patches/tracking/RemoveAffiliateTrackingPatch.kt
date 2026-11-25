package app.aliexpress.patches.tracking

import app.aliexpress.patches.shared.Constants.COMPATIBILITY_ALIEXPRESS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * `TrackHelper.b()Z` — "enableFirebaseLogEvent": every Firebase Analytics event the app logs
 * (attribution, purchase, view_item, …) is gated on it. It combines a FirebaseAnalytics instance,
 * the GDPR state and the Orange switch `firebase_event_switch`.
 *
 * The switch is also re-read from Orange at runtime (`v11/b` and `TrackHelper.l`), so stubbing
 * `<clinit>` like the original patch did only held until the first config push.
 */
internal object EnableFirebaseLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/aliexpress/track/TrackHelper;",
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("enableFirebaseLogEvent error:"),
)

@Suppress("unused")
val removeAffiliateTrackingPatch = bytecodePatch(
    name = "Remove affiliate tracking",
    description = "Disables the Firebase Analytics events AliExpress logs for attribution and " +
        "affiliate/marketing tracking.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        // `.locals 4`.
        EnableFirebaseLogEventFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
