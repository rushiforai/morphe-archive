package app.blockblast.patches.premium

import app.morphe.patcher.Fingerprint

/**
 * wf/j.smali - Subscription verification entry point.
 * Method e(String)V checks SPStore subscription state.
 * When SPStore.p() == 1, calls notifySubStateUpdate() directly.
 * Body is replaced: always calls notifySubStateUpdate() regardless of state.
 */
object SubscriptionCheckFingerprint : Fingerprint(
    definingClass = "Lwf/j;",
    name = "e",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)
