/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.LinearLayout;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BooleanSetting;

/**
 * Paints the bottom bar black in dark mode. Pinterest fills it with the same warm gray theme color
 * its menus, popovers and floating buttons use, so the color is changed on the bar's own views
 * rather than in the theme. Only opaque solid colors change: the bar's background, the plain row
 * that holds its tabs, each tab's rounded background where the bar shows its tabs apart, the search
 * pill where a tab is one, and the strip Pinterest draws behind the gesture handle. Where those
 * tabs are frosted glass they have no fill, and the color Pinterest washes the glass with is
 * answered black instead. The search pill is the one see-through fill that changes: on a phone
 * that doesn't blur it carries that wash as its own fill. Gradients stay, so the shadow strip above
 * the bar and the scrim behind a floating bar keep their look, and so do the icons, each tab's
 * outline and the selected-tab marker.
 *
 * <p>The comments sheet and a pin's menu carry the same gray, each behind its own switch. They are
 * painted as Pinterest finishes building them and again after their layout passes, on the views
 * that hold the fill and nothing else, so their text, icons and dividers stay as they are. A pin's
 * menu also shows See more and See less on rounded cards of their own, built before the sheet holds
 * them, so each card is painted as it's built and follows the pin menu's switch. Where Pinterest's
 * theme makes their gray see-through, they still turn black. The
 * strip behind the gesture handle draws over a sheet's last rows, so it is black while a black
 * sheet is open and gets its page's color back when the sheet leaves. The window's own navigation
 * bar band, drawn over the strip, goes with it. Pinterest colors both again whenever it likes, so
 * while something black still wants them, their next frame turns them back. The comments screen
 * fills the window and leaves the band under the status bar to the window's own dark gray, so a
 * black screen also covers that band in black, drawn over the screen itself and gone with it.
 */
public final class AmoledBlack {
    private AmoledBlack() {}

    /** The fill or tint each painted view had before, so off, Pause or light mode gives it back. */
    private static final Map<GradientDrawable, ColorStateList> shapes = new WeakHashMap<>();
    private static final Map<ColorDrawable, Integer> colors = new WeakHashMap<>();
    private static final Map<View, ColorStateList> tints = new WeakHashMap<>();
    /** The bars drawn so far. Each one repaints after its layout passes, and glass under one washes black. */
    private static final Map<View, Boolean> bars = new WeakHashMap<>();
    /** The gesture strip found under each window's root view. */
    private static final Map<View, WeakReference<View>> strips = new WeakHashMap<>();
    /** The strips and window bands painted black at least once, each watched before every frame from then on. */
    private static final Map<View, Boolean> kept = new WeakHashMap<>();
    /** How many bar draws found no strip under each root view so far. */
    private static final Map<View, Integer> misses = new WeakHashMap<>();
    /** Bar draws that look for a strip Pinterest may add after the bar's first draw, before a window counts as having none. */
    private static final int SEARCHES = 8;
    /** The sheets handed over so far. Each one repaints after its layout passes. */
    private static final Map<View, Sheet> sheets = new WeakHashMap<>();

    // Pinterest's ids, read by name the first time: -1 before that, 0 when this build has none.
    static int tabRoot = -1;
    static int searchText = -1;
    static int searchContainer = -1;
    static int gestureStrip = -1;

    /**
     * Pinterest fills the row again, styles its tabs and builds new ones whenever the screen above
     * the bar changes, and each of those asks for a layout. A change inside the bar redraws only
     * the view that changed, so the bar's own draw doesn't run again and a new tab would keep
     * Pinterest's gray. The layout pass comes before that tab's first frame.
     */
    private static final View.OnLayoutChangeListener REPAINT =
            (bar, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
                try {
                    paintBar(bar, wanted(bar), false);
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.AMOLED_BLACK, "bottom bar layout", failure);
                }
            };

    /**
     * Called as the bar starts drawing its children. A ViewGroup with no background of its own skips
     * draw() but never dispatchDraw(). The tab row draws after this, so its fill changes in the same
     * frame. The bar's own background was drawn already, and setColor asks for the next frame.
     */
    public static void bottomBar(View bar) {
        try {
            if (bar == null) return;
            if (bars.put(bar, Boolean.TRUE) == null) bar.addOnLayoutChangeListener(REPAINT);
            paintBar(bar, UiHooks.enabled(FamilyNames.AMOLED_BLACK, Settings.BLACK_BOTTOM_BAR) && night(bar), true);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AMOLED_BLACK, "bottom bar", failure);
        }
    }

    /**
     * Pinterest's frosted-glass view is about to wash its blurred backdrop with a color, the last
     * thing it draws on every frame. Where the bar's tabs and search pill are glass, that wash is
     * their gray. Glass under a bottom bar is washed black in dark mode with the switch on. Any
     * other glass, and the bar's own with the switch off or paused, keeps Pinterest's color.
     */
    public static int blurFill(View glass, int color) {
        try {
            return glass != null && underBar(glass) && wanted(glass) ? Color.BLACK : color;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AMOLED_BLACK, "bottom bar glass", failure);
            return color;
        }
    }

    /**
     * Pinterest can give a sheet another background after it has handed the sheet over, and off or
     * Pause should give the gray back while the sheet is still open. Both come with a layout pass.
     */
    private static final View.OnLayoutChangeListener REPAINT_SHEET =
            (sheet, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
                try {
                    Sheet known = sheets.get(sheet);
                    if (known != null) paintSheet(sheet, known, Utils.settingsReady() && known.setting.get() && night(sheet));
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.AMOLED_BLACK, "sheet layout", failure);
                }
            };

    /**
     * Called with the comments screen as Pinterest finishes building it. The sheet that slides up,
     * the bar that holds the reply box and the comment floating over the list each carry the gray.
     * So do the two reactions headers, the one above the list and the one laid over its top, which
     * Pinterest shows while the comments load and hides once they're in, in a gray of their own
     * (#222226 on a video pin, #12). The quick replies above the reply box (the emoji and "Love it!"
     * buttons) are small buttons in that same gray, a rounded shape under a ripple (14.43.0, #21).
     * Pinterest adds them to their row after the screen is built and swaps them out as it likes,
     * so each one is painted on the screen's layout passes.
     */
    public static void comments(View sheet) {
        built(sheet, Settings.BLACK_COMMENTS, true, "comment_starters", "comments",
                "comments_feed", "comment_bottom_bar", "floating_comment_view", "comment_reaction_header",
                "community_insight_comment_header");
    }

    /**
     * Called with a pin's menu as Pinterest finishes building it, before it is shown. Its rounded
     * header and the scrolling list under it carry the gray.
     */
    public static void pinMenu(View sheet) {
        built(sheet, Settings.BLACK_PIN_MENU, false, null, "pin menu", "modal_header", "modal_container");
    }

    /** Off or Pause gives a card its gray back while the menu is still open, on the card's next layout pass. */
    private static final View.OnLayoutChangeListener REPAINT_CARD =
            (card, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
                try {
                    paintFill(card, Utils.settingsReady() && Settings.BLACK_PIN_MENU.get() && night(card), true);
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.AMOLED_BLACK, "pin menu card layout", failure);
                }
            };

    /**
     * Called with each card a pin's menu shows See more or See less on, as Pinterest builds it. The
     * card is a rounded shape in Pinterest's secondary gray under a ripple. Seen on 14.42.0 (#21),
     * where some of Pinterest's themes make that gray see-through, so the sheet's own color shows
     * through it as a lighter gray. A see-through card turns black too.
     */
    public static void pinMenuCard(View card) {
        try {
            if (card == null) return;
            card.addOnLayoutChangeListener(REPAINT_CARD);
            paintFill(card, UiHooks.enabled(FamilyNames.AMOLED_BLACK, Settings.BLACK_PIN_MENU) && night(card), true);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AMOLED_BLACK, "pin menu card", failure);
        }
    }

    /**
     * Pinterest's ids are read by name each time a sheet is built, which is once per time it opens.
     * [chips] names a row whose every child is painted, see-through grays included, or is null.
     */
    private static void built(View sheet, BooleanSetting setting, boolean topBand, String chips, String what, String... fills) {
        try {
            if (sheet == null) return;
            int[] ids = new int[fills.length];
            for (int index = 0; index < fills.length; index++) ids[index] = id(sheet, fills[index]);
            Sheet known = new Sheet(setting, topBand, ids, chips == null ? 0 : id(sheet, chips));
            Sheet before = sheets.put(sheet, known);
            if (before == null) {
                sheet.addOnLayoutChangeListener(REPAINT_SHEET);
                sheet.addOnAttachStateChangeListener(LEAVING);
            } else {
                known.band = before.band;
            }
            paintSheet(sheet, known, UiHooks.enabled(FamilyNames.AMOLED_BLACK, setting) && night(sheet));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AMOLED_BLACK, what, failure);
        }
    }

    private static void paintSheet(View sheet, Sheet known, boolean black) {
        for (int id : known.fills) {
            View fill = id == 0 ? null : sheet.findViewById(id);
            if (fill != null) paintFill(fill, black, false);
        }
        View row = known.chips == 0 ? null : sheet.findViewById(known.chips);
        if (row instanceof ViewGroup) {
            ViewGroup chips = (ViewGroup) row;
            for (int index = 0; index < chips.getChildCount(); index++) {
                View chip = chips.getChildAt(index);
                if (chip != null) paintFill(chip, black, true);
            }
        }
        if (known.topBand) band(sheet, known, black);
        View root = sheet.getRootView();
        View strip = stripIn(root);
        if (strip == null) return;
        known.strip = new WeakReference<>(strip);
        paintStrip(strip, black || blackElsewhere(root, sheet));
    }

    /**
     * The comments screen keeps the status bar's height as its top padding and draws nothing there,
     * so the window's dark gray shows through above a black list. The band lives in the screen's
     * overlay, sized to that padding on every layout pass, and goes when black isn't wanted or the
     * screen gets a background of its own.
     */
    private static void band(View sheet, Sheet known, boolean black) {
        int top = sheet.getPaddingTop();
        if (!black || top <= 0 || sheet.getBackground() != null) {
            if (known.band != null) sheet.getOverlay().remove(known.band);
            known.band = null;
            return;
        }
        if (known.band == null) {
            known.band = new ColorDrawable(Color.BLACK);
            sheet.getOverlay().add(known.band);
        }
        known.band.setBounds(0, 0, sheet.getWidth(), top);
        known.band.invalidateSelf();
    }

    /**
     * The strip behind the gesture handle draws over the bottom of whatever is open, in the page's
     * gray, so a black sheet ended in a gray band. A black sheet's layout pass paints it, and the
     * sheet leaving the window gives its color back, unless a black bar on show or another black
     * sheet in that window still wants it. A sheet that leaves at the end of an animation has no
     * parent by then, so the strip is the one its last layout pass found.
     */
    private static final View.OnAttachStateChangeListener LEAVING = new View.OnAttachStateChangeListener() {
        @Override public void onViewAttachedToWindow(View sheet) {}

        @Override public void onViewDetachedFromWindow(View sheet) {
            try {
                Sheet known = sheets.get(sheet);
                View strip = known == null || known.strip == null ? null : known.strip.get();
                if (strip != null) paintStrip(strip, blackElsewhere(strip.getRootView(), sheet));
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.AMOLED_BLACK, "sheet leaving", failure);
            }
        }
    };

    /**
     * The strip, black or back to its page's color, and the window's own navigation bar band with
     * it. Seen on a Galaxy S25 with three-button navigation: Pinterest also gives the window's
     * navigation bar its page's gray, and the window draws that band over the strip, so a black
     * strip still ended in a gray band. Pinterest colors both again as pages and sheets change, so
     * each band painted black once is checked before every frame from then on.
     */
    private static void paintStrip(View strip, boolean black) {
        if (strip == null) return;
        paintBand(strip, black, "Gesture strip");
        paintBand(strip.getRootView().findViewById(android.R.id.navigationBarBackground), black, "Window navigation bar");
    }

    private static void paintBand(View band, boolean black, String what) {
        if (band == null) return;
        String was = colorOf(band);
        paint(band, black);
        if (!black || kept.put(band, Boolean.TRUE) != null) return;
        Logger.printDebug(() -> what + " " + was + " painted black");
        band.getViewTreeObserver().addOnPreDrawListener(new Keeper(band, what));
    }

    /** Before each frame: a band Pinterest colored again turns black while a black bar or sheet still wants it. */
    private static final class Keeper implements ViewTreeObserver.OnPreDrawListener {
        private final WeakReference<View> band;
        private final String what;
        private boolean noted;

        Keeper(View band, String what) {
            this.band = new WeakReference<>(band);
            this.what = what;
        }

        @Override public boolean onPreDraw() {
            try {
                View view = band.get();
                if (view == null || showsBlack(view) || !blackElsewhere(view.getRootView(), null)) return true;
                if (!noted) {
                    noted = true;
                    String was = colorOf(view);
                    Logger.printDebug(() -> what + " colored " + was + " again by Pinterest, painted black");
                }
                paint(view, true);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.AMOLED_BLACK, "gesture strip", failure);
            }
            return true;
        }
    }

    /** Whether the strip shows black now, or carries a background this class never paints. */
    private static boolean showsBlack(View strip) {
        ColorStateList tint = strip.getBackgroundTintList();
        if (tint != null) return isBlack(tint);
        Drawable fill = strip.getBackground();
        return !(fill instanceof ColorDrawable) || ((ColorDrawable) fill).getColor() == Color.BLACK;
    }

    private static String colorOf(View strip) {
        Drawable fill = strip.getBackground();
        return fill instanceof ColorDrawable ? "#" + Integer.toHexString(((ColorDrawable) fill).getColor()) : String.valueOf(fill);
    }

    private static View stripIn(View root) {
        if (gestureStrip < 0) gestureStrip = id(root, "navigation_bar_background");
        return gestureStrip == 0 ? null : root.findViewById(gestureStrip);
    }

    /** Whether a black bar on show, or a black sheet other than this one, shares the window. */
    private static boolean blackElsewhere(View root, View except) {
        for (View bar : bars.keySet()) {
            if (bar == null || bar == except || bar.getRootView() != root) continue;
            if (visible(bar) && wanted(bar)) return true;
        }
        for (Map.Entry<View, Sheet> open : sheets.entrySet()) {
            View sheet = open.getKey();
            if (sheet == null || sheet == except || sheet.getRootView() != root || !visible(sheet)) continue;
            if (Utils.settingsReady() && open.getValue().setting.get() && night(sheet)) return true;
        }
        return false;
    }

    /** A pin's page keeps the bar in the window and hides it. */
    private static boolean visible(View view) {
        for (View current = view; current != null;) {
            if (current.getVisibility() != View.VISIBLE) return false;
            current = current.getParent() instanceof View ? (View) current.getParent() : null;
        }
        return true;
    }

    /**
     * A view that holds a sheet's gray, whether as its own fill or as a layer of one. A ripple is a
     * layer list too. [washes] also takes a layer's see-through gray, as [paint] does for a shape.
     * A tint draws over every layer's own color (14.43.0's Gestalt buttons, #21), so it's the tint
     * that changes then.
     */
    private static void paintFill(View fill, boolean black, boolean washes) {
        if (fill.getBackgroundTintList() != null || tints.containsKey(fill)) {
            tint(fill, black, washes);
            return;
        }
        Drawable background = fill.getBackground();
        if (background instanceof LayerDrawable) paint((LayerDrawable) background, black, washes);
        else paint(fill, black);
    }

    /**
     * A sheet's rounded card is a solid shape layered over a clear one. Layers loaded from one
     * resource share their shapes until the whole drawable is mutated, and Pinterest's other
     * sheets load the same one.
     */
    private static void paint(LayerDrawable layers, boolean black, boolean washes) {
        if (black) layers.mutate();
        for (int index = 0; index < layers.getNumberOfLayers(); index++) {
            Drawable layer = layers.getDrawable(index);
            if (layer instanceof GradientDrawable) paint((GradientDrawable) layer, black, washes);
        }
    }

    /** The switch that paints a sheet and the ids of the views that carry its gray, 0 for one this build has none of. */
    private static final class Sheet {
        final BooleanSetting setting;
        /** Whether the band under the status bar turns black with the sheet. */
        final boolean topBand;
        final int[] fills;
        /** The row whose children each carry the gray, 0 for none. */
        final int chips;
        /** The strip behind the gesture handle in the window the sheet was last laid out in. */
        WeakReference<View> strip;
        /** The black band over the sheet's top padding while it's drawn, null otherwise. */
        ColorDrawable band;

        Sheet(BooleanSetting setting, boolean topBand, int[] fills, int chips) {
            this.setting = setting;
            this.topBand = topBand;
            this.fills = fills;
            this.chips = chips;
        }
    }

    private static boolean underBar(View view) {
        if (bars.isEmpty()) return false;
        for (ViewParent parent = view.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (bars.containsKey(parent)) return true;
        }
        return false;
    }

    /**
     * The switch read again for a layout pass or a frame of glass, which come far more often than
     * the bar's own draw, so it isn't counted as another call.
     */
    private static boolean wanted(View view) {
        return Utils.settingsReady() && Settings.BLACK_BOTTOM_BAR.get() && night(view);
    }

    /** Only the bar's own draw, the searching pass, looks for a gesture strip it hasn't found yet. */
    private static void paintBar(View bar, boolean black, boolean searching) {
        paint(bar, black);
        if (!(bar instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) bar;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            // The tab row is a plain LinearLayout. Pinterest's own views beside it keep their colors.
            if (child == null || child.getClass() != LinearLayout.class) continue;
            paint(child, black);
            tabs((ViewGroup) child, black);
        }
        // A black sheet open over a bar that isn't black keeps the strip.
        paintStrip(gestureStrip(bar, searching), black || blackElsewhere(bar.getRootView(), bar));
    }

    /**
     * Where the bar shows its tabs apart, each tab tints its own rounded background gray. A search
     * tab is a plain frame around Pinterest's search pill instead, and the pill carries the gray
     * itself or on the container inside it.
     */
    private static void tabs(ViewGroup row, boolean black) {
        if (tabRoot < 0) tabRoot = id(row, "tab_item_root");
        if (searchText < 0) searchText = id(row, "static_search_text");
        if (searchContainer < 0) searchContainer = id(row, "static_search_bar_container");
        for (int index = 0; index < row.getChildCount(); index++) {
            View tab = row.getChildAt(index);
            if (tab == null) continue;
            View background = tabRoot == 0 ? null : tab.findViewById(tabRoot);
            if (background != null) {
                paint(background, black);
                continue;
            }
            View text = searchText == 0 ? null : tab.findViewById(searchText);
            if (text == null) continue;
            paintPill(childHolding(tab, text), black);
            if (searchContainer != 0) paintPill(tab.findViewById(searchContainer), black);
        }
    }

    /**
     * Where the bar floats over the page and the phone doesn't blur, the pill is a shape filled
     * with Pinterest's half see-through wash, and that wash is its gray. A pill with no fill at
     * all sits over glass and is left alone.
     */
    private static void paintPill(View pill, boolean black) {
        if (pill == null) return;
        Drawable background = pill.getBackground();
        boolean tinted = pill.getBackgroundTintList() != null || tints.containsKey(pill);
        if (!tinted && background instanceof GradientDrawable) paint((GradientDrawable) background, black, true);
        else paint(pill, black);
    }

    /** The direct child of the tab that the inner view sits in, or null when that view isn't under the tab. */
    private static View childHolding(View tab, View inner) {
        View child = inner;
        while (child != null && child.getParent() != tab) {
            child = child.getParent() instanceof View ? (View) child.getParent() : null;
        }
        return child;
    }

    /**
     * The strip Pinterest draws behind the gesture handle, kept once found. A window that shows none
     * on the bar's first draws is searched again on its next few, then counts as having none.
     */
    private static View gestureStrip(View bar, boolean searching) {
        View root = bar.getRootView();
        WeakReference<View> found = strips.get(root);
        View known = found == null ? null : found.get();
        if (known != null || !searching) return known;
        Integer missed = misses.get(root);
        if (missed != null && missed >= SEARCHES) return null;
        if (gestureStrip < 0) gestureStrip = id(bar, "navigation_bar_background");
        View strip = gestureStrip == 0 ? null : root.findViewById(gestureStrip);
        if (strip != null) {
            strips.put(root, new WeakReference<>(strip));
            misses.remove(root);
        } else {
            misses.put(root, missed == null ? 1 : missed + 1);
        }
        return strip;
    }

    private static int id(View view, String name) {
        return view.getResources().getIdentifier(name, "id", view.getContext().getPackageName());
    }

    static boolean night(View view) {
        return (view.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
    }

    private static void paint(View view, boolean black) {
        if (view == null) return;
        // A tint colors the whole background over its own fill, so the tint is what changes.
        if (view.getBackgroundTintList() != null || tints.containsKey(view)) {
            tint(view, black);
            return;
        }
        Drawable background = view.getBackground();
        if (background instanceof GradientDrawable) paint((GradientDrawable) background, black);
        else if (background instanceof ColorDrawable) paint((ColorDrawable) background, black);
    }

    private static void paint(GradientDrawable shape, boolean black) {
        paint(shape, black, false);
    }

    /** [washes] also takes a fill that is partly see-through, never one that is fully clear. */
    private static void paint(GradientDrawable shape, boolean black, boolean washes) {
        if (!black) {
            ColorStateList original = shapes.remove(shape);
            if (original != null) shape.setColor(original);
            return;
        }
        ColorStateList fill = shape.getColor();
        if (fill == null || shape.getColors() != null || isBlack(fill)) return;
        int alpha = Color.alpha(fill.getDefaultColor());
        if (washes ? alpha == 0 : alpha != 0xFF) return;
        // Drawables loaded from one resource share their state until one is mutated, and the bar's
        // shape comes from a resource other views could load too.
        shape.mutate();
        shapes.put(shape, fill);
        shape.setColor(Color.BLACK);
    }

    private static void tint(View view, boolean black) {
        tint(view, black, false);
    }

    /** [washes] also takes a tint that is partly see-through, never one that is fully clear. */
    private static void tint(View view, boolean black, boolean washes) {
        if (!black) {
            ColorStateList original = tints.remove(view);
            if (original != null) view.setBackgroundTintList(original);
            return;
        }
        ColorStateList tint = view.getBackgroundTintList();
        if (tint == null || isBlack(tint)) return;
        int alpha = Color.alpha(tint.getDefaultColor());
        if (washes ? alpha == 0 : alpha != 0xFF) return;
        tints.put(view, tint);
        view.setBackgroundTintList(ColorStateList.valueOf(Color.BLACK));
    }

    private static void paint(ColorDrawable fill, boolean black) {
        if (!black) {
            Integer original = colors.remove(fill);
            // Pinterest gives the strip each page's own color, and a color it set since isn't ours to undo.
            if (original != null && fill.getColor() == Color.BLACK) fill.setColor(original);
            return;
        }
        int color = fill.getColor();
        if (!opaque(color) || color == Color.BLACK) return;
        fill.mutate();
        colors.put(fill, color);
        fill.setColor(Color.BLACK);
    }

    private static boolean opaque(int color) {
        return Color.alpha(color) == 0xFF;
    }

    private static boolean isBlack(ColorStateList fill) {
        return !fill.isStateful() && fill.getDefaultColor() == Color.BLACK;
    }
}
