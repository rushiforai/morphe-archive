package app.stayfree.patches.drawer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.AccessFlags

private const val R_STRING = "Lcom/burockgames/R\$string;"

internal const val DRAWER_SCREEN_TYPE = "Lcom/burockgames/timeclocker/common/enums/DrawerScreenType;"

/**
 * Side menu header composable (`Lez4;->b(Le02;I)V` in 20.16.1). Its first row is made clickable
 * with `p60.N(modifier, new as0(18, activity))` (as0 case 18 opens `UrlType.LINK_TREE_PAGE`) and
 * holds the app icon, the "StayFree" Text, a dot Icon (`ee2.n`) and the "Follow us!" Text. The
 * `follow_us` string is only used here.
 */
object DrawerHeaderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "I"),
    filters = listOf(
        fieldAccess(definingClass = R_STRING, name = "follow_us"),
    ),
)

/**
 * Side menu item composable (`Lez4;->c(DrawerScreenType;Le02;I)V` in 20.16.1). Each drawer entry
 * is its own lambda calling it with one `DrawerScreenType` constant; "My Friends" is
 * `USAGE_SHARING` (`nw1` default case). The only method with this signature.
 */
object DrawerItemFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(DRAWER_SCREEN_TYPE, "L", "I"),
)
