/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.download

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private const val DOWNLOAD_PATCH = "$EXTENSION_PACKAGE/DownloadMediaPatch;"

/**
 * DocumentSingleViewData(properties, playerId, DocumentAsset, Source, navigablePages, isFullScreenMode, ...),
 * the player behind PDFs and document carousels. The trailing parameters change between LinkedIn versions,
 * so only the leading ones are matched.
 */
private val documentPlayer = Fingerprint(
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
    description = "Puts a download button in the full screen photo, video and document viewer; documents " +
        "(PDFs and carousels) are saved as a single PDF.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)

    // The server driven viewer goes through the SDUI filter, plus the SduiFragment lifecycle hooks of the
    // settings patch, which tell the extension which fragment is on screen.
    dependsOn(sduiComponentFilterPatch)

    execute {
        markIncluded("isDownloadMediaIncluded")

        // The classic viewers. p1 is the ViewData, p2 the binding; range form, since they can be above v15.
        mediaViewerOnBindFingerprints.forEach { viewer ->
            viewer.method.addInstruction(
                0,
                "invoke-static/range { p1 .. p2 }, $DOWNLOAD_PATCH->onMediaBind(Ljava/lang/Object;Ljava/lang/Object;)V"
            )
        }

        // p3 DocumentAsset, p4 Source, p5 navigablePages, p6 isFullScreenMode. A static call ahead of a super
        // constructor call is allowed, as long as it does not touch p0.
        documentPlayer.method.addInstruction(
            0,
            "invoke-static/range { p3 .. p6 }, $EXTENSION_PACKAGE/DocumentPdf;->onDocument(Ljava/lang/Object;Ljava/lang/Object;IZ)V"
        )
    }
}
