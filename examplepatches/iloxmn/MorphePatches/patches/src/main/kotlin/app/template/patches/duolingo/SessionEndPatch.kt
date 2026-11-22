package app.template.patches.duolingo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_DUOLINGO

@Suppress("unused")
val sessionEndPatch = patch(
    name = "Skip Session-End Screens",
    description = "Pass an empty session-end screen list to Duolingo.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DUOLINGO)

    execute {
        val callIndex = SessionEndFingerprint.instructionMatches.single().index
        SessionEndFingerprint.method.addInstructions(
            callIndex,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v1
            """,
        )
    }
}
