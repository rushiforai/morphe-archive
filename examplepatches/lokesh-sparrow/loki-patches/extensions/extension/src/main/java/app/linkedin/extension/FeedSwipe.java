/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    private static float lastMoveX;
    private static float lastMoveY;
    /** The touch already reported as ignored: nested Compose views each see it. */
    private static long ignoredDownTime = -1;

    private static void ignored(String why) {
        if (ignoredDownTime == downTime) return;
        ignoredDownTime = downTime;
        Settings.debugLog("feed swipe: ignored, " + why);
    }
    /**
     * The last rect a tab was found at, per screen and tab. The My Network header stops exposing the inactive tab
     * to accessibility as soon as one is selected, but its position does not move, so the rect can be reused.
     */
    private static final Map<String, Rect> lastTabBounds = new HashMap<>();

    private FeedSwipe() {
    }

    /** Injection point, at the start of AndroidComposeView.dispatchTouchEvent. Only watches the touch. */
    public static void onTouch(View view, MotionEvent event) {
        try {
            if (!Settings.swipeFeeds()) return;
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = event.getRawX();
                    downY = event.getRawY();
                    downTime = event.getEventTime();
                    multiTouch = false;
                    lastMoveX = downX;
                    lastMoveY = downY;
                    break;
                case MotionEvent.ACTION_POINTER_DOWN:
                    multiTouch = true;
                    break;
                case MotionEvent.ACTION_UP:
                    if (handledDownTime == downTime) return;
                    float dx = event.getRawX() - downX;
                    float dy = event.getRawY() - downY;
                    boolean sideways = Math.abs(dx) >= view.getRootView().getWidth() * 0.25f
                            && Math.abs(dx) >= Math.abs(dy) * 2.5f;
                    if (!sideways) return;
                    // A real sideways swipe from here on: say why one is not taken, so a report names the cause.
                    if (multiTouch) {
                        ignored("two fingers");
                        return;
                    }
                    if (TextSelectionOverlay.isShowing()) {
                        ignored("a Copy text selection is open");
                        return;
                    }
                    if (event.getEventTime() - downTime > MAX_DURATION) {
                        ignored("too slow (" + (event.getEventTime() - downTime) + " ms)");
                        return;
                    }
                    handledDownTime = downTime;
                    // Swiping left goes to the tab on the right, like turning a page.
                    if (switchTo(view, dx < 0 ? 1 : 0, (int) downX, (int) downY)) {
                        // A selection parked while the feed scrolled belongs to the tab being left.
                        if (TextSelectionOverlay.isActive()) TextSelectionOverlay.dismissActive();
                        // Photos and videos take a swipe that ends on them for a tap and open.
                        event.setAction(MotionEvent.ACTION_CANCEL);
                    }
                    break;
                case MotionEvent.ACTION_MOVE:
                    lastMoveX = event.getRawX();
                    lastMoveY = event.getRawY();
                    break;
                case MotionEvent.ACTION_CANCEL:
                    // A parent that takes a sideways drag never lets the swipe reach ACTION_UP here.
                    if (handledDownTime != downTime && Math.abs(lastMoveX - downX) > view.getRootView().getWidth() * 0.1f
                            && Math.abs(lastMoveX - downX) >= Math.abs(lastMoveY - downY) * 2.5f) {
                        if (onMyNetwork() && cancelledSwipe(view, event)) break;
                        ignored("the app took the gesture (cancelled after " + (int) Math.abs(lastMoveX - downX) + " px)");
                    }
                    break;
                default:
                    break;
            }
        } catch (Throwable t) {
            Diagnostics.error("feed swipe failed", t);
        }
    }

    /**
     * On My Network the page under the finger takes a long sideways drag and cancels it here, so the swipe never ends
     * with ACTION_UP. The cancel then stands in for the finger lifting: same distance, angle and speed rules.
     *
     * @return whether the swipe was taken.
     */
    private static boolean cancelledSwipe(View view, MotionEvent event) throws ReflectiveOperationException {
        float dx = lastMoveX - downX;
        float dy = lastMoveY - downY;
        if (Math.abs(dx) < view.getRootView().getWidth() * 0.25f || Math.abs(dx) < Math.abs(dy) * 2.5f) return false;
        if (multiTouch || TextSelectionOverlay.isShowing()) return false;
        if (event.getEventTime() - downTime > MAX_DURATION) return false;
        handledDownTime = downTime;
        Settings.debugLog("feed swipe: My Network page cancelled the swipe, switching anyway");
        switchTo(view, dx < 0 ? 1 : 0, (int) downX, (int) downY);
        return true;
    }

    private static boolean onMyNetwork() {
        return SduiMediaDownload.resumedScreen().endsWith(".MyNetwork");
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
        // Home tabs and My Network tabs are kept apart: the home feed stays attached behind My Network, and its
        // selected "For you, 1 of 2" tab must not be mistaken for Grow.
        Rect homeTarget = null;
        boolean homeSelected = false;
        Rect networkTarget = null;
        Rect networkOther = null;
        boolean networkSelected = false;
        boolean networkTabsShown = false;
        for (View composeView : composeViews) {
            AccessibilityNodeProvider provider = CopyTextPatch.provider(composeView);
            int[] ids = CopyTextPatch.semanticsNodeIds(composeView);
            if (provider == null || ids == null) continue;
            for (int id : ids) {
                AccessibilityNodeInfo info = provider.createAccessibilityNodeInfo(id);
                if (info == null) continue;
                // A tab can still be reachable while the app marks it invisible to accessibility: match it anyway.
                if (info.isVisibleToUser() && (scrollsSideways(info) || PAGES.matcher(label(info)).find())) {
                    info.getBoundsInScreen(bounds);
                    if (bounds.contains(startX, startY)) {
                        Settings.debugLog("feed swipe: left to a carousel or document (" + label(info) + " " + bounds + ")");
                        return false;
                    }
                }
                int index = tabIndex(info);
                if (index < 0) continue;
                Rect found = new Rect();
                info.getBoundsInScreen(found);
                if (myNetworkTab(info)) {
                    if (info.isVisibleToUser() && !found.isEmpty()) networkTabsShown = true;
                    if (index == tab) {
                        networkTarget = found;
                        networkSelected = isSelected(info);
                        Settings.debugLog("feed swipe: tab " + label(info) + " " + found + " selected=" + networkSelected);
                    } else {
                        networkOther = found;
                    }
                } else if (index == tab && !found.isEmpty() && (homeTarget == null || found.top < homeTarget.top)) {
                    // A post with two photos also reads ", 1 of 2": the real tab is the one highest on screen.
                    homeTarget = found;
                    homeSelected = isSelected(info);
                }
            }
        }
        Rect target;
        boolean targetSelected;
        if ((networkTabsShown || networkTarget != null) && (onMyNetwork() || homeTarget == null)) {
            target = networkTarget;
            // The selected flag of the My Network tabs is not reliable; tapping the open tab does no harm.
            targetSelected = false;
            if (target == null) target = movedWith(view.getRootView(), tab, networkOther);
            if (networkOther != null && !networkOther.isEmpty()) remember(1 - tab, networkOther);
        } else {
            target = homeTarget;
            targetSelected = homeSelected;
        }
        if (target == null) {
            // The tabs of My Network (Grow, Catch up) are regular views, not Compose.
            View[] found = new View[1];
            findNativeTab(view.getRootView(), tab, found);
            if (found[0] != null) {
                target = new Rect();
                found[0].getGlobalVisibleRect(target);
                // The tab's own state, as TalkBack would read it; the parents (the whole bar) are not reliable.
                AccessibilityNodeInfo info = found[0].createAccessibilityNodeInfo();
                targetSelected = false;
                Settings.debugLog("feed swipe: native tab " + tabName(tab) + " at " + target
                        + " selected=" + targetSelected);
            }
        }
        if (target == null) {
            // The My Network header stops exposing the inactive tab once one is selected; its place has not moved.
            target = remembered(view.getRootView(), tab);
            if (target != null) Settings.debugLog("feed swipe: " + tabName(tab) + " remembered at " + target);
        }
        if ((target == null || target.isEmpty()) && onMyNetwork()) {
            // On Catch up, LinkedIn hides Grow from accessibility and Grow was never seen: it sits right beside
            // Catch up, so tap the same-sized spot next to it.
            target = beside(view.getRootView(), tab, networkOther);
        }
        if (target == null || target.isEmpty()) {
            Settings.debugLog("feed swipe: tabs not on screen (" + composeViews.size() + " views)");
            return false;
        }
        remember(tab, target);
        // Swiping toward the open tab does nothing, but it must not open a photo either.
        if (targetSelected) {
            Settings.debugLog("feed swipe: " + tabName(tab) + " is open already");
            return true;
        }
        // Nested Compose views can each see the same swipe.
        long now = SystemClock.uptimeMillis();
        if (now - lastSwitch < 700) {
            Settings.debugLog("feed swipe: ignored, switched just now");
            return true;
        }
        lastSwitch = now;
        Settings.debugLog("feed swipe: " + tabName(tab));
        // After the swipe's own touch has finished.
        final Rect tabBounds = target;
        MAIN.post(() -> tap(view.getRootView(), tabBounds.exactCenterX(), tabBounds.exactCenterY()));
        return true;
    }

    /** A shown view labeled with a tab name (text or description), for the tabs that are not drawn by Compose. */
    private static void findNativeTab(View view, int tab, View[] out) {
        if (out[0] != null || view.getVisibility() != View.VISIBLE) return;
        CharSequence text = view instanceof android.widget.TextView ? ((android.widget.TextView) view).getText() : null;
        CharSequence description = view.getContentDescription();
        String label = text != null && text.length() > 0 ? text.toString()
                : description != null ? description.toString() : "";
        boolean match = tab == 0 ? label.startsWith("Grow") : label.startsWith("Catch up");
        if (match && view.isShown() && view.getWidth() > 0) {
            Rect visible = new Rect();
            if (view.getGlobalVisibleRect(visible) && !visible.isEmpty()) {
                out[0] = view;
                return;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) findNativeTab(group.getChildAt(i), tab, out);
        }
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
        if (label.startsWith("For you") || label.startsWith("Grow") || label.contains(", 1 of 2")) return 0;
        if (label.startsWith("Network") || label.startsWith("Catch up") || label.contains(", 2 of 2")) return 1;
        return -1;
    }

    /** The Grow and Catch up tabs of My Network. */
    private static boolean myNetworkTab(AccessibilityNodeInfo info) {
        String label = label(info);
        return label.startsWith("Grow") || label.startsWith("Catch up");
    }

    /** The tab's name for the log: the home feed and My Network have different pairs. */
    private static String tabName(int tab) {
        if (SduiMediaDownload.resumedScreen().endsWith(".MyNetwork")) return tab == 0 ? "Grow" : "Catch up";
        return tab == 0 ? "For you" : "Network";
    }

    /**
     * A spot beside the other My Network tab: Grow sits left of Catch up, Catch up right of Grow, same size, with a
     * small gap. The other tab is taken from the screen if present, otherwise from where it was last tapped.
     */
    private static Rect beside(View root, int tab, Rect otherNow) {
        Rect other = otherNow != null && !otherNow.isEmpty() ? otherNow
                : lastTabBounds.get(SduiMediaDownload.resumedScreen() + "|" + (1 - tab));
        if (other == null || other.isEmpty()) return null;
        int width = other.width();
        int gap = Math.max(width / 8, 1);
        Rect spot = tab == 0
                ? new Rect(other.left - gap - width, other.top, other.left - gap, other.bottom)
                : new Rect(other.right + gap, other.top, other.right + gap + width, other.bottom);
        int[] origin = new int[2];
        root.getLocationOnScreen(origin);
        if (spot.exactCenterX() < origin[0] || spot.exactCenterX() > origin[0] + root.getWidth()) return null;
        Settings.debugLog("feed swipe: " + tabName(tab) + " placed beside the other tab at " + spot);
        return spot;
    }

    /**
     * The hidden My Network tab, placed from where it was last seen and moved by as much as the visible tab moved
     * since (the header slides down when the page scrolls up).
     */
    private static Rect movedWith(View root, int tab, Rect otherNow) {
        Rect last = lastTabBounds.get(SduiMediaDownload.resumedScreen() + "|" + tab);
        Rect otherLast = lastTabBounds.get(SduiMediaDownload.resumedScreen() + "|" + (1 - tab));
        if (last == null || otherNow == null || otherLast == null || otherNow.isEmpty()) return null;
        Rect moved = new Rect(last);
        moved.offset(otherNow.left - otherLast.left, otherNow.top - otherLast.top);
        Settings.debugLog("feed swipe: " + tabName(tab) + " placed next to the shown tab at " + moved);
        return moved;
    }

    /** Remembers where a tab was found, so it can be tapped again while the app hides it from accessibility. */
    private static void remember(int tab, Rect rect) {
        if (rect == null || rect.isEmpty()) return;
        lastTabBounds.put(SduiMediaDownload.resumedScreen() + "|" + tab, new Rect(rect));
    }

    /** A remembered rect that is still on screen and in the header area, or null. */
    private static Rect remembered(View root, int tab) {
        Rect rect = lastTabBounds.get(SduiMediaDownload.resumedScreen() + "|" + tab);
        if (rect == null || rect.isEmpty()) return null;
        int[] origin = new int[2];
        root.getLocationOnScreen(origin);
        int left = rect.left - origin[0];
        int top = rect.top - origin[1];
        // The tab bar sits at the top; anything else means the layout moved and the rect is stale.
        if (left < 0 || top < 0 || left > root.getWidth() || top > root.getHeight() * 0.5f) return null;
        return new Rect(rect);
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
