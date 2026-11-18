package app.bin0culars.patches.reddit.layout.autoscroll

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags

object FeedVisibilityEventFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/feeds/impl/ui/events/FeedVisibilityEvent;",
    name = "<init>",
)

object NavBarStateChangeFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/launch/bottomnav/BottomNavScreen\$onNavBarStateChange\$1;",
    name = "<init>",
)

object MasonryInnerFeedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        methodCall(
            returnType = "Landroidx/compose/foundation/lazy/staggeredgrid/b;",
        ),
    ),
)

object MainActivityResumeFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/launch/main/MainActivity;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)

object MainActivityPauseFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/launch/main/MainActivity;",
    name = "onPause",
    returnType = "V",
    parameters = listOf(),
)

object PostPagerInflateFingerprint : Fingerprint(
    filters = listOf(
        resourceLiteral(ResourceType.LAYOUT, "fragment_pager"),
        methodCall(definingClass = "Landroid/view/LayoutInflater;", name = "inflate"),
    ),
)

object ScreenAttachFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/navstack/",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        fieldAccess(definingClass = "Landroidx/lifecycle/Lifecycle\$State;", name = "DESTROYED"),
        fieldAccess(definingClass = "Landroidx/lifecycle/Lifecycle\$State;", name = "RESUMED"),
    ),
)

object ScreenDetachFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/navstack/",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        fieldAccess(definingClass = "Landroidx/lifecycle/Lifecycle\$State;", name = "RESUMED"),
        methodCall(definingClass = "Landroidx/lifecycle/Lifecycle\$State;", name = "isAtLeast"),
        fieldAccess(definingClass = "Landroidx/lifecycle/Lifecycle\$State;", name = "STARTED"),
    ),
)
