package app.template.patches.youtube.shorts

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches [ReelRecyclerView.onInterceptTouchEvent].
 *
 * YouTube ≥ 20.x replaced the ViewPager2-based Shorts pager with a custom
 * [ReelRecyclerView] (a RecyclerView subclass).  Touch interception — previously
 * done via a GestureDetector.OnGestureListener.onFling callback — is now handled
 * inside [onInterceptTouchEvent].  Returning false at the top of this method
 * prevents the RecyclerView from ever claiming the swipe gesture, leaving touch
 * events for the individual Short player intact.
 *
 * Stable identifiers used for matching:
 * - class name       : contains "ReelRecyclerView" (unobfuscated library class)
 * - method name      : onInterceptTouchEvent (framework override, cannot be renamed)
 * - parameter type   : (MotionEvent) → boolean
 * - access flags     : public final
 */
object ShortsSwipeFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/view/MotionEvent;"),

    custom = { method, classDef ->
        method.name == "onInterceptTouchEvent" &&
            classDef.type.contains("ReelRecyclerView")
    },
)

/**
 * Matches [ReelRecyclerView.onTouchEvent].
 *
 * Once a swipe is intercepted, [onTouchEvent] tracks the Y-delta and fires the
 * page-advance callback when the threshold is exceeded.  Returning false at the
 * top of this method prevents that callback from ever being reached, so the
 * Shorts playlist never advances to the next item.
 *
 * Stable identifiers used for matching:
 * - class name       : contains "ReelRecyclerView" (unobfuscated library class)
 * - method name      : onTouchEvent (framework override, cannot be renamed)
 * - parameter type   : (MotionEvent) → boolean
 * - access flags     : public final
 */
object ShortsPageAdvanceFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/view/MotionEvent;"),

    custom = { method, classDef ->
        method.name == "onTouchEvent" &&
            classDef.type.contains("ReelRecyclerView")
    },
)
