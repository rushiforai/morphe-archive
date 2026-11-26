package app.hushmessenger.extension;

import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * `Slide along the tab bar` (#194), under Swipe between tabs. A finger that goes down on one of the bar's tab buttons
 * and moves sideways takes the gesture: a highlight follows it along the bar with a tick at each tab it reaches, and
 * letting go opens the tab under it through the same call a tap on that tab's button makes. A tap still lands on the
 * button. It rides on the frame Swipe between tabs puts around the home screen, which goes on when either switch is on.
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
     * The bar under the point [x], [y] on screen inside [frame]: the row the tab button there sits in, when that row
     * holds one button for each tab the bar shows ([shown], or [all] when the bar shows them all), side by side near
     * the bottom. Null anywhere else.
     */
    static Bar barAt(ViewGroup frame, int x, int y, List<Object> shown, List<Object> all) {
        View button = buttonAt(frame, x, y);
        if (button == null || !(button.getParent() instanceof ViewGroup)) return null;
        ViewGroup row = (ViewGroup) button.getParent();
        if (ChatJump.isList(row.getClass())) return null;
        List<View> buttons = new ArrayList<>();
        for (int i = 0; i < row.getChildCount(); i++) {
            View child = row.getChildAt(i);
            if (child.getVisibility() == View.VISIBLE && child.isClickable() && child.getWidth() > 0) buttons.add(child);
        }
        List<Object> tabs = buttons.size() == shown.size() ? shown : buttons.size() == all.size() ? all : null;
        if (tabs == null || buttons.size() < 2) return null;
        Collections.sort(buttons, (a, b) -> Integer.compare(a.getLeft(), b.getLeft()));
        int rowGap = Math.round(SAME_ROW_DP * frame.getResources().getDisplayMetrics().density);
        for (View other : buttons) if (Math.abs(other.getTop() - buttons.get(0).getTop()) > rowGap) return null;
        int[] frameAt = new int[2], rowAt = new int[2];
        frame.getLocationOnScreen(frameAt);
        row.getLocationOnScreen(rowAt);
        if (rowAt[1] + buttons.get(0).getTop() < frameAt[1] + frame.getHeight() * BAR_FROM) return null;
        return new Bar(frame, buttons, tabs);
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

    /** The tab buttons of one bar, left to right, each with the tab it opens, and the highlight a slide draws over them. */
    static final class Bar {
        private final ViewGroup frame;
        final List<View> buttons;
        final List<Object> tabs;
        private GradientDrawable lens;
        private int over = -1;

        Bar(ViewGroup frame, List<View> buttons, List<Object> tabs) {
            this.frame = frame;
            this.buttons = buttons;
            this.tabs = tabs;
        }

        /** The tab under [x] on screen, or the end of the bar the finger has gone past. */
        int indexAt(float x) {
            int[] at = new int[2];
            for (int i = 0; i < buttons.size(); i++) {
                View button = buttons.get(i);
                button.getLocationOnScreen(at);
                if (x < at[0] + button.getWidth()) return i;
            }
            return buttons.size() - 1;
        }

        /** Moves the highlight to the finger at [x], kept on the bar, and ticks when it reaches another tab. */
        void slideTo(float x) {
            int index = indexAt(x);
            View under = buttons.get(index);
            int[] frameAt = new int[2], first = new int[2], last = new int[2], at = new int[2];
            frame.getLocationOnScreen(frameAt);
            buttons.get(0).getLocationOnScreen(first);
            View end = buttons.get(buttons.size() - 1);
            end.getLocationOnScreen(last);
            under.getLocationOnScreen(at);
            int width = under.getWidth(), height = under.getHeight();
            int left = Math.round(x) - width / 2;
            left = Math.max(first[0], Math.min(left, last[0] + end.getWidth() - width)) - frameAt[0];
            int top = at[1] - frameAt[1];
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
