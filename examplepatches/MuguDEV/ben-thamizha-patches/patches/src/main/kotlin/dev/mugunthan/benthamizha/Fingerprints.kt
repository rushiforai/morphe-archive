package dev.mugunthan.benthamizha

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

private const val MAIN_ACTIVITY = "Lcom/ben/thamizha/MainActivity;"
private const val WEBVIEW_CLIENT = "Lcom/ben/thamizha/MainActivity\$2;"

internal object CheckAdBlockFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "checkAdBlock",
    returnType = "V",
    parameters = emptyList()
)

internal object IsAdBlockerActiveFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "isAdBlockerActive",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(string("doubleclick.net"))
)

internal object ShowAdBlockDialogFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "showAdBlockDialog",
    returnType = "V",
    parameters = emptyList()
)

internal object JavaScriptAdCheckFingerprint : Fingerprint(
    definingClass = WEBVIEW_CLIENT,
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;")
)
