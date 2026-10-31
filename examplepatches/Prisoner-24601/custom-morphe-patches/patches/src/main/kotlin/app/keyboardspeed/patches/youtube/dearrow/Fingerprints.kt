package app.keyboardspeed.patches.youtube.dearrow

import app.morphe.patcher.Fingerprint

internal object SeparatorFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "getSeparator",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

internal object OriginalTitleFirstFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "isOriginalTitleFirst",
    returnType = "Z",
    parameters = listOf(),
)
