package app.template.patches.ozonbank.home

import app.morphe.patcher.Fingerprint

/** Matches the WebView callback used after an Ozon Bank page finishes loading. */
object FintechWebViewPageFinishedFingerprint : Fingerprint(
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf(
        "Landroid/webkit/WebView;",
        "Ljava/lang/String;",
    ),
    strings = listOf("FintechWebViewClient", "onPageFinished: "),
)

/** Matches the native Cbottom bridge that receives sheet payloads from the bank WebView. */
object ShowCbottomBridgeHandleSyncFingerprint : Fingerprint(
    name = "handleSync",
    returnType =
        "Lru/ozon/fintech/features/finwebview/domain/nativebridge/NativeResult;",
    parameters = listOf(
        "Ljava/lang/ref/WeakReference;",
        "Ljava/lang/String;",
    ),
    strings = listOf("show parameterJson="),
)
