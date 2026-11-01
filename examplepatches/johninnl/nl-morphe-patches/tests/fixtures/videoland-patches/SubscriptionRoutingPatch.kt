package patches.videolandatv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

@Suppress("unused")
val subscriptionRoutingPatch = bytecodePatch(
    name = "Use original subscription targets (experimental)",
    description = "Routes subscription wrappers to their retained original destinations. Server media access and older-episode playback remain unverified. Other locks and backend errors remain active.",
    default = false,
) {
    compatibleWith(videolandTv)
    dependsOn(originalInput)
    execute {
        val (navigation, action) = subscriptionTargets()
        // v0/v2 are dead on entry; p1 is v12 and can use the short invoke/move
        // forms. No registers are added, so parameter positions cannot shift.
        // Null and nested subscription destinations retain the original fallback.
        navigation.addInstructionsWithLabels(0, """
            instance-of v0, p1, $SUBSCRIPTION
            if-eqz v0, :originalNavigation
            move-object v0, p1
            check-cast v0, $SUBSCRIPTION
            invoke-virtual {v0}, $SUBSCRIPTION->b()$TARGET
            move-result-object v0
            if-eqz v0, :originalNavigation
            instance-of v2, v0, $SUBSCRIPTION
            if-nez v2, :originalNavigation
            move-object p1, v0
        """.trimIndent(), ExternalLabel("originalNavigation", navigation.getInstruction(0)))

        // The original list already contains the full retained lock/target chain.
        // v6 is overwritten by the next original instruction. Go back to hasNext
        // so each entry is visited once; preserve the coroutine and Action object.
        action.addInstructionsWithLabels(113, """
            instance-of v6, v15, $SUBSCRIPTION
            if-nez v6, :nextRetainedTarget
        """.trimIndent(), ExternalLabel("nextRetainedTarget", action.getInstruction(107)))
    }
}
