package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.nav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val BOTTOM_BAR_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/views/main/SyncBottomNavigationView;"

internal const val RAIL_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/views/main/SyncNavigationRailView;"

internal const val NAVIGATION_BAR_CLASS =
    "Lcom/google/android/material/navigation/NavigationBarView;"

internal const val BADGE_DRAWABLE_CLASS =
    "Lcom/google/android/material/badge/BadgeDrawable;"

private const val COLOR_STATE_LIST = "Landroid/content/res/ColorStateList;"

/**
 * Whether a method is the one that dresses a navigation bar: it is the only one on either of the
 * two that hands Material the colours its items are drawn in.
 *
 * Matching on that rather than on the method's name, which is the minifier's. Both bars have
 * several methods that take nothing and return nothing — the badge, the long press listeners,
 * and the one the app calls when the theme changes — and only this one colours the items.
 */
private fun dressesABar(method: Method, @Suppress("UNUSED_PARAMETER") classDef: ClassDef) =
    method.indexOfFirstInstruction {
        val reference = getReference<MethodReference>()
        reference?.definingClass == NAVIGATION_BAR_CLASS &&
                reference.parameterTypes.map { it.toString() } == listOf(COLOR_STATE_LIST) &&
                reference.returnType == "V"
    } >= 0

/**
 * Where the bottom bar settles how it looks, called as it is built and again whenever the theme
 * or the settings change. By then the app has already taken off whatever it did not want — the
 * actions item unless its own setting asks for it, the inbox while nobody is signed in — so
 * what is on the bar here is the bar the app meant to draw.
 *
 * Its single return is reached by every path: the two branches it holds both land in front of
 * it, so nothing can jump over a call placed there.
 */
internal val bottomBarDressesItselfFingerprint = Fingerprint(
    definingClass = BOTTOM_BAR_CLASS,
    parameters = emptyList(),
    returnType = "V",
    custom = ::dressesABar,
)

/** The same, on the rail the app puts up instead of the bar in tablet mode. It holds no branches. */
internal val railDressesItselfFingerprint = Fingerprint(
    definingClass = RAIL_CLASS,
    parameters = emptyList(),
    returnType = "V",
    custom = ::dressesABar,
)

/**
 * `NavigationBarView.getMenu()`, which the extension calls to reach the items. Named here only
 * to have the patch fail where a later Material has renamed it, rather than the app throwing
 * the first time a bar is drawn.
 */
internal val navigationBarMenuFingerprint = Fingerprint(
    definingClass = NAVIGATION_BAR_CLASS,
    name = "g",
    parameters = emptyList(),
    returnType = "Landroid/view/Menu;",
)

/**
 * `NavigationBarView.getMaxItemCount()`, which settles whether there is room for the added
 * button — five on the bottom bar, seven on the rail.
 */
internal val navigationBarMaxItemsFingerprint = Fingerprint(
    definingClass = NAVIGATION_BAR_CLASS,
    name = "f",
    parameters = emptyList(),
    returnType = "I",
)

/** `NavigationBarView.getOrCreateBadge(int)`, which is what draws the unread count. */
internal val navigationBarBadgeFingerprint = Fingerprint(
    definingClass = NAVIGATION_BAR_CLASS,
    name = "k",
    parameters = listOf("I"),
    returnType = BADGE_DRAWABLE_CLASS,
)

/** `NavigationBarView.removeBadge(int)`, which takes it off a button that no longer holds it. */
internal val navigationBarRemoveBadgeFingerprint = Fingerprint(
    definingClass = NAVIGATION_BAR_CLASS,
    name = "o",
    parameters = listOf("I"),
    returnType = "V",
)

/**
 * Whether a method is the one that draws the unread count: it is the only one on either bar that
 * asks Material for a badge.
 *
 * Both bars hold several methods that take nothing and return nothing, so the name is no use
 * even if it were stable. Exactly one of them on each asks for a badge.
 */
private fun drawsTheUnreadCount(
    method: Method,
    @Suppress("UNUSED_PARAMETER") classDef: ClassDef,
) = method.indexOfFirstInstruction {
    val reference = getReference<MethodReference>()
    reference?.definingClass == NAVIGATION_BAR_CLASS &&
            reference.returnType == BADGE_DRAWABLE_CLASS
} >= 0

/**
 * Where the bottom bar draws its unread count, on the inbox item, by that item's id.
 *
 * Stood in for entirely rather than added to, since several things call it — the bar being
 * dressed, a message arriving, the bar being attached — and a correction appended to one of
 * those paths would be undone by the next.
 */
internal val bottomBarDrawsTheUnreadCountFingerprint = Fingerprint(
    definingClass = BOTTOM_BAR_CLASS,
    parameters = emptyList(),
    returnType = "V",
    custom = ::drawsTheUnreadCount,
)

/** The same, on the rail. */
internal val railDrawsTheUnreadCountFingerprint = Fingerprint(
    definingClass = RAIL_CLASS,
    parameters = emptyList(),
    returnType = "V",
    custom = ::drawsTheUnreadCount,
)

/**
 * The one place a tap on either bar is answered. Both bars are their own listener and both hand
 * the item straight to this, which compares its id against each of the six the app knows what to
 * do with and answers anything else by doing nothing and returning false — so a button of ours
 * is safe to put in front of it, and an id it has never heard of was already harmless.
 *
 * Matched on the file it was written in, which the build keeps, rather than on the name of either
 * the class or the method, which the minifier chose. The class holds one other method and it
 * takes two parameters.
 */
internal val navigationTapFingerprint = Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        classDef.sourceFile == "NavigationViewHelper.java" &&
                method.parameterTypes.size == 3 &&
                method.parameterTypes.first().toString() == "Landroid/content/Context;" &&
                method.parameterTypes.last().toString() == "Landroid/view/MenuItem;"
    },
)
