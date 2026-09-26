package com.jcapretta.chessable.folders

import com.jcapretta.chessable.hermes.ChessableEdits
import com.jcapretta.chessable.hermes.HermesEdit
import com.jcapretta.chessable.hermes.hexBytes

/** See docs/patch-design.md for disassembly anchors and branch semantics. */
internal object FolderReviewEdits {
    const val BUNDLE = "assets/index.android.bundle"
    const val ORIGINAL_SHA256 = "cc6f85db55e96769a08058975fd09af6f7af227899b32f8c570240179693e95e"

    val edits = listOf(
        // Folder review count: skip the premium-only early exit, retain due-count checks.
        edit("Folder review visibility", 0x7c3925, "923501", "080101"),
        // Initial tab: preserve folderId even when userIsPro is false.
        edit("Folder scope", 0x769928, "920f03", "080303"),
        // RandomReviewSetting: r7 already passed the review-mode / bidLimit guard.
        edit("Random review setting", 0x798417, "900505", "900507"),
        // Read the stored preference for every user, preserving its false default.
        edit("Random review preference", 0x770f64, "923d00", "080000"),
        // A missing folder must reject the loading promise, never clear folderLimit.id.
        // LoadConstString r7, 54979; Throw r7; LoadConstUndefined r7 (unreachable padding).
        edit("Missing folder guard", 0x76fbda, "3b08070152008e4c", "7307c3d65f077607"),
        // Keep the native Folders entry instead of replacing it with a trial banner.
        edit("Folder navigation", 0x7afb89, "902815", "081515"),
    )

    fun apply(bundle: ByteArray): ByteArray = ChessableEdits.apply(bundle, edits)

    private fun edit(name: String, offset: Int, before: String, after: String) =
        HermesEdit(name, offset, before.hexBytes(), after.hexBytes())
}
