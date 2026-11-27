package dev.brave.patches.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

internal object FirstRunFlowCompleteFingerprint : Fingerprint(
    definingClass = "Lio7;",
    name = "a",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("first_run_flow")
    )
)

@Suppress("unused")
val skipWelcomeScreensPatch = patch(
    name = "Skip Welcome Screens",
    description = "Reports the first-run onboarding flow as complete to bypass welcome screens on fresh installs."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        FirstRunFlowCompleteFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent()
            )
        }
    }
}
