package app.linkedin.patches.download

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/DownloadMediaPatch;"

/**
 * DocumentSingleViewData(properties, playerId, DocumentAsset, Source, navigablePages, isFullScreenMode, ...),
 * the document (PDF or carousel) player. Later parameters change between versions, so only these are matched.
 */
private object DocumentPlayerFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/sdui/viewdata/document/DocumentSingleViewData;",
    name = "<init>",
    custom = { method, _ ->
        val types = method.parameterTypes.map { it.toString() }
        types.size >= 6 &&
            types[2] == "Lproto/sdui/components/core/document/DocumentAsset;" &&
            types[3] == "Lcom/linkedin/android/documentviewer/compose/source/Source;" &&
            types[4] == "I" && types[5] == "Z"
    },
)

@Suppress("unused")
val downloadMediaPatch = bytecodePatch(
    name = "Download media",
    description = "Adds a download button to the full screen photo, video and document viewer. " +
        "Documents (PDFs and carousels) are saved as one PDF.",
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

        // p3 = DocumentAsset, p4 = Source, p5 = navigablePages, p6 = isFullScreenMode. A static call before the
        // super constructor is allowed, as long as it doesn't touch p0.
        DocumentPlayerFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p3 .. p6 }, $EXTENSION_PACKAGE/DocumentPdf;->onDocument(Ljava/lang/Object;Ljava/lang/Object;IZ)V"
        )
    }
}
