package app.linkedin.patches.download

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.sduiComponentFilterPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/DownloadMediaPatch;"

@Suppress("unused")
val downloadMediaPatch = bytecodePatch(
    name = "Download media",
    description = "Adds a download button to the full screen photo and video viewer.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)

    // The server driven viewer is handled by the SDUI filter and SduiFragment lifecycle hooks.
    dependsOn(sduiComponentFilterPatch)

    execute {
        markIncluded("isDownloadMediaIncluded")

        // Legacy (RecyclerView) media viewer presenters.
        mediaViewerOnBindFingerprints.forEach {
            // p1 = ViewData, p2 = ViewDataBinding. Range form because p registers can be above v15.
            it.method.addInstruction(
                0,
                "invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->onMediaBind(Ljava/lang/Object;Ljava/lang/Object;)V"
            )
        }
    }
}
