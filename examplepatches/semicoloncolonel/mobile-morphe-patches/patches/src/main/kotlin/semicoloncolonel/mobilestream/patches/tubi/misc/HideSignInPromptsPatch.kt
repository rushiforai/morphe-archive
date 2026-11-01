package semicoloncolonel.mobilestream.patches.tubi.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants

// Tubi works without an account. When a signed-out viewer pauses or leaves
// a title, the player asks them to sign in to save their progress. One
// method decides whether to show that prompt (hig.a in 10.43.1, R8-renamed)
// and returns a result whose no-argument constructor means "don't show".
//
// Left alone: the prompts that appear when you tap something that needs an
// account (My List, ratings, reminders), and Tubi's server-driven
// registration wall.
internal object SaveProgressPromptFingerprint : Fingerprint(
    strings = listOf("save_progress_prompt_dismissed_timestamp"),
    custom = { method, _ ->
        method.parameterTypes.size == 3 &&
            method.parameterTypes[0].toString() == "Lcom/tubitv/core/api/models/ContentApi;" &&
            method.parameterTypes[1].toString() == "F" &&
            method.returnType.startsWith("L")
    },
)

@Suppress("unused")
val hideSignInPromptsPatch = bytecodePatch(
    name = "Hide sign-in prompts",
    description = "Stops the Tubi phone app from asking you to sign in to save your progress " +
        "when you pause or leave a title. You can still sign in from the account screen.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        SaveProgressPromptFingerprint.method.apply {
            addInstructions(
                0,
                """
                    new-instance v0, $returnType
                    invoke-direct {v0}, $returnType-><init>()V
                    return-object v0
                """,
            )
        }
    }
}
