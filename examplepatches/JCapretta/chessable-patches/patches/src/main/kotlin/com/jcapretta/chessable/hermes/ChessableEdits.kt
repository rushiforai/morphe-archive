package com.jcapretta.chessable.hermes

import com.jcapretta.chessable.folders.FolderReviewEdits
import com.jcapretta.chessable.offline.OfflineEdits

/** Recognize only audited sibling patches, without enabling unselected features. */
internal object ChessableEdits {
    fun apply(bundle: ByteArray, selected: List<HermesEdit>): ByteArray = HermesEdits(
        FolderReviewEdits.ORIGINAL_SHA256,
        selected,
        FolderReviewEdits.edits + OfflineEdits.edits,
    ).apply(bundle)
}
