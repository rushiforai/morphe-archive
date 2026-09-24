package app.lchanc3.patches.jptt.search

import app.lchanc3.patches.jptt.shared.Constants.BOARD_FRAGMENT_CLASS
import app.morphe.patcher.Fingerprint

/**
 * `BoardFragment.showSearchDialog()`, which fills the two "最近搜尋" strips of the
 * search dialog with two calls to `DBHelper.getBoardHistory(...)`.
 */
internal object ShowSearchDialogFingerprint : Fingerprint(
    definingClass = BOARD_FRAGMENT_CLASS,
    name = "showSearchDialog",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `BoardFragment.addSearchHistoryListToLayout()`, which inflates one rounded
 * button per keyword into the container it is handed.
 */
internal object AddSearchHistoryListToLayoutFingerprint : Fingerprint(
    definingClass = BOARD_FRAGMENT_CLASS,
    name = "addSearchHistoryListToLayout",
    returnType = "V",
    parameters = listOf(
        "Landroid/view/ViewGroup;",
        "Ljava/util/ArrayList;",
        "Landroid/view/LayoutInflater;",
        "Landroidx/appcompat/app/AlertDialog;",
    ),
)
