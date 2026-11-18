package app.fakh.patches.linkedin.download

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.feed.DocumentPlayerFingerprint
import app.fakh.patches.linkedin.feed.postMenuPatch
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/DownloadMediaPatch;"

@Suppress("unused")
val downloadMediaPatch = patch(
    name = "Download media",
    description = "Adds download buttons to profile photos and banners and Download media to the ⋯ menu of " +
        "posts. Adds a switch in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feature")

    // The server driven viewer is handled by the SDUI filter and SduiFragment lifecycle hooks, the ⋯ menu items
    // by the post menu hooks.
    dependsOn(sduiComponentFilterPatch, postMenuPatch)

    execute {
        markIncluded("isDownloadMediaIncluded")

        // p3 = DocumentAsset, p4 = Source, p5 = navigablePages, p6 = isFullScreenMode. A static call before the
        // super constructor is allowed, as long as it doesn't touch p0.
        DocumentPlayerFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p3 .. p6 }, $EXTENSION_PACKAGE/DocumentPdf;->onDocument(Ljava/lang/Object;Ljava/lang/Object;IZ)V"
        )

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
