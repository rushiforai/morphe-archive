package app.linkedin.extension;

import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;

import java.util.ArrayList;
import java.util.List;

/**
 * Swipe between feeds: on the home feed, swiping left opens Network and swiping right opens For you, like the tabs
 * of X. The tab is found through accessibility and tapped with a touch, so LinkedIn switches it exactly as when it
 * is tapped (its tabs handle touches themselves, they have no click action).
 * <p>
 * Swipes that start on something that scrolls sideways (photo carousels, documents with many pages) are left to it.
 */
@SuppressWarnings("unused")
public final class FeedSwipe {
    private static final long MAX_DURATION = 600;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** Pages of a document or photos of a carousel: "Page 3 of 11", "3 of 11" (the feed tabs are "1 of 2"). */
    private static final java.util.regex.Pattern PAGES =
            java.util.regex.Pattern.compile("(?i)\\bpage\\s+\\d+|\\b\\d+\\s+of\\s+(?:[3-9]|\\d{2,})\\b");

    private static float downX;
    private static float downY;
    private static long downTime;
    private static boolean multiTouch;
    /** The touch already handled: nested Compose views each see it. */
    private static long handledDownTime = -1;
    private static long lastSwitch;

    private FeedSwipe() {
    }

    /** Injection point, at the start of AndroidComposeView.dispatchTouchEvent. Only watches the touch. */
    public static void onTouch(View view, MotionEvent event) {
        try {
            if (!Settings.swipeFeeds() || !isHomeFeed(SduiMediaDownload.resumedScreen())) return;
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = event.getRawX();
                    downY = event.getRawY();
                    downTime = event.getEventTime();
                    multiTouch = false;
                    break;
                case MotionEvent.ACTION_POINTER_DOWN:
                    multiTouch = true;
                    break;
                case MotionEvent.ACTION_UP:
                    if (multiTouch || TextSelectionOverlay.isActive() || handledDownTime == downTime) return;
                    float dx = event.getRawX() - downX;
                    float dy = event.getRawY() - downY;
                    if (event.getEventTime() - downTime > MAX_DURATION) return;
                    if (Math.abs(dx) < view.getRootView().getWidth() * 0.25f || Math.abs(dx) < Math.abs(dy) * 2.5f) {
                        return;
                    }
                    handledDownTime = downTime;
                    // Swiping left goes to the tab on the right, like turning a page.
                    if (switchTo(view, dx < 0 ? 1 : 0, (int) downX, (int) downY)) {
                        // Photos and videos take a swipe that ends on them for a tap and open.
                        event.setAction(MotionEvent.ACTION_CANCEL);
                    }
                    break;
                default:
                    break;
            }
        } catch (Throwable t) {
            Diagnostics.error("feed swipe failed", t);
        }
    }

    /** The home screen, or one of its feeds, which resume inside it. */
    private static boolean isHomeFeed(String screen) {
        return screen.endsWith(".feed.MainFeed") || screen.endsWith(".feed.ForYouFeed")
                || screen.endsWith(".feed.NetworkFeed");
    }

    /**
     * Taps tab 0 (For you) or 1 (Network), unless the swipe started on a carousel. The tabs are in the home screen's
     * header, a different Compose view than the feed, so every Compose view of the window is searched.
     *
     * @return whether the swipe was taken (the touch is then cancelled for the screen).
     */
    private static boolean switchTo(View view, int tab, int startX, int startY) throws ReflectiveOperationException {
        List<View> composeViews = new ArrayList<>();
        findComposeViews(view.getRootView(), composeViews);
        Rect bounds = new Rect();
        Rect target = null;
        boolean targetSelected = false;
        for (View composeView : composeViews) {
            AccessibilityNodeProvider provider = CopyTextPatch.provider(composeView);
            int[] ids = CopyTextPatch.semanticsNodeIds(composeView);
            if (provider == null || ids == null) continue;
            for (int id : ids) {
                AccessibilityNodeInfo info = provider.createAccessibilityNodeInfo(id);
                if (info == null || !info.isVisibleToUser()) continue;
                if (scrollsSideways(info) || PAGES.matcher(label(info)).find()) {
                    info.getBoundsInScreen(bounds);
                    if (bounds.contains(startX, startY)) {
                        Settings.debugLog("feed swipe: left to a carousel or document");
                        return false;
                    }
                }
                if (tabIndex(info) == tab) {
                    target = new Rect();
                    info.getBoundsInScreen(target);
                    targetSelected = isSelected(info);
                }
            }
        }
        if (target == null || target.isEmpty()) {
            Settings.debugLog("feed swipe: tabs not on screen (" + composeViews.size() + " views)");
            return false;
        }
        // Swiping toward the open tab does nothing, but it must not open a photo either.
        if (targetSelected) return true;
        // Nested Compose views can each see the same swipe.
        long now = SystemClock.uptimeMillis();
        if (now - lastSwitch < 700) return true;
        lastSwitch = now;
        Settings.debugLog("feed swipe: " + (tab == 0 ? "For you" : "Network"));
        // After the swipe's own touch has finished.
        final Rect tabBounds = target;
        MAIN.post(() -> tap(view.getRootView(), tabBounds.exactCenterX(), tabBounds.exactCenterY()));
        return true;
    }

    private static void findComposeViews(View view, List<View> out) {
        if (view.getClass().getName().endsWith("AndroidComposeView")) out.add(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) findComposeViews(group.getChildAt(i), out);
        }
    }

    /** A touch down and up at a screen point, the way a finger taps. */
    private static void tap(View root, float screenX, float screenY) {
        int[] origin = new int[2];
        root.getLocationOnScreen(origin);
        float x = screenX - origin[0];
        float y = screenY - origin[1];
        long time = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(time, time, MotionEvent.ACTION_DOWN, x, y, 0);
        MotionEvent up = MotionEvent.obtain(time, time + 40, MotionEvent.ACTION_UP, x, y, 0);
        down.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        up.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        root.dispatchTouchEvent(down);
        root.dispatchTouchEvent(up);
        down.recycle();
        up.recycle();
    }

    /** 0 for the For you tab, 1 for Network, -1 for anything else. Their descriptions: "For you, 1 of 2". */
    private static int tabIndex(AccessibilityNodeInfo info) {
        String label = label(info);
        if (label.startsWith("For you") || label.contains(", 1 of 2")) return 0;
        if (label.startsWith("Network") || label.contains(", 2 of 2")) return 1;
        return -1;
    }

    private static boolean isSelected(AccessibilityNodeInfo info) {
        return info.isSelected() || info.isChecked() || label(info).contains("selected");
    }

    private static String label(AccessibilityNodeInfo info) {
        CharSequence description = info.getContentDescription();
        CharSequence text = info.getText();
        return description != null ? description.toString() : text != null ? text.toString() : "";
    }

    private static boolean scrollsSideways(AccessibilityNodeInfo info) {
        if ("android.widget.HorizontalScrollView".contentEquals(info.getClassName() == null ? "" : info.getClassName())) {
            return true;
        }
        for (AccessibilityNodeInfo.AccessibilityAction action : info.getActionList()) {
            int id = action.getId();
            if (id == android.R.id.accessibilityActionScrollLeft || id == android.R.id.accessibilityActionScrollRight
                    || id == android.R.id.accessibilityActionPageLeft
                    || id == android.R.id.accessibilityActionPageRight) {
                return true;
            }
        }
        return false;
    }
}
