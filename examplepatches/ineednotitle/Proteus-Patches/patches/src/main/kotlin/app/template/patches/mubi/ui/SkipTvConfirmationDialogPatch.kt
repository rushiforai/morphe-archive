package app.template.patches.mubi.ui

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.mubi.shared.finishActivityOnCreate
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY

// Skip MUBI's TV exit / action confirmation dialog.
//
// On Android TV, MUBI routes some actions through
// com.mubi.utils.tv.TvConfirmationDialogActivity — an exported activity that
// shows a "are you sure?" prompt before leaving the player or the app.
//
// The patch inserts finish() immediately after onCreate()'s super call, so the
// activity closes before it draws. The caller's result is the same as a
// dismissed/confirmed dialog in the common case (the app's next action runs),
// but a flow that waits for a specific result code could stall.
//
// Opt-in (default = false): only useful on TV, and MUBI's dialog semantics are
// not documented.
//
// Fail-safe: if the activity or its super call changes, the stock dialog stays.

@Suppress("unused")
val mubiSkipTvConfirmationDialogPatch = bytecodePatch(
    name = "Skip TV confirmation dialog",
    description = "Closes MUBI's Android TV confirmation screen before it draws. " +
        "Only useful on TV devices; a flow waiting on a dialog result may stall.",
    default = false,
) {
    compatibleWith(MUBI_COMPATIBILITY)

    execute {
        finishActivityOnCreate("Lcom/mubi/utils/tv/TvConfirmationDialogActivity;")
    }
}
