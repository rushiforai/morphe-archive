package app.noam.patches.chesscom.misc.settings

import app.morphe.patcher.Fingerprint

/** toString() of the More tab's state (its list of headers and rows). */
internal object MoreMenuStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("MoreMenuUiState(items="),
)

/**
 * The More screen's tap on a row, the app's only method taking just a row key. The view model's
 * handling of the tap is inlined into it.
 */
internal object MoreRowClickFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/chess/home/more/MoreMenuItemKey;"),
)
