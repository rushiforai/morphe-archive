package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.archive

import app.morphe.patcher.Fingerprint

/**
 * Sets up the menu behind a post's overflow button. The rows are already inflated by the time
 * this runs, and it is the last thing to touch them, so rows added at the end of it survive
 * the visibility changes it makes.
 */
internal val postMoreSheetOnViewCreatedFingerprint = Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/PostMoreBottomSheetFragment;",
    name = "o2",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

internal const val SELECTION_SHEET_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/material_dialogs/base/" +
            "AbstractSelectionDialogBottomSheet;"

internal const val SELECTION_OPTION_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/material_dialogs/base/" +
            "AbstractSelectionDialogBottomSheet\$h;"

/**
 * Builds the rows of the link options sheet. Unlike the post menu this one is assembled from
 * code, so another option can simply be registered alongside Sync's own.
 */
/** Registers one row with the sheet, and is what an added option goes through as well. */
internal const val REGISTER_OPTION_METHOD_NAME = "t4"

internal val linkOptionsBuildFingerprint = Fingerprint(
    strings = listOf("Open in browser", "Copy link address", "Share link"),
    custom = { _, classDef -> classDef.sourceFile == "UrlSelectionDialogBottomSheet.java" }
)

/**
 * Handles a tapped option by comparing it against the ones it registered, and reads the link
 * out of a field of its own, which is where the URL to archive comes from.
 */
internal val linkOptionsClickFingerprint = Fingerprint(
    parameters = listOf(SELECTION_OPTION_CLASS),
    returnType = "V",
    custom = { _, classDef -> classDef.sourceFile == "UrlSelectionDialogBottomSheet.java" }
)
