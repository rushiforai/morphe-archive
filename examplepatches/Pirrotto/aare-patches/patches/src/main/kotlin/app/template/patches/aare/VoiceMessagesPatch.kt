package app.template.patches.aare

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_AARE

private const val EXTENSION_CLASS = "Lapp/template/extension/aare/VoiceNotes;"

private const val LISTENER_CLASS = "Lnet/prototux/aare/notify/CarNotificationListener;"

/** CarNotificationListener.speak(String): reads a message aloud with text-to-speech. */
internal object SpeakFingerprint : Fingerprint(
    definingClass = LISTENER_CLASS,
    name = "speak",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/speech/tts/TextToSpeech;",
            name = "speak",
        ),
    ),
)

/** CarNotificationListener.onNotificationPosted(StatusBarNotification). */
internal object NotificationPostedFingerprint : Fingerprint(
    definingClass = LISTENER_CLASS,
    name = "onNotificationPosted",
    returnType = "V",
    parameters = listOf("Landroid/service/notification/StatusBarNotification;"),
)

@Suppress("unused")
val voiceMessagesPatch = patch(
    name = "Voice messages",
    description = "Plays WhatsApp voice messages in the car when a message is read aloud, instead of " +
        "reading \"Voice message (0:05)\". Reads them through Shizuku, which AARE already uses for " +
        "car audio, so AARE needs no storage permission.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AARE)

    extendWith("extensions/extension.mpe")

    dependsOn(settingsPatch)

    execute {
        registerSetting("voice_messages")

        // Remember the voice messages of WhatsApp notifications, with their times.
        NotificationPostedFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1 }, $EXTENSION_CLASS->onPosted(Landroid/content/Context;Landroid/service/notification/StatusBarNotification;)V",
        )

        // Before AARE speaks a message: if it holds voice messages, play them and skip AARE's speech.
        SpeakFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS->onSpeak(Landroid/content/Context;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :aare_speak
                    return-void
                """,
                ExternalLabel("aare_speak", getInstruction(0)),
            )
        }
    }
}
