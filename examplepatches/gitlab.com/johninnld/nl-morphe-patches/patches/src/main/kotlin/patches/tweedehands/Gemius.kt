package patches.tweedehands

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import patches.marktplaats.exact

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressGemius() {
    // The feature gate prevents event construction and startup; SDK boundaries
    // also cover restored state and callers that do not consult that gate.
    exact("Lcom/horizon/android/core/tracking/config/a;", "p()Z", 0, 0, 0)
        .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    exact("Lr03;", "a()V", 0, 0, 0).addInstructions(0, "return-void")
    exact("Lr03;", "b(Z)V", 0, 0, 0).addInstructions(0, "const/4 p1, 0x0")
    exact("Lcom/gemius/sdk/Config;", "isUserTrackingEnabled()Z", 0, 0, 0)
        .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    exact("Lcom/gemius/sdk/Config;", "setUserTrackingEnabled(Z)V", 0, 0, 0)
        .addInstructions(0, "const/4 p0, 0x0")
    exact("Lcom/gemius/sdk/audience/AudienceEvent;", "sendEvent()V", 0, 0, 0)
        .addInstructions(0, "return-void")
    exact("Lcom/gemius/sdk/audience/AudienceEvent;", "flushBuffer(Z)V", 0, 0, 0)
        .addInstructions(0, "return-void")
}
