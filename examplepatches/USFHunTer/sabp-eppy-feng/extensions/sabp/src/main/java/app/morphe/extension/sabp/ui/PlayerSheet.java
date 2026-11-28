package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.util.SparseArray;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.PathInterpolator;
import android.widget.AbsListView;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.sabp.EppyTheme;

/**
 * YouTube Music–style player sheet with three resting states: collapsed (the tab strip peeks at
 * the bottom of Now Playing), half and fully expanded.
 *
 * <ul>
 *     <li>Drag from the handle/tab strip or any part of the sheet that isn't scrolling; flings
 *     move to the next state in the fling's direction, slow releases snap to the nearest.</li>
 *     <li>Nested scrolling: dragging up on a half sheet expands it first; once expanded the list
 *     scrolls. Dragging down scrolls the list until it's at its top, then moves the sheet.</li>
 *     <li>Swipe sideways on the content (away from the screen edges, where the system back
 *     gesture lives) to change tab; each tab keeps its scroll position.</li>
 *     <li>Tapping the handle or the expand button toggles; Back collapses; predictive back on
 *     Android 14+ previews the collapse. TalkBack gets expand/collapse actions.</li>
 * </ul>
 * Opening, dragging or closing it never touches playback.
 */
public final class PlayerSheet {
    public static final int TAB_CHAPTERS = 0, TAB_READ = 1, TAB_BOOKMARKS = 2, TAB_DETAILS = 3, TAB_UP_NEXT = 4;
    public static final int COLLAPSED = 0, HALF = 1, EXPANDED = 2;
    private static final String[] TABS = {"Chapters", "Read along", "Bookmarks", "Details", "Up next"};
    private static final int ACTION_EXPAND = 0x7e020001, ACTION_COLLAPSE = 0x7e020002;

    public interface Tab {
        View view();

        /** Called when the tab becomes visible or playback changes (full) or every tick (!full). */
        void refresh(boolean full);
    }

    private final Context c;
    private final EppyTheme t;
    private final Host host;
    public final FrameLayout root;     // sized to the whole player; sheet slides inside it
    private final SheetView sheet;
    private final LinearLayout header;
    private final LinearLayout tabStrip;
    private final FrameLayout content;
    private final ImageView toggle;
    private final Tab[] tabs = new Tab[TABS.length];
    private final SparseArray<int[]> scrollState = new SparseArray<>();
    private final TextView[] tabViews = new TextView[TABS.length];
    private int current = TAB_CHAPTERS;
    private int state = COLLAPSED;
    private final int peek;
    private final int touchSlop, edge;

    public PlayerSheet(Host host, EppyTheme t) {
        this.host = host;
        this.c = host.activity();
        this.t = t;
        peek = Ui.dp(c, 76);
        touchSlop = ViewConfiguration.get(c).getScaledTouchSlop();
        edge = Ui.dp(c, 28);

        root = new FrameLayout(c);
        root.setClipChildren(true);

        sheet = new SheetView(c);
        sheet.setOrientation(LinearLayout.VERTICAL);
        float r = Ui.dp(c, 28);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(t.surfaceContainerLow);
        bg.setCornerRadii(new float[]{r, r, r, r, 0, 0, 0, 0});
        sheet.setBackground(bg);
        sheet.setElevation(Ui.dp(c, 8));
        sheet.setClickable(true);

        header = Ui.column(c);
        header.setPadding(0, Ui.dp(c, 6), 0, Ui.dp(c, 6));
        FrameLayout handleRow = new FrameLayout(c);
        View handle = new View(c);
        handle.setBackground(Ui.rounded(t.outline, Ui.dp(c, 2)));
        handleRow.addView(handle, new FrameLayout.LayoutParams(Ui.dp(c, 32), Ui.dp(c, 4), Gravity.CENTER));
        toggle = new ImageView(c);
        toggle.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        toggle.setPadding(Ui.dp(c, 6), Ui.dp(c, 6), Ui.dp(c, 6), Ui.dp(c, 6));
        toggle.setBackground(Ui.ripple(t, null, Ui.dp(c, 16)));
        toggle.setOnClickListener(v -> toggleState());
        handleRow.addView(toggle, new FrameLayout.LayoutParams(Ui.dp(c, 32), Ui.dp(c, 32), Gravity.END | Gravity.CENTER_VERTICAL));
        handleRow.setOnClickListener(v -> toggleState());
        handleRow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams hl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 24));
        hl.setMargins(0, 0, Ui.dp(c, 12), Ui.dp(c, 2));
        header.addView(handleRow, hl);
        HorizontalScrollView hs = new HorizontalScrollView(c);
        hs.setHorizontalScrollBarEnabled(false);
        tabStrip = Ui.row(c);
        tabStrip.setPadding(Ui.dp(c, 12), 0, Ui.dp(c, 12), 0);
        hs.addView(tabStrip);
        header.addView(hs);
        sheet.addView(header, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, peek));

        content = new FrameLayout(c);
        // The sheet is as tall as the player and sits topOffset() down when expanded.
        content.setPadding(0, 0, 0, Ui.dp(c, 56));
        sheet.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));

        root.addView(sheet, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        sheet.setVisibility(View.INVISIBLE); // shown after the first layout puts it in place
        root.addOnLayoutChangeListener((v, l, tp, rt, b, ol, ot, or, ob) -> {
            if (b - tp != ob - ot) {
                snap(state, false);
                sheet.setVisibility(View.VISIBLE);
            }
        });
        sheet.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                if (state != EXPANDED) info.addAction(new AccessibilityNodeInfo.AccessibilityAction(ACTION_EXPAND, "Expand sheet"));
                if (state != COLLAPSED) info.addAction(new AccessibilityNodeInfo.AccessibilityAction(ACTION_COLLAPSE, "Collapse sheet"));
            }

            @Override
            public boolean performAccessibilityAction(View host, int action, Bundle args) {
                if (action == ACTION_EXPAND) show(current);
                else if (action == ACTION_COLLAPSE) collapse();
                else return super.performAccessibilityAction(host, action, args);
                return true;
            }
        });
        buildTabs();
        updateToggle();
    }

    public void setTab(int index, Tab tab) {
        tabs[index] = tab;
    }

    public int peekHeight() {
        return peek;
    }

    public boolean isExpanded() {
        return state != COLLAPSED;
    }

    public int state() {
        return state;
    }

    private void buildTabs() {
        tabStrip.removeAllViews();
        for (int i = 0; i < TABS.length; i++) {
            final int idx = i;
            // Same weight selected or not: only colours change, so tabs never shift.
            TextView tv = Ui.label(c, t, TABS[i], 14, 600, t.onSurfaceVariant);
            tv.setIncludeFontPadding(false);
            tv.setGravity(Gravity.CENTER);
            tv.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 8));
            tv.setMinHeight(Ui.dp(c, 40));
            tv.setClickable(true);
            tv.setFocusable(true);
            tv.setOnClickListener(v -> {
                Ui.haptic(v, t);
                show(idx);
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = Ui.dp(c, 4);
            lp.gravity = Gravity.CENTER_VERTICAL;
            tabStrip.addView(tv, lp);
            tabViews[i] = tv;
        }
        styleTabs();
    }

    private void styleTabs() {
        for (int i = 0; i < tabViews.length; i++) {
            boolean sel = state != COLLAPSED && i == current;
            TextView tv = tabViews[i];
            tv.setTextColor(sel ? t.onSecondaryContainer : t.onSurfaceVariant);
            tv.setBackground(Ui.ripple(t, Ui.rounded(sel ? t.secondaryContainer : 0, Ui.dp(c, 20)), Ui.dp(c, 20)));
            tv.setContentDescription(TABS[i] + " tab" + (sel ? ", selected" : ""));
            tv.setSelected(sel);
        }
    }

    private void updateToggle() {
        toggle.setImageDrawable(new EppyIcon(state == EXPANDED ? EppyIcon.CHEVRON_DOWN : EppyIcon.CHEVRON_UP, t.onSurfaceVariant));
        toggle.setContentDescription(state == EXPANDED ? "Collapse sheet" : "Expand sheet");
    }

    private void toggleState() {
        if (state == EXPANDED) collapse();
        else show(current);
    }

    /** Opens the sheet (fully) on a tab. */
    public void show(int index) {
        setContentTab(index);
        snap(EXPANDED, true);
    }

    /** Opens the sheet in a given resting state (used when restoring after rotation). */
    public void restore(int index, int toState) {
        setContentTab(index);
        snap(toState, false);
    }

    private void setContentTab(int index) {
        boolean switching = index != current || content.getChildCount() == 0;
        if (!switching) return;
        saveScroll();
        current = index;
        content.removeAllViews();
        Tab tab = tabs[index];
        if (tab != null) {
            View v = tab.view();
            if (v.getParent() != null) ((ViewGroup) v.getParent()).removeView(v);
            content.addView(v, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            tab.refresh(true);
            restoreScroll(v);
        }
        styleTabs();
        // Keep the selected tab visible in the strip.
        TextView tv = tabViews[index];
        tv.post(() -> {
            if (tabStrip.getParent() instanceof HorizontalScrollView) {
                HorizontalScrollView hs = (HorizontalScrollView) tabStrip.getParent();
                int left = tv.getLeft() - Ui.dp(c, 12), right = tv.getRight() + Ui.dp(c, 12);
                if (left < hs.getScrollX()) hs.smoothScrollTo(left, 0);
                else if (right > hs.getScrollX() + hs.getWidth()) hs.smoothScrollTo(right - hs.getWidth(), 0);
            }
        });
    }

    private void saveScroll() {
        if (content.getChildCount() == 0) return;
        View s = firstScrollable(content.getChildAt(0));
        if (s instanceof AbsListView) {
            AbsListView lv = (AbsListView) s;
            View first = lv.getChildAt(0);
            scrollState.put(current, new int[]{0, lv.getFirstVisiblePosition(), first != null ? first.getTop() : 0});
        } else if (s != null) {
            scrollState.put(current, new int[]{1, s.getScrollY(), 0});
        }
    }

    private void restoreScroll(View v) {
        int[] st = scrollState.get(current);
        if (st == null) return;
        Runnable apply = () -> {
            View s = firstScrollable(v);
            if (s instanceof android.widget.ListView && st[0] == 0) ((android.widget.ListView) s).setSelectionFromTop(st[1], st[2]);
            else if (s != null && st[0] == 1) s.scrollTo(0, st[1]);
        };
        apply.run();
        v.post(apply); // again after layout, in case the content was re-measured
    }

    private static View firstScrollable(View v) {
        if (v instanceof AbsListView || v instanceof android.widget.ScrollView) return v;
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                View r = firstScrollable(g.getChildAt(i));
                if (r != null) return r;
            }
        }
        return null;
    }

    public void collapse() {
        snap(COLLAPSED, true);
    }

    private float offsetFor(int s) {
        switch (s) {
            case EXPANDED:
                return topOffset();
            case HALF:
                return Math.max(topOffset(), root.getHeight() * 0.45f);
            default:
                return collapsedOffset();
        }
    }

    private void snap(int to, boolean animate) {
        boolean changed = to != state;
        state = to;
        float target = offsetFor(to);
        sheet.animate().cancel();
        if (!animate || t.reduceMotion || root.getHeight() == 0) {
            sheet.setTranslationY(target);
        } else {
            sheet.animate().translationY(target).setDuration(260).setInterpolator(new PathInterpolator(0.05f, 0.7f, 0.1f, 1f)).start();
        }
        if (changed) {
            if (to != COLLAPSED && content.getChildCount() == 0) setContentTab(current);
            styleTabs();
            updateToggle();
            sheet.announceForAccessibility(to == COLLAPSED ? "Sheet collapsed" : TABS[current] + (to == HALF ? " half open" : " opened"));
        }
    }

    private float collapsedOffset() {
        return Math.max(0, root.getHeight() - peek);
    }

    private float topOffset() {
        return Ui.dp(c, 56);
    }

    /** Settles after a drag: flings go one state in their direction, otherwise the nearest. */
    private void settle(float vy) {
        float y = sheet.getTranslationY();
        int fling = Ui.dp(c, 500);
        int to;
        if (vy < -fling) to = y > offsetFor(HALF) + touchSlop ? HALF : EXPANDED;
        else if (vy > fling) to = y < offsetFor(HALF) - touchSlop ? HALF : COLLAPSED;
        else {
            to = COLLAPSED;
            float best = Float.MAX_VALUE;
            for (int s = COLLAPSED; s <= EXPANDED; s++) {
                float d = Math.abs(offsetFor(s) - y);
                if (d < best) {
                    best = d;
                    to = s;
                }
            }
        }
        snap(to, true);
    }

    // ---- predictive back (Android 14+) ----------------------------------------------------------

    /** Back gesture in progress: preview the collapse (0..1). */
    public void backProgress(float progress) {
        if (state == COLLAPSED) return;
        sheet.animate().cancel();
        float from = offsetFor(state), to = collapsedOffset();
        sheet.setTranslationY(from + (to - from) * Math.min(1f, progress) * 0.35f);
    }

    public void backCancelled() {
        snap(state, true);
    }

    /** Back press: collapse if open. */
    public boolean onBack() {
        if (state != COLLAPSED) {
            collapse();
            return true;
        }
        return false;
    }

    public void refresh(boolean full) {
        if (state != COLLAPSED && tabs[current] != null) tabs[current].refresh(full);
    }

    public int currentTab() {
        return current;
    }

    /** The open tab, or -1 when collapsed (for saving/restoring state). */
    public int openTab() {
        return state != COLLAPSED ? current : -1;
    }

    // ---- touch handling ------------------------------------------------------------------------

    /** The sheet surface: decides whether a gesture moves the sheet, scrolls the content or changes tab. */
    private final class SheetView extends LinearLayout {
        private float downX, downY, startY;
        private boolean inHeader, scrollableUnder, horizontalUnder;
        private int mode; // 0 undecided, 1 sheet drag, 2 tab swipe, 3 leave to children
        private VelocityTracker vt;

        SheetView(Context c) {
            super(c);
        }

        @Override
        public boolean onInterceptTouchEvent(MotionEvent e) {
            switch (e.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = e.getRawX();
                    downY = e.getRawY();
                    startY = getTranslationY();
                    mode = 0;
                    inHeader = e.getY() < header.getBottom();
                    View target = deepest(this, (int) e.getRawX(), (int) e.getRawY());
                    scrollableUnder = canScrollUp(target) || canScrollDown(target);
                    horizontalUnder = scrollsHorizontally(target);
                    if (vt != null) vt.recycle();
                    vt = VelocityTracker.obtain();
                    vt.addMovement(e);
                    return false;
                case MotionEvent.ACTION_MOVE: {
                    if (vt != null) vt.addMovement(e);
                    if (mode != 0) return mode == 1 || mode == 2;
                    float dx = e.getRawX() - downX, dy = e.getRawY() - downY;
                    if (Math.abs(dy) > touchSlop && Math.abs(dy) > Math.abs(dx)) {
                        View under = deepest(this, (int) downX, (int) downY);
                        boolean moveSheet;
                        if (inHeader) moveSheet = true;
                        else if (dy < 0) moveSheet = state != EXPANDED; // expand before scrolling
                        else moveSheet = !canScrollUp(under);            // list at its top: collapse
                        if (moveSheet) {
                            mode = 1;
                            if (content.getChildCount() == 0) setContentTab(current);
                            animate().cancel();
                            startY = getTranslationY();
                            downY = e.getRawY();
                            getParent().requestDisallowInterceptTouchEvent(true);
                            return true;
                        }
                        mode = 3;
                    } else if (Math.abs(dx) > touchSlop * 2 && Math.abs(dx) > Math.abs(dy) * 2) {
                        boolean nearEdge = downX < edge || downX > getResources().getDisplayMetrics().widthPixels - edge;
                        if (!inHeader && !horizontalUnder && !nearEdge && state != COLLAPSED) {
                            mode = 2;
                            getParent().requestDisallowInterceptTouchEvent(true);
                            return true;
                        }
                        mode = 3;
                    }
                    return false;
                }
                default:
                    return false;
            }
        }

        @Override
        public boolean onTouchEvent(MotionEvent e) {
            if (vt != null && e.getActionMasked() != MotionEvent.ACTION_DOWN) vt.addMovement(e);
            switch (e.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    // Touches on non-interactive parts of the sheet start here.
                    downX = e.getRawX();
                    downY = e.getRawY();
                    startY = getTranslationY();
                    inHeader = e.getY() < header.getBottom();
                    mode = 0;
                    if (vt != null) vt.recycle();
                    vt = VelocityTracker.obtain();
                    vt.addMovement(e);
                    return true;
                case MotionEvent.ACTION_MOVE: {
                    float dx = e.getRawX() - downX, dy = e.getRawY() - downY;
                    if (mode == 0) {
                        if (Math.abs(dy) > touchSlop && Math.abs(dy) >= Math.abs(dx)) {
                            mode = 1;
                            if (content.getChildCount() == 0) setContentTab(current);
                            animate().cancel();
                            startY = getTranslationY();
                            downY = e.getRawY();
                            dy = 0;
                        } else if (Math.abs(dx) > touchSlop * 2 && state != COLLAPSED) {
                            mode = 2;
                        }
                    }
                    if (mode == 1) {
                        float y = Math.max(topOffset(), Math.min(collapsedOffset(), startY + dy));
                        setTranslationY(y);
                    } else if (mode == 2) {
                        content.setTranslationX(dx * 0.4f);
                    }
                    return true;
                }
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL: {
                    float vx = 0, vy = 0;
                    if (vt != null) {
                        vt.computeCurrentVelocity(1000);
                        vx = vt.getXVelocity();
                        vy = vt.getYVelocity();
                        vt.recycle();
                        vt = null;
                    }
                    boolean up = e.getActionMasked() == MotionEvent.ACTION_UP;
                    if (mode == 1) settle(vy);
                    else if (mode == 2) {
                        float dx = e.getRawX() - downX;
                        content.animate().translationX(0).setDuration(150).start();
                        if (up && (Math.abs(dx) > Ui.dp(c, 72) || Math.abs(vx) > Ui.dp(c, 600))) {
                            int next = current + (dx < 0 ? 1 : -1);
                            if (next >= 0 && next < TABS.length) {
                                Ui.haptic(this, t);
                                setContentTab(next);
                            }
                        }
                    } else if (up && inHeader) {
                        toggleState();
                    }
                    mode = 0;
                    return true;
                }
                default:
                    return true;
            }
        }
    }

    private static boolean canScrollUp(View v) {
        for (View x = v; x != null; x = x.getParent() instanceof View ? (View) x.getParent() : null) {
            if (x.canScrollVertically(-1)) return true;
            if (x instanceof SheetView) break;
        }
        return false;
    }

    private static boolean canScrollDown(View v) {
        for (View x = v; x != null; x = x.getParent() instanceof View ? (View) x.getParent() : null) {
            if (x.canScrollVertically(1)) return true;
            if (x instanceof SheetView) break;
        }
        return false;
    }

    private static boolean scrollsHorizontally(View v) {
        for (View x = v; x != null; x = x.getParent() instanceof View ? (View) x.getParent() : null) {
            if (x instanceof HorizontalScrollView || x instanceof EppySlider || x.canScrollHorizontally(1) || x.canScrollHorizontally(-1)) return true;
            if (x instanceof SheetView) break;
        }
        return false;
    }

    /** Deepest visible view under a screen point. */
    private static View deepest(View v, int rawX, int rawY) {
        if (v.getVisibility() != View.VISIBLE) return null;
        int[] loc = new int[2];
        v.getLocationOnScreen(loc);
        if (rawX < loc[0] || rawY < loc[1] || rawX >= loc[0] + v.getWidth() || rawY >= loc[1] + v.getHeight()) return null;
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = g.getChildCount() - 1; i >= 0; i--) {
                View r = deepest(g.getChildAt(i), rawX, rawY);
                if (r != null) return r;
            }
        }
        return v;
    }
}
