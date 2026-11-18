package app.jofslash.patches.quora.trackers

import app.jofslash.patches.quora.ads.InterceptRequestFingerprint
import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/BlockTrackersPatch;"

@Suppress("unused")
val blockTrackersPatch = bytecodePatch(
    name = "Block web trackers",
    description = "Blocks requests from Quora pages to third-party analytics and tracking services.",
    default = true
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        InterceptRequestFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p2 }, $EXTENSION_CLASS->blockTrackerRequest(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                move-result-object v0
                if-eqz v0, :load
                return-object v0
                :load
                nop
            """
        )
    }
}
