package app.noam.patches.chesscom.misc.settings

import app.morphe.patcher.Fingerprint

/** toString() of the More tab's state (its list of headers and rows). */
internal object MoreMenuStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("MoreMenuUiState(items="),
)
