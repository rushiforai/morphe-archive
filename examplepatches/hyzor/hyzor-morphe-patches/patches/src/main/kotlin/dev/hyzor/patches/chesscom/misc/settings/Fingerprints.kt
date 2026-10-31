package dev.hyzor.patches.chesscom.misc.settings

import app.morphe.patcher.Fingerprint

/** toString() of the More tab's state (its list of headers and rows). */
internal object MoreMenuStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("MoreMenuUiState(items="),
)

/** 4.10.23's More tap handler: a Compose function reference instead of MoreViewModel. */
internal object HomeMoreMenuClickFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/chess/home/more/MoreMenuItemKey;"),
    custom = { _, classDef ->
        classDef.superclass == "Lkotlin/jvm/internal/FunctionReferenceImpl;" &&
            classDef.type.startsWith("Lcom/chess/home/more/HomeMoreScreen")
    },
)
