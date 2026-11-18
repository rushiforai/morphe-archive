package app.medium.patches.medium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.medium.patches.shared.Constants.COMPATIBILITY_MEDIUM

private const val EXTENSION_CLASS = "Lapp/medium/extension/MediumPatchExtension;"

@Suppress("unused")
val translatePatch = patch(
    name = "Translate articles",
    description = "Adds dynamic translation capability to Medium articles using Google Translate API.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MEDIUM)

    extendWith("extensions/extension.mpe")

    val targetLanguage by stringOption(
        key = "targetLanguage",
        title = "Target Language",
        description = "Language code to translate articles to (e.g., ru, es, de, fr, zh).",
        default = "ru"
    )

    execute {
        // Initialize lifecycle callbacks on app start
        DonkeyApplicationFingerprint.matchAllOrNull()?.forEach { match ->
            match.method.addInstructions(
                0,
                """
                    move-object/from16 v0, p0
                    invoke-static {v0}, $EXTENSION_CLASS->init(Landroid/app/Application;)V
                """
            )
        }
    }
}