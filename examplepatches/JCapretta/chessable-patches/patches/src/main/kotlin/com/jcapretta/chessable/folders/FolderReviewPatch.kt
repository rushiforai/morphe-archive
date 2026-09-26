package com.jcapretta.chessable.folders

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val folderReviewPatch = rawResourcePatch(
    name = "Enable folder reviews",
    description = "Review due material across a folder using Chessable's native random or sequential order.",
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
            FolderReviewEdits.apply(bundle.readBytes())
        } catch (exception: IllegalArgumentException) {
            throw PatchException(exception.message ?: "Unsupported Chessable bundle", exception)
        }
        bundle.writeBytes(patched)
    }
}
