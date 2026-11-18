package app.morphe.patches.viber.privacy

import app.morphe.patcher.Fingerprint

internal object ReadReceiptDispatcherFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("J", "Ljava/lang/String;"),
    strings = listOf("seen_status", "read_receipt")
)

internal object TypingIndicatorDispatcherFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf("typing_state", "is_typing")
)
