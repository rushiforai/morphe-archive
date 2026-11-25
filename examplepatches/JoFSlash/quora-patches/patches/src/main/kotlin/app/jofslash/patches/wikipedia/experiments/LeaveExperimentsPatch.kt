package app.jofslash.patches.wikipedia.experiments

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.jofslash.patches.wikipedia.shared.methodOf
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val AB_TEST = "Lorg/wikipedia/analytics/ABTest;"

@Suppress("unused")
val leaveExperimentsPatch = bytecodePatch(
    name = "Leave experiments",
    description = "Puts you in the control group of every A/B test, so you get the app as it is for " +
            "everyone and not features Wikimedia is trying out on some users (for example extra " +
            "notifications about trending articles, semantic search or donation reminders). Off by " +
            "default, because you also miss new features while they are tested.",
    default = false
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        // Every A/B test reads its group through ABTest.getGroup, which picks a random group the
        // first time. Group 0 (GROUP_1) is "control" in every test.
        methodOf(AB_TEST, "getGroup", emptyList()).addInstructions(
            0,
            """
                const/4 v0, 0x0
                iput v0, p0, $AB_TEST->testGroup:I
                return v0
            """
        )
    }
}
