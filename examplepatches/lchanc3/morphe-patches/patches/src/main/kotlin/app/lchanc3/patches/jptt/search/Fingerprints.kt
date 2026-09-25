package app.lchanc3.patches.jptt.search

import app.lchanc3.patches.jptt.shared.Constants.BOARD_FRAGMENT_CLASS
import app.lchanc3.patches.jptt.shared.Constants.SPLASH_ACTIVITY_CLASS
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

/**
 * `SplashActivity.startMainActivity()`, which every launch goes through: it hands
 * `MainActivity` the extras -- `wBoard` for a shortcut or widget among them --
 * that it opens on.
 */
internal object StartMainActivityFingerprint : Fingerprint(
    definingClass = SPLASH_ACTIVITY_CLASS,
    name = "startMainActivity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/os/Bundle;", "Ljava/lang/String;"),
)

/**
 * The click handler of the menu `FavoriteListFragment.showOptionDialog()` opens
 * on a long press in the board and search history tabs. An anonymous class, so it
 * is found by the options it compares against rather than by its `$4` name.
 */
internal object HistoryOptionClickFingerprint : Fingerprint(
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/content/DialogInterface;", "I"),
    strings = listOf("在啟動器建立捷徑", "刪除這筆紀錄", "清除歷史紀錄"),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/joshua/jptt/FavoriteListFragment\$") },
)
