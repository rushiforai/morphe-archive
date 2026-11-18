package app.jofslash.patches.quora.text

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.registerSetting
import app.jofslash.patches.quora.video.InitWebViewFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/NativeTweaksPatch;"

@Suppress("unused")
val textSizePatch = bytecodePatch(
    name = "Text size",
    description = "Makes the text on every page larger or smaller.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    val textSize = intOption(
        key = "textSize",
        default = 115,
        values = mapOf(
            "85%" to 85,
            "90%" to 90,
            "110%" to 110,
            "115%" to 115,
            "125%" to 125,
            "150%" to 150,
        ),
        title = "Text size",
        description = "Text size in percent of the default size.",
        required = true,
    )

    execute {
        val percent = textSize.value!!
        if (percent !in 50..300) throw PatchException("Text size must be between 50 and 300 percent")
        registerSetting("textSize", "Text size")

        // p1 is the QWebView being set up.
        InitWebViewFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, $percent
                invoke-static { p1, v0 }, $EXTENSION_CLASS->applyTextZoom(Landroid/webkit/WebView;I)V
            """
        )
    }
}
