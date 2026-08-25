package app.template.patches.ozonbank.warnings

import app.morphe.patcher.Fingerprint

/** Matches the central provider that reports VPN state inside Ozon Bank. */
object WebViewVpnStateFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/fintech/analytic/base/providers/providers/NetworkInfoProvider;",
    name = "isVpnConnected",
    returnType = "Z",
    parameters = emptyList(),
)

/** Matches the WebView native bridge that reports connection type and VPN state. */
object WebViewNetworkTypeFingerprint : Fingerprint(
    returnType =
        "Lru/ozon/fintech/features/finwebview/domain/nativebridge/NativeResult;",
    parameters = emptyList(),
    strings = listOf(
        "Cellular()",
        "There is no instance of ConnectivityManager",
        "Exception while get network info",
    ),
)
