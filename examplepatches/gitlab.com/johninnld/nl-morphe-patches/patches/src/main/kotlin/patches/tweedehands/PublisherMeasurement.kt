package patches.tweedehands

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import patches.marktplaats.exact

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressPublisherMeasurement() {
    // This admission only marks/queues register-view statistics. False retains
    // the truthful not-registered state, without a request or fake HTTP result.
    exact("Lcom/horizon/android/feature/vip/usecase/b;",
        "a(Lcom/horizon/android/core/datamodel/MpAd;Ljava/lang/String;ZLj43;)Z", 0, 0, 0)
        .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    // Select the native direct-contact route instead of tracked call handling.
    exact("Lcom/horizon/android/core/datamodel/AdFlags;", "getHasCallTracking()Z", 0, 0, 0)
        .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
}
