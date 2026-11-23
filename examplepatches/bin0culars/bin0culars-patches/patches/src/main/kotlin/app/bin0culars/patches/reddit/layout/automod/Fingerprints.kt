package app.bin0culars.patches.reddit.layout.automod

import app.morphe.patcher.Fingerprint

object SetCommentsToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("SetComments(comments="),
)
