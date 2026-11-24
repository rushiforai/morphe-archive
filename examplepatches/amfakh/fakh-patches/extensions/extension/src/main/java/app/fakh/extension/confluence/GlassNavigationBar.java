/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.confluence;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ScrollView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.GlassCapsule;
import app.fakh.extension.shared.TabSlide;

/**
 * The glass navigation bar for Confluence, whose bar is React Native: a row of pressable tabs over a background layer,
 * found by the test id the app gives a tab's content ("tabBarItem-&lt;tab&gt;-focused" or "-unfocused"). React Native
 * gives the other tabs theirs later, so the tabs are the row's pressable children and the focused one is the selected
 * one. The background layer
 * is folded away and the row gets a {@link GlassCapsule}; the app's own pill behind the focused tab gives way to the
 * capsule's sliding one, and the focused icon takes the accent. The Create button that floats above the bar is glass
 * too. The views are looked up when the window lays out, and React Native sets backgrounds again whenever a prop
 * changes, so every frame puts the glass back.
 */
@SuppressWarnings("unused")
public final class GlassNavigationBar {
    private static final String TAB = "tabBarItem-";
    /** The capsule's height, the pill's inset from it and how far the pill reaches past its tab, as on Jira's bar. */
    private static final int CAPSULE_HEIGHT_DP = 56;
    private static final int PILL_INSET_DP = 4;
    private static final int PILL_GROW_DP = 4;
    private static final float FILL_ALPHA = 0.8f;
    /**
     * How far apart the tabs' middles are, in dp: closer than the app spreads them, so the capsule is narrower while
     * the pill keeps the size of a whole tab.
     */
    private static final int TAB_SPACING_DP = 64;
    /** When to look for the lists to stretch again after a tab opens, in ms. */
    private static final int[] LOOK_AGAIN_MS = {100, 300, 600, 1000, 1500};
    /** Test id of the Create button that floats above the bar. */
    private static final String CREATE = "create-action-button";
    /** Test id of the row of buttons that floats at the bottom of a page. */
    private static final String FOOTER = "footerButtonsContainer";
    /** How often the floating pills are looked for as frames draw, in ms: the mini player comes and goes without a layout. */
    private static final long PILL_LOOK_MS = 100;
    /** How long after launch the bar is looked for before every frame, in ms. */
    private static final long LAUNCH_LOOK_MS = 10_000;
    /** Test id of the mini player's content; its parent is the pressable that paints the pill. */
    private static final String PLAYER = "audioMiniPlayer";

    private final Activity activity;
    private final float density;
    private final int testId;
    private final Paint tint = new Paint();
    private WeakReference<ViewGroup> bar = new WeakReference<>(null);
    private GlassCapsule capsule;
    private final List<View> tabs = new ArrayList<>();
    /** The Create button, and the one the glass was put on. */
    private WeakReference<View> create = new WeakReference<>(null);
    private View glassed;
    /** The page's floating button row, and the capsule that is its background. */
    private final java.util.WeakHashMap<View, GlassCapsule> pills = new java.util.WeakHashMap<>();
    private long pillsLookedAt;
    private final long startedAt = SystemClock.uptimeMillis();
    /**
     * The views stretched down behind the bar, with the bottom React Native gave them, the stretched one, and for a
     * list the height of its content when it was last nudged.
     */
    private final java.util.WeakHashMap<View, int[]> stretched = new java.util.WeakHashMap<>();
    /** The focused tab, whose layer tints its icon. */
    private WeakReference<View> tinted = new WeakReference<>(null);
    private boolean night;
    private int fill;
    private int accent;
    /** The tab that was focused last frame. */
    private int lastSelected = -1;

    private GlassNavigationBar(Activity activity) {
        this.activity = activity;
        density = activity.getResources().getDisplayMetrics().density;
        testId = activity.getResources().getIdentifier("react_test_id", "id", activity.getPackageName());
    }

    /** Whether the bar is glass: its patch is in and its switch is on. */
    static boolean enabled(Context context) {
        return Features.on(MaterialYou.GLASS);
    }

    /**
     * Injected at the end of MainActivity.onMAMCreate: watches the window for the bar, which React Native mounts
     * later and again after a sign-in or a site switch.
     *
     * @param activity the main activity
     */
    public static void install(Activity activity) {
        if (!enabled(activity)) return;
        GlassNavigationBar glass = new GlassNavigationBar(activity);
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
        ViewTreeObserver observer = decor.getViewTreeObserver();
        observer.addOnGlobalLayoutListener(() -> {
            try {
                glass.lookUp(decor);
            } catch (RuntimeException error) {
                android.util.Log.w("FakhPatches", "Glass bar", error);
            }
        });
        observer.addOnPreDrawListener(() -> {
            try {
                glass.frame();
            } catch (RuntimeException error) {
                android.util.Log.w("FakhPatches", "Glass bar", error);
            }
            return true;
        });
    }

    /** Finds the bar when it is new, and the Create button, after the window laid out. */
    private void lookUp(ViewGroup decor) {
        ViewGroup row = bar.get();
        if (row == null || !row.isAttachedToWindow()) {
            row = find(decor);
            if (row != null) setUp(row);
        }
        View button = create.get();
        if (button == null || !button.isAttachedToWindow()) create = new WeakReference<>(findTag(decor, CREATE));
        collectPills(decor);
        if (row != null && row.getHeight() > 0 && !onChat()) findScrolls(decor, row);
    }

    /**
     * The pages and lists that end where the bar begins: the page stops at the top of the bar, so every view taller
     * than half the screen that ends there is stretched down behind it, with the views around it up to the screen.
     * Scrolling lists keep a bottom padding of the bar's height, so their last item still scrolls clear of the bar.
     * Shorter views pinned to the bottom, such as Rovo's chat box, stay where they are.
     */
    private void findScrolls(ViewGroup group, ViewGroup row) {
        int top = topInWindow(row);
        int tall = ((View) row.getParent()).getHeight() / 2;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child == row || child.getVisibility() != View.VISIBLE) continue;
            if (!stretched.containsKey(child) && child.getHeight() > tall && near(bottomInWindow(child), top)) {
                for (View v = child; v != null && v.getParent() instanceof View; v = (View) v.getParent()) {
                    // Never a view that holds the bar: laying it out again would move the bar.
                    if (holds(v, row)) break;
                    if (near(bottomInWindow(v), top) && !stretched.containsKey(v)) {
                        stretched.put(v, new int[] {v.getBottom(), v.getBottom() + row.getHeight(), 0});
                    }
                    if (v.getParent() == row.getParent()) break;
                }
            }
            if (child instanceof ViewGroup) findScrolls((ViewGroup) child, row);
        }
    }

    /** Whether {@code view} is {@code row} or one of its ancestors. */
    private static boolean holds(View view, View row) {
        for (View v = row; v != null; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
            if (v == view) return true;
        }
        return false;
    }

    /** Whether two window positions are the same but for rounding. */
    private static boolean near(int a, int b) {
        return Math.abs(a - b) <= 2;
    }

    /** Whether Rovo's chat is the open tab: its page lays out its own chat box at its bottom, so it is never stretched. */
    private boolean onChat() {
        for (View tab : tabs) {
            if (tab.isSelected() && tab instanceof ViewGroup && ((ViewGroup) tab).getChildCount() > 0
                    && tag(((ViewGroup) tab).getChildAt(0)).startsWith(TAB + "ConversationTab")) return true;
        }
        return false;
    }

    /** Puts a stretched view back to the size React Native gave it. */
    private static void unstretch(View view, int bottom) {
        if (view instanceof ScrollView) view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), 0);
        view.measure(View.MeasureSpec.makeMeasureSpec(view.getWidth(), View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(bottom - view.getTop(), View.MeasureSpec.EXACTLY));
        view.layout(view.getLeft(), view.getTop(), view.getRight(), bottom);
    }

    /** Keeps the stretched views stretched after React Native lays them out again. */
    private void stretch(ViewGroup row) {
        if (onChat()) {
            for (java.util.Map.Entry<View, int[]> entry : stretched.entrySet()) {
                if (entry.getKey().getBottom() == entry.getValue()[1]) unstretch(entry.getKey(), entry.getValue()[0]);
            }
            stretched.clear();
            return;
        }
        java.util.Iterator<java.util.Map.Entry<View, int[]>> entries = stretched.entrySet().iterator();
        while (entries.hasNext()) {
            java.util.Map.Entry<View, int[]> entry = entries.next();
            View view = entry.getKey();
            int[] bottoms = entry.getValue();
            if (holds(view, row)) {
                entries.remove();
                continue;
            }
            if (view.getBottom() == bottoms[1]) {
                // New rows came in: React Native adds the rows below the old bottom only on a scroll.
                if (view instanceof ScrollView && ((ScrollView) view).getChildCount() > 0) {
                    int content = ((ScrollView) view).getChildAt(0).getHeight();
                    if (content != bottoms[2]) {
                        bottoms[2] = content;
                        view.scrollBy(0, 1);
                        view.scrollBy(0, -1);
                    }
                }
                continue;
            }
            if (view.getBottom() != bottoms[0]) {
                // Laid out again: still against the bar, or somewhere else now (a keyboard, another screen).
                if (!near(bottomInWindow(view), topInWindow(row))) {
                    if (view instanceof ScrollView) view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), 0);
                    entries.remove();
                    continue;
                }
                bottoms[0] = view.getBottom();
                bottoms[1] = bottoms[0] + row.getHeight();
            }
            // Measured and laid out at the new height, so a view that lays out its own children (a Compose list) fills it.
            view.measure(View.MeasureSpec.makeMeasureSpec(view.getWidth(), View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(bottoms[1] - view.getTop(), View.MeasureSpec.EXACTLY));
            view.layout(view.getLeft(), view.getTop(), view.getRight(), bottoms[1]);
            if (view instanceof ScrollView) {
                if (view.getPaddingBottom() != row.getHeight()) {
                    ((ScrollView) view).setClipToPadding(false);
                    view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), row.getHeight());
                }
                // React Native draws only the rows inside the area it last saw, until the list scrolls.
                view.scrollBy(0, 1);
                view.scrollBy(0, -1);
            }
        }
    }

    private static int topInWindow(View view) {
        int[] at = new int[2];
        view.getLocationInWindow(at);
        return at[1];
    }

    private static int bottomInWindow(View view) {
        return topInWindow(view) + view.getHeight();
    }

    /** Puts the glass back on the bar and the Create button, and moves the pill to the focused tab. */
    private void frame() {
        long now = SystemClock.uptimeMillis();
        // React Native places its views without a layout pass of the window, so right after launch the bar is looked
        // for before every draw: one frame of the app's own bar would show otherwise.
        ViewGroup mounted = bar.get();
        if ((mounted == null || !mounted.isAttachedToWindow()) && now - startedAt < LAUNCH_LOOK_MS) {
            lookUp((ViewGroup) activity.getWindow().getDecorView());
        }
        if (now - pillsLookedAt > PILL_LOOK_MS) {
            pillsLookedAt = now;
            collectPills((ViewGroup) activity.getWindow().getDecorView());
        }
        // Every one, shown or not: a page keeps the one below it mounted, and a new one shows before it is looked for.
        for (java.util.Map.Entry<View, GlassCapsule> pill : new ArrayList<>(pills.entrySet())) {
            if (pill.getKey().isAttachedToWindow()) pill.setValue(glassPill(pill.getKey(), pill.getValue()));
        }
        ViewGroup row = bar.get();
        if (row == null || capsule == null) return;
        boolean nowNight = app.fakh.extension.shared.MaterialYou.night(activity);
        if (nowNight != night) colors(row);
        if (row.getBackground() != capsule) row.setBackground(capsule);
        stretch(row);
        if (row.getChildCount() != tabs.size() + 1) readTabs(row);
        View layer = row.getChildAt(0);
        if (layer != null && !layer.isClickable()) layer.setScaleY(0);
        int selected = -1;
        for (int i = 0; i < tabs.size(); i++) {
            View tab = tabs.get(i);
            View inner = tab instanceof ViewGroup && ((ViewGroup) tab).getChildCount() > 0 ? ((ViewGroup) tab).getChildAt(0) : null;
            if (inner == null) continue;
            // The app's own pill behind the focused tab, and the press ripple, as the capsule's pill shows the tab.
            if (inner.getBackground() != null) inner.setBackground(null);
            if (tab.getBackground() != null) tab.setBackground(null);
            if (tab.isSelected()) selected = i;
        }
        // The focused icon in the accent: a layer on the focused tab whose paint tints what the tab draws, its icon
        // only, as the tab and the app's pill behind it are see-through. Set once per focus change, since setting a
        // layer paint redraws the view.
        View focusedIcon = selected < 0 ? null : tabs.get(selected);
        View old = tinted.get();
        if (focusedIcon != old) {
            if (old != null) old.setLayerType(View.LAYER_TYPE_NONE, null);
            if (focusedIcon != null) focusedIcon.setLayerType(View.LAYER_TYPE_HARDWARE, tint);
            tinted = new WeakReference<>(focusedIcon);
        }
        // The tabs drawn closer together around the bar's middle; React Native's touch handling follows the shift.
        for (int i = 0; i < tabs.size(); i++) {
            View tab = tabs.get(i);
            float shift = start(i) - tab.getLeft();
            if (tab.getTranslationX() != shift) tab.setTranslationX(shift);
        }
        if (selected >= 0) capsule.slider().select(start(selected), end(selected));
        if (selected != lastSelected) {
            lastSelected = selected;
            // A tab opened for the first time lays its list out over the next frames, after the window's layout pass.
            ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
            for (int delay : LOOK_AGAIN_MS) row.postDelayed(() -> lookUp(decor), delay);
        }
        View button = create.get();
        if (button != null) glassFloating(button);
    }

    /** Takes the bar's colors and gives the capsule, the pill and the focused icon theirs. */
    private void colors(ViewGroup row) {
        night = app.fakh.extension.shared.MaterialYou.night(activity);
        View layer = row.getChildAt(0);
        fill = layer != null && !layer.isClickable() ? sample(layer) : 0;
        if (fill == 0) fill = MaterialYou.prop(night ? 0xFF2B2C2F : 0xFFFFFFFF);
        accent = app.fakh.extension.shared.MaterialYou.accent(activity, MaterialYou.materialYou(), 0xFF1868DB, 0xFF669DF1);
        capsule.setColor(fill);
        // The pill takes the wallpaper's accent with Material You and stays neutral without it.
        if (app.fakh.extension.shared.MaterialYou.wallpaper(MaterialYou.materialYou())) capsule.setAccent(accent);
        tint.setColorFilter(new PorterDuffColorFilter(accent, PorterDuff.Mode.SRC_IN));
        View icon = tinted.get();
        if (icon != null) icon.setLayerType(View.LAYER_TYPE_HARDWARE, tint);
    }

    /** A new bar: its tabs, the capsule as its background, and the slide across its tabs. */
    private void setUp(ViewGroup row) {
        bar = new WeakReference<>(row);
        readTabs(row);
        RectF bounds = new RectF();
        capsule = new GlassCapsule(0xFF000000, density, new GlassCapsule.Layout() {
            @Override
            public boolean capsule(RectF out) {
                if (tabs.isEmpty()) return false;
                // Past the outer tabs by the pill's reach and inset, so their pills sit centered on them too.
                float top = (row.getHeight() - CAPSULE_HEIGHT_DP * density) / 2;
                float side = (PILL_GROW_DP + PILL_INSET_DP) * density;
                out.set(start(0) - side, top, end(tabs.size() - 1) + side, top + CAPSULE_HEIGHT_DP * density);
                return out.width() > 0;
            }

            @Override
            public boolean pill(RectF out) {
                // The whole tab, a little wider than the tab, with a thin rim of the capsule all around.
                if (!capsule.slider().has() || !capsule(bounds)) return false;
                float inset = PILL_INSET_DP * density;
                float grow = PILL_GROW_DP * density;
                out.set(Math.max(bounds.left + inset, capsule.slider().start() - grow), bounds.top + inset,
                        Math.min(bounds.right - inset, capsule.slider().end() + grow), bounds.bottom - inset);
                return true;
            }
        }, FILL_ALPHA);
        capsule.setBevel(true);
        capsule.setLiquid(Features.on(MaterialYou.LIQUID_GLASS));
        GlassCapsule.clearSystemBar(activity);
        // The capsule's shadow reaches past the bar, so the screen must not clip it to the bar's bounds.
        for (View v = row; v.getParent() instanceof ViewGroup && v != row.getRootView(); v = (View) v.getParent()) {
            ((ViewGroup) v.getParent()).setClipChildren(false);
        }
        colors(row);
        row.setBackground(capsule);
        row.setElevation(0);
        TabSlide.install(row, capsule, false, new TabSlide.Tabs() {
            @Override
            public int count() {
                return tabs.size();
            }

            @Override
            public float start(int index) {
                return GlassNavigationBar.this.start(index);
            }

            @Override
            public float end(int index) {
                return GlassNavigationBar.this.end(index);
            }

            @Override
            public int selected() {
                for (int i = 0; i < tabs.size(); i++) {
                    if (tabs.get(i).isSelected()) return i;
                }
                return -1;
            }

            @Override
            public void open(int index) {
                tap(tabs.get(index));
            }
        });
    }

    /** The left edge of tab {@code index} once the tabs are drawn closer together, in the row's coordinates. */
    private float start(int index) {
        ViewGroup row = bar.get();
        View tab = tabs.get(index);
        float middle = (row == null ? 0 : row.getWidth()) / 2f + (index - (tabs.size() - 1) / 2f) * TAB_SPACING_DP * density;
        return middle - tab.getWidth() / 2f;
    }

    /** The right edge of tab {@code index} once the tabs are drawn closer together. */
    private float end(int index) {
        return start(index) + tabs.get(index).getWidth();
    }

    /** The tabs: the pressable children of the row, after the background layer. */
    private void readTabs(ViewGroup row) {
        tabs.clear();
        for (int i = 0; i < row.getChildCount(); i++) {
            if (row.getChildAt(i).isClickable()) tabs.add(row.getChildAt(i));
        }
    }

    /**
     * Glass for the button that floats above the bar: a round capsule in the bar's fill under it, its own background
     * and shadow gone, and its icon in the accent.
     */
    private void glassFloating(View button) {
        if (button == glassed) {
            reassert(button);
            return;
        }
        glassed = button;
        GlassCapsule glass = new GlassCapsule(fill, density, new GlassCapsule.Layout() {
            @Override
            public boolean capsule(RectF out) {
                out.set(0, 0, button.getWidth(), button.getHeight());
                return out.width() > 0;
            }

            @Override
            public boolean pill(RectF out) {
                return false;
            }
        });
        glass.setBevel(true);
        glass.setLiquid(Features.on(MaterialYou.LIQUID_GLASS));
        button.setOutlineProvider(null);
        button.setElevation(0);
        button.setBackground(glass);
        reassert(button);
    }

    /**
     * Glass for a pill that floats over a page: a capsule over its own background, in the color that background had,
     * put back whenever React Native sets the background again.
     *
     * @return the capsule that is the pill's background
     */
    private GlassCapsule glassPill(View view, GlassCapsule current) {
        GlassCapsule glass = current;
        if (glass == null || glass.getCallback() != view) {
            int old = sample(view);
            boolean night = app.fakh.extension.shared.MaterialYou.night(activity);
            glass = new GlassCapsule(old != 0 ? old : MaterialYou.prop(night ? 0xFF2B2C2F : 0xFFFFFFFF),
                    density, new GlassCapsule.Layout() {
                @Override
                public boolean capsule(RectF out) {
                    out.set(0, 0, view.getWidth(), view.getHeight());
                    return out.width() > 0;
                }

                @Override
                public boolean pill(RectF out) {
                    return false;
                }
            }, FILL_ALPHA);
            glass.setBevel(true);
            glass.setLiquid(Features.on(MaterialYou.LIQUID_GLASS));
            view.setOutlineProvider(null);
            for (View v = view; v.getParent() instanceof ViewGroup && v != view.getRootView(); v = (View) v.getParent()) {
                ((ViewGroup) v.getParent()).setClipChildren(false);
            }
        }
        if (view.getBackground() != glass) { view.setBackground(glass); }
        if (view.getElevation() != 0) view.setElevation(0);
        return glass;
    }

    /** Puts the glass back after React Native set the button's own background or the pressed shade again. */
    private void reassert(View button) {
        if (button instanceof ViewGroup && ((ViewGroup) button).getChildCount() > 0) {
            View content = ((ViewGroup) button).getChildAt(0);
            if (content.getBackground() != null) content.setBackground(null);
            content.setElevation(0);
            content.setOutlineProvider(null);
            if (content.getLayerType() != View.LAYER_TYPE_HARDWARE) {
                content.setLayerType(View.LAYER_TYPE_HARDWARE, tint);
            }
        }
        if (button.getElevation() != 0) button.setElevation(0);
    }

    /** Opens a tab the way a finger does: React Native's tabs answer touches sent to its root, not clicks. */
    private void tap(View tab) {
        int[] at = new int[2];
        tab.getLocationInWindow(at);
        View root = activity.getWindow().getDecorView();
        float x = at[0] + tab.getWidth() / 2f;
        float y = at[1] + tab.getHeight() / 2f;
        long now = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, x, y, 0);
        MotionEvent up = MotionEvent.obtain(now, now + 10, MotionEvent.ACTION_UP, x, y, 0);
        root.dispatchTouchEvent(down);
        root.dispatchTouchEvent(up);
        down.recycle();
        up.recycle();
    }

    /** The color a background paints in its middle, or 0 when it has none. */
    private static int sample(View view) {
        Drawable background = view.getBackground();
        if (background == null || view.getWidth() == 0 || view.getHeight() == 0) return 0;
        Bitmap pixel = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(pixel);
        canvas.translate(-view.getWidth() / 2f, -view.getHeight() / 2f);
        background.draw(canvas);
        int color = pixel.getPixel(0, 0);
        pixel.recycle();
        return (color >>> 24) == 0 ? 0 : color | 0xFF000000;
    }

    /** The row of the bar: the parent of the tabs, found by the test id of a tab's content. */
    private ViewGroup find(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (isTab(child)) return group;
            if (child instanceof ViewGroup) {
                ViewGroup found = find((ViewGroup) child);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** Finds the floating pills under {@code group}: the page's button row and the pressable of the mini player. */
    private void collectPills(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            String id = tag(child);
            if (FOOTER.equals(id)) pills.putIfAbsent(child, null);
            else if (PLAYER.equals(id) && child.getParent() instanceof View) pills.putIfAbsent((View) child.getParent(), null);
            if (child instanceof ViewGroup) collectPills((ViewGroup) child);
        }
    }

    /** The first view with this test id under {@code group} that is on screen: a page keeps the ones below it mounted. */
    private View findTag(ViewGroup group, String id) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (id.equals(tag(child)) && child.isShown()) return child;
            if (child instanceof ViewGroup) {
                View found = findTag((ViewGroup) child, id);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** Whether a view is a tab: a pressable whose content carries a tab's test id. */
    private boolean isTab(View view) {
        return view instanceof ViewGroup && ((ViewGroup) view).getChildCount() > 0
                && tag(((ViewGroup) view).getChildAt(0)).startsWith(TAB);
    }

    private String tag(View view) {
        Object tag = testId == 0 ? null : view.getTag(testId);
        return tag instanceof String ? (String) tag : "";
    }
}
