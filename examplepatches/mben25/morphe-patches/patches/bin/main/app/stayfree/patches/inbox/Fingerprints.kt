package app.stayfree.patches.inbox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

internal const val DRAWER_SCREEN_TYPE = "Lcom/burockgames/timeclocker/common/enums/DrawerScreenType;"
private const val PERMISSION_CATEGORY_DATA = "Lcom/burockgames/timeclocker/common/data/PermissionCategoryData;"

/**
 * Drawer row composable, `DrawerRow(type: DrawerScreenType, Composer, $changed: Int)`
 * (`Lky4;->c` in 20.14.1). Every drawer entry, including INBOX_CLEANING, is drawn through it and
 * it is the only method in the app with this signature.
 */
object DrawerRowComposableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(DRAWER_SCREEN_TYPE, "L", "I"),
    filters = listOf(
        methodCall(definingClass = DRAWER_SCREEN_TYPE, name = "getTextResId"),
    ),
)

/**
 * `openInboxControl(activity, onSignInRequired, …)` (`Loe7;->c(Lds0;Lyi4;Z)V`): launches
 * `FlutterActivity.withCachedEngine("stayfresh_engine")`, or the Google sign-in flow first when
 * signed out. It is the single funnel for every Inbox Control entry point (drawer click, native
 * intro screen reached via the "inbox-cleaning" route/push, permissions-screen IMAP button,
 * Neon theme / app icon "Try Inbox Control" dialogs).
 */
object OpenInboxControlFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("L", "L", "Z"),
    strings = listOf("stayfresh_engine"),
    filters = listOf(
        methodCall(name = "withCachedEngine"),
    ),
)

/**
 * Permissions screen list builder (`Lnm2;->invokeSuspend`). The "Inbox Control" category is
 * `PermissionCategoryData(R.string.permissions_category_inbox_cleaning, listOf(gmailSignIn, imapWriteAccess))`.
 * Right after, the builder drops every category whose items are empty, so handing that
 * constructor an empty list removes the whole section without touching the category array.
 */
object PermissionsListBuilderFingerprint : Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        fieldAccess(definingClass = "Lcom/burockgames/R\$string;", name = "permissions_category_inbox_cleaning"),
        methodCall(definingClass = PERMISSION_CATEGORY_DATA, name = "<init>"),
    ),
)
