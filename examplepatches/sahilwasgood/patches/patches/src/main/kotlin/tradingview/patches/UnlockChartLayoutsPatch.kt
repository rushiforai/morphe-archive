package tradingview.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/template/extension/tradingview/ChartLayouts;"

@Suppress("unused")
val unlockChartLayoutsPatch = bytecodePatch(
    name = "Unlock multi-chart layouts",
    description = "Unlocks chart layouts with up to 8 charts on one screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)
    extendWith("extensions/extension.mpe")

    execute {
        InitWebViewFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->addLayoutLimitScript(Landroid/webkit/WebView;)V",
        )
    }
}
