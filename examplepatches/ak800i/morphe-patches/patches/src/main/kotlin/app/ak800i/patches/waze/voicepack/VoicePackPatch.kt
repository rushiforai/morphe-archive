package app.ak800i.patches.waze.voicepack

import app.ak800i.patches.waze.shared.Constants.COMPATIBILITY_WAZE
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/ak800i/extension/waze/VoicePack;"

@Suppress("unused")
val voicePackPatch = patch(
    name = "Voice pack import and export",
    description = "Adds Import and Export buttons to the custom voice screen, " +
        "so custom voices can be shared as zip files of MP3 prompts.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    extendWith("extensions/waze.mpe")

    execute {
        // At the start of onCreate p0 is always the activity. The extension waits until
        // the screen is built before it adds its buttons.
        CustomPromptsRecordingActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->onCreate(Landroid/app/Activity;)V",
        )
    }
}
