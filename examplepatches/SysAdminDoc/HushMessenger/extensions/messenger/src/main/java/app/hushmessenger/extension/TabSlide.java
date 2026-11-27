package app.hushmessenger.extension;

import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * `Slide along the tab bar` (#194), under Swipe between tabs. A finger that goes down on one of the bar's tab buttons
 * and moves sideways takes the gesture: a highlight follows it along the bar with a tick at each tab it reaches, and
 * letting go opens the tab under it through the same call a tap on that tab's button makes. A tap still lands on the
 * button. It rides on the frame Swipe between tabs puts around the home screen, which goes on when either switch is on.
 * The plain bar has a button per tab. The floating bar draws its tabs, and says where they are only to accessibility.
 */
final class TabSlide {
    static final String KEY = "tab_bar_slide";
    /** The bar sits in the bottom part of the home screen, which keeps a row of buttons higher up from passing for it. */
    private static final float BAR_FROM = 0.7f;
    /** Tabs in one bar have their tops within this many dp of each other. */
    private static final int SAME_ROW_DP = 8;
    private static final int LENS_FILL = 0x387F7F7F;
    private static final int LENS_EDGE = 0x80FFFFFF;

    private TabSlide() {}

    /** Its own switch, read on every touch. It counts wherever Swipe between tabs is in the bundle. */
    static boolean on() {
        return Settings.installed.contains(TabSwipe.KEY) && Settings.running() && Settings.preferences != null
            && Settings.preferences.getBoolean(KEY, false);
    }

    /**
     * The bar under the point [x], [y] on screen inside [frame], when it holds one tab for each tab the bar shows
     * ([shown], or [all] when the bar shows them all), side by side near the bottom. Null anywhere else.
     */
    static Bar barAt(ViewGroup frame, int x, int y, List<Object> shown, List<Object> all) {
        Bar buttons = buttonBarAt(frame, x, y, shown, all);
        return buttons != null ? buttons : drawnBarAt(frame, x, y, shown, all);
    }

    /** The plain bar: the row the tab button under the point sits in, one button for each tab. */
    private static Bar buttonBarAt(ViewGroup frame, int x, int y, List<Object> shown, List<Object> all) {
        View button = buttonAt(frame, x, y);
        if (button == null || !(button.getParent() instanceof ViewGroup)) return null;
        ViewGroup row = (ViewGroup) button.getParent();
        if (ChatJump.isList(row.getClass())) return null;
        List<View> buttons = new ArrayList<>();
        for (int i = 0; i < row.getChildCount(); i++) {
            View child = row.getChildAt(i);
            if (child.getVisibility() == View.VISIBLE && child.isClickable() && child.getWidth() > 0) buttons.add(child);
        }
        List<Object> tabs = tabsFor(buttons.size(), shown, all);
        if (tabs == null) return null;
        Collections.sort(buttons, (a, b) -> Integer.compare(a.getLeft(), b.getLeft()));
        Slots slots = new Buttons(buttons);
        return alongTheBottom(frame, slots) ? new Bar(frame, slots, tabs) : null;
    }

    /**
     * The floating bar Messenger 588 draws (#194): one view that paints every tab itself, so it has no tab buttons, and
     * tells accessibility where each tab is, one virtual node per tab, numbered from 0 the way the bar lists them.
     */
    private static Bar drawnBarAt(ViewGroup frame, int x, int y, List<Object> shown, List<Object> all) {
        for (View view = viewAt(frame, x, y); view != null && view != frame; view = parentOf(view)) {
            // A tab bar never sits inside a list, so a row of a list is never one.
            if (ChatJump.isList(view.getClass())) return null;
            AccessibilityNodeProvider provider = view.getAccessibilityNodeProvider();
            if (provider == null) continue;
            AccessibilityNodeInfo host = provider.createAccessibilityNodeInfo(View.NO_ID);
            if (host == null) continue;
            List<Object> tabs = tabsFor(host.getChildCount(), shown, all);
            if (tabs == null) continue;
            List<Rect> places = new ArrayList<>();
            for (int i = 0; i < tabs.size(); i++) {
                AccessibilityNodeInfo tab = provider.createAccessibilityNodeInfo(i);
                if (tab == null || !tab.isClickable()) break;
                Rect place = new Rect();
                tab.getBoundsInScreen(place);
                if (place.isEmpty()) break;
                places.add(place);
            }
            if (places.size() != tabs.size()) continue;
            Collections.sort(places, (a, b) -> Integer.compare(a.left, b.left));
            if (!sideBySide(frame, places) || !inside(places, x, y)) continue;
            Slots slots = new Drawn(view, places);
            if (alongTheBottom(frame, slots)) return new Bar(frame, slots, tabs);
        }
        return null;
    }

    /** The tabs a bar of [count] tabs stands for, or null when it isn't a bar of them. */
    private static List<Object> tabsFor(int count, List<Object> shown, List<Object> all) {
        if (count < 2) return null;
        return count == shown.size() ? shown : count == all.size() ? all : null;
    }

    /** One row, with its tops close together, in the bottom part of the home screen. */
    private static boolean alongTheBottom(ViewGroup frame, Slots slots) {
        int rowGap = Math.round(SAME_ROW_DP * frame.getResources().getDisplayMetrics().density);
        int top = slots.onScreen(0).top;
        for (int i = 1; i < slots.count(); i++) if (Math.abs(slots.onScreen(i).top - top) > rowGap) return false;
        int[] frameAt = new int[2];
        frame.getLocationOnScreen(frameAt);
        return top >= frameAt[1] + frame.getHeight() * BAR_FROM;
    }

    /** Left to right, each one starting where the one before it ends, give or take a row's gap. */
    private static boolean sideBySide(ViewGroup frame, List<Rect> places) {
        int gap = Math.round(SAME_ROW_DP * frame.getResources().getDisplayMetrics().density);
        for (int i = 1; i < places.size(); i++) {
            if (Math.abs(places.get(i).left - places.get(i - 1).right) > gap) return false;
        }
        return true;
    }

    private static boolean inside(List<Rect> places, int x, int y) {
        for (Rect place : places) if (place.contains(x, y)) return true;
        return false;
    }

    /** The deepest shown view under the point, whether or not it takes a tap. */
    private static View viewAt(View view, int x, int y) {
        if (view.getVisibility() != View.VISIBLE || !contains(view, x, y)) return null;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                View found = viewAt(group.getChildAt(i), x, y);
                if (found != null) return found;
            }
        }
        return view;
    }

    private static View parentOf(View view) {
        return view.getParent() instanceof View ? (View) view.getParent() : null;
    }

    /** The deepest view under the point that takes a tap. */
    private static View buttonAt(View view, int x, int y) {
        if (view.getVisibility() != View.VISIBLE || !contains(view, x, y)) return null;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                View found = buttonAt(group.getChildAt(i), x, y);
                if (found != null) return found;
            }
        }
        return view.isClickable() ? view : null;
    }

    private static boolean contains(View view, int x, int y) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return x >= at[0] && y >= at[1] && x < at[0] + view.getWidth() && y < at[1] + view.getHeight();
    }

    /** Where each tab of a bar sits on screen, left to right. */
    interface Slots {
        int count();

        Rect onScreen(int index);
    }

    /** A plain bar's tab buttons. */
    private static final class Buttons implements Slots {
        private final List<View> buttons;

        Buttons(List<View> buttons) {
            this.buttons = buttons;
        }

        @Override public int count() {
            return buttons.size();
        }

        @Override public Rect onScreen(int index) {
            View button = buttons.get(index);
            int[] at = new int[2];
            button.getLocationOnScreen(at);
            return new Rect(at[0], at[1], at[0] + button.getWidth(), at[1] + button.getHeight());
        }
    }

    /** The tabs a drawn bar told accessibility about, kept against the bar's view so they go where it goes. */
    private static final class Drawn implements Slots {
        private final View bar;
        private final List<Rect> places = new ArrayList<>();

        Drawn(View bar, List<Rect> onScreen) {
            this.bar = bar;
            int[] at = new int[2];
            bar.getLocationOnScreen(at);
            for (Rect place : onScreen) {
                Rect inBar = new Rect(place);
                inBar.offset(-at[0], -at[1]);
                places.add(inBar);
            }
        }

        @Override public int count() {
            return places.size();
        }

        @Override public Rect onScreen(int index) {
            int[] at = new int[2];
            bar.getLocationOnScreen(at);
            Rect place = new Rect(places.get(index));
            place.offset(at[0], at[1]);
            return place;
        }
    }

    /** The tabs of one bar, left to right, each with the tab it opens, and the highlight a slide draws over them. */
    static final class Bar {
        private final ViewGroup frame;
        private final Slots slots;
        final List<Object> tabs;
        private GradientDrawable lens;
        private int over = -1;

        Bar(ViewGroup frame, Slots slots, List<Object> tabs) {
            this.frame = frame;
            this.slots = slots;
            this.tabs = tabs;
        }

        /** The tab under [x] on screen, or the end of the bar the finger has gone past. */
        int indexAt(float x) {
            for (int i = 0; i < slots.count(); i++) if (x < slots.onScreen(i).right) return i;
            return slots.count() - 1;
        }

        /** Moves the highlight to the finger at [x], kept on the bar, and ticks when it reaches another tab. */
        void slideTo(float x) {
            int index = indexAt(x);
            Rect under = slots.onScreen(index);
            Rect first = slots.onScreen(0), last = slots.onScreen(slots.count() - 1);
            int[] frameAt = new int[2];
            frame.getLocationOnScreen(frameAt);
            int width = under.width(), height = under.height();
            int left = Math.round(x) - width / 2;
            left = Math.max(first.left, Math.min(left, last.right - width)) - frameAt[0];
            int top = under.top - frameAt[1];
            if (lens == null) {
                lens = new GradientDrawable();
                float density = frame.getResources().getDisplayMetrics().density;
                lens.setColor(LENS_FILL);
                lens.setStroke(Math.max(1, Math.round(density)), LENS_EDGE);
                frame.getOverlay().add(lens);
            }
            lens.setCornerRadius(height / 2f);
            lens.setBounds(left, top, left + width, top + height);
            if (over >= 0 && index != over) frame.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
            over = index;
        }

        /** Where the highlight is drawn in the frame, or null once it's gone. Tests read it. */
        Rect lens() {
            return lens == null ? null : new Rect(lens.getBounds());
        }

        /** Takes the highlight off the bar. */
        void end() {
            if (lens != null) frame.getOverlay().remove(lens);
            lens = null;
            over = -1;
        }
    }
}
