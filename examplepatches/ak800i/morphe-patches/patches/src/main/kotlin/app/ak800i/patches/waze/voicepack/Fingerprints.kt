package app.ak800i.patches.waze.voicepack

import app.morphe.patcher.Fingerprint

/**
 * The screen where a custom voice is recorded, edited or viewed. Its class name is kept
 * because it is declared in the manifest.
 */
internal object CustomPromptsRecordingActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/waze/settings/CustomPromptsRecordingActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
