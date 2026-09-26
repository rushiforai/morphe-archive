package com.jcapretta.chessable.offline

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import com.jcapretta.chessable.folders.FolderReviewEdits

@Suppress("unused")
val offlinePatch = rawResourcePatch(
    name = "Enable offline mode",
    description = "Download owned courses and accessible course videos for offline study using Chessable's native storage and progress sync.",
) {
    compatibleWith(
        Compatibility(
            name = "Chessable",
            packageName = "com.chessable.chessable",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "3.0.4", isExperimental = false)),
        ),
    )

    execute {
        val bundle = get(FolderReviewEdits.BUNDLE)
        val patched = try {
            OfflineEdits.apply(bundle.readBytes())
        } catch (exception: IllegalArgumentException) {
            throw PatchException(exception.message ?: "Unsupported Chessable bundle", exception)
        }
        bundle.writeBytes(patched)
    }
}
