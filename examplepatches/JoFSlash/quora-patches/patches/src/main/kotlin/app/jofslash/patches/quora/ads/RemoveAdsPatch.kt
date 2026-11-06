package app.jofslash.patches.quora.ads

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/RemoveAdsPatch;"

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Hides promoted answers, sponsored posts and Google ads in the feed and on question pages, " +
            "and blocks requests to ad servers.",
    default = true
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        // Quora renders its content in a WebView, so ads are part of the web page.
        // Inject a stylesheet that hides ad elements whenever a page finishes loading.
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->onPageFinished(Landroid/webkit/WebView;)V"
        )

        // Answer requests to ad servers with an empty response.
        InterceptRequestFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p2 }, $EXTENSION_CLASS->blockAdRequest(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                move-result-object v0
                if-eqz v0, :load
                return-object v0
                :load
                nop
            """
        )
    }
}
