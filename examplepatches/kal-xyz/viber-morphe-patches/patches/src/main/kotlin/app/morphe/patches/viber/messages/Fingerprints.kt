package app.morphe.patches.viber.messages

import app.morphe.patcher.Fingerprint

internal object MessageRetractionHandlerFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("delete_message", "retract_message")
)
