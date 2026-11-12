package tradingview.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/template/extension/tradingview/WatchlistSync;"

@Suppress("unused")
val watchlistSyncPatch = bytecodePatch(
    name = "Watchlist Cloud Sync & Manager",
    description = "Replaces TradingView's watchlist backend with our Cloudflare synced storage directly in the native TradingView watchlist UI.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)
    extendWith("extensions/extension.mpe")

    execute {
        InitWebViewFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->addSyncScript(Landroid/webkit/WebView;)V",
        )
    }
}
