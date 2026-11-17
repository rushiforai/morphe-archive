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
import java.util.ArrayList;
import java.util.List;
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
 * <p>The comments sheet, a pin's menu and the Save to sheet carry the same gray, each behind its own switch. They are
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
 *
 * <p>The other sheets and menus that slide up carry the gray too, behind a switch of their own
 * (14.44.0, #39): Pinterest's Gestalt sheets (Create, a board's Board view and sort sheets, Add
 * collaborators) as each is set up, and its older lego menus (a board's Options, a profile's sort
 * menu) as each is built. A sheet with a switch of its own keeps it, so the Save to sheet, also a
 * Gestalt sheet, follows Black Save to sheet. Their buttons and Create's tiles keep their gray. A
 * last switch takes the gray bar that floats over a board, the filter buttons on a profile and the
 * empty header card on Edit board. The bar is a card whose tint changes. The filter buttons are
 * drawn by Compose with no fill on a view, so they're drawn through a layer that maps Pinterest's
 * dark grays to black and keeps white white.
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
    /** The board and profile pieces handed over so far, each repainted after its layout passes. */
    private static final Map<View, Piece> pieces = new WeakHashMap<>();
    /** The tint each board tool bar had before it turned black, null when it had none. */
    private static final Map<View, ColorStateList> cards = new WeakHashMap<>();
    /** The background each board header image had before it turned black. */
    private static final Map<View, Drawable> headerFills = new WeakHashMap<>();
    /**
     * The lightest gray the profile's filter buttons turn black from. Their gray is #222226 at night
     * (14.44.0); each channel is stretched so this level lands on black and white stays white.
     */
    static final int DARKEST_KEPT = 64;

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
                    if (known != null) paintSheet(sheet, known, Utils.settingsReady() && switchOf(sheet, known).get() && night(sheet));
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
        built(sheet, Settings.BLACK_COMMENTS, false, false, true, "comment_starters", null, "comments",
                "comments_feed", "comment_bottom_bar", "floating_comment_view", "comment_reaction_header",
                "community_insight_comment_header");
    }

    /**
     * Called with a pin's menu as Pinterest finishes building it, before it is shown. Its rounded
     * header and the scrolling list under it carry the gray.
     */
    public static void pinMenu(View sheet) {
        built(sheet, Settings.BLACK_PIN_MENU, false, false, false, null, null, "pin menu", "modal_header", "modal_container");
    }

    /**
     * Called with the Save to sheet as its fragment starts laying it out, before the sheet has its
     * background. The sheet that slides up carries the gray as a two-layer drawable, a rounded card
     * while it's part way up and a square one all the way up (14.44.0), and its header can take a
     * gray of its own. Both arrive after this call, so they turn black on the sheet's layout passes.
     * The footer row holding the red Create new board button has a gray of its own (#222226 on a
     * Galaxy S25, 14.44.0), set as a plain color when the footer is built.
     */
    public static void saveSheet(View sheet) {
        built(sheet, Settings.BLACK_SAVE_SHEET, false, false, false, null, null, "Save to sheet", "draggable_sheet",
                "gestalt_sheet_header", "gestalt_sheet_container", "sheet_overlay_container", "sheet_scroll_view",
                "sheet_scroll_inner_layout", "footer_container");
    }

    /**
     * Called with each of Pinterest's Gestalt sheets as it's set up, the whole sheet already built:
     * Create, a board's Board view and sort sheets, Add collaborators and the others that slide up
     * (14.44.0, #39). The sheet is a rounded card in the gray, and the footer holding its buttons
     * carries it too (#222226 on a Galaxy S22). Add collaborators shows the board as a card in the
     * see-through secondary gray, which reads as the sheet's gray over the sheet and as #222226 over
     * black (Galaxy S25), so it turns black with the sheet. The buttons and Create's tiles keep their
     * own gray. The Save to sheet and the comments sheet hand themselves over first, and a sheet
     * handed over by its own switch, or one inside or around it, keeps that switch.
     */
    public static void gestaltSheet(View sheet) {
        built(sheet, Settings.BLACK_SHEETS, true, false, false, null, "collab_board_rep", "sheet", "draggable_sheet", "gestalt_sheet_header",
                "gestalt_sheet_container", "sheet_overlay_container", "sheet_scroll_view", "sheet_scroll_inner_layout",
                "gestalt_sheet_footer", "footer_container");
    }

    /**
     * Called with each of Pinterest's lego menus right after it becomes a menu: a board's Options,
     * the sort menus on a profile and the others built the older way (14.44.0, #39). The menu is
     * itself a rounded card in the gray, around a scrolling list and the row that holds Close. Its
     * own fills arrive later in the build, so they turn black on its layout passes. The Close button
     * keeps its gray.
     */
    public static void legoModal(View menu) {
        built(menu, Settings.BLACK_SHEETS, true, true, false, null, null, "menu", "modal_header", "modal_container",
                "lego_modal_scroll_view", "lego_modal_container", "lego_modal_content_container", "lego_close_container",
                "lego_close_container_sticky");
    }

    /** The views' fills and tints, which off, Pause or light mode give back, follow on their layout passes. */
    private static final View.OnLayoutChangeListener REPAINT_PIECE =
            (view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
                try {
                    Piece piece = pieces.get(view);
                    if (piece != null) paintPiece(view, piece, Utils.settingsReady() && Settings.BLACK_BOARDS.get() && night(view));
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.AMOLED_BLACK, "board and profile buttons layout", failure);
                }
            };

    /**
     * Called with the bar that floats over a board (Organize, Add and the others) right after it
     * becomes a card (14.44.0, #39). A card's rounded fill takes the color of a tint over it, so the
     * tint is what changes, and off, Pause or light mode give back the tint it had, none included.
     */
    public static void boardToolBar(View bar) {
        handedOver(bar, Piece.TOOL_BAR, "board tool bar");
    }

    /**
     * Called with each of the filter buttons on a profile (the sort button, Group, Private and the
     * rest) right after it becomes a Compose view (14.44.0, #39). Compose puts Pinterest's button
     * toggles in later, each a rounded fill under a tint, so each button's tint is what changes:
     * Pinterest's dark grays go black and a picked button's white stays white. A row on show
     * checks its buttons before each frame, since Pinterest tints a button again when it's picked.
     * Their labels and icons keep their look.
     */
    public static void profileFilters(View row) {
        handedOver(row, Piece.FILTERS, "profile filters");
    }

    /**
     * Called with a board's header image right after it becomes a layout, before its views are in.
     * With no image picked, Edit board shows the header as an empty card in Pinterest's secondary
     * gray (#333339 over the page at night, 14.44.0, #39), the color behind the image and behind its blurred
     * copy. Both turn black on the header's layout passes. A picked image draws over that color, and
     * the wash Pinterest lays over a picked image stays.
     */
    public static void boardHeader(View header) {
        handedOver(header, Piece.HEADER, "board header");
    }

    /** What a board or profile piece is, which says how it's painted. */
    private enum Piece { TOOL_BAR, FILTERS, HEADER }

    private static void handedOver(View view, Piece piece, String what) {
        try {
            if (view == null) return;
            if (pieces.put(view, piece) == null) {
                view.addOnLayoutChangeListener(REPAINT_PIECE);
                if (piece == Piece.FILTERS) FilterKeeper.watch(view);
            }
            paintPiece(view, piece, UiHooks.enabled(FamilyNames.AMOLED_BLACK, Settings.BLACK_BOARDS) && night(view));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AMOLED_BLACK, what, failure);
        }
    }

    private static void paintPiece(View view, Piece piece, boolean black) {
        switch (piece) {
            case TOOL_BAR:
                paintCard(view, black);
                break;
            case FILTERS:
                tintButtons(view, black);
                break;
            default:
                if (headerImage < 0) headerImage = id(view, "board_header_image");
                if (headerBlur < 0) headerBlur = id(view, "board_header_image_blur");
                if (headerImage != 0) paintHeaderFill(view.findViewById(headerImage), black);
                if (headerBlur != 0) paintHeaderFill(view.findViewById(headerBlur), black);
        }
    }

    /**
     * The header's gray is sema_color_background_secondary, at night a light gray at 30% (#4D72727E
     * in 14.44.0) that reads #333339 over the page. Pinterest's image view hands its background to
     * the rounded image inside it, which turns any fill into a small bitmap with no color to change
     * (seen on a Galaxy S25, #39), so the whole background is swapped for black and given back.
     */
    private static void paintHeaderFill(View view, boolean black) {
        if (view == null) return;
        if (!black) {
            Drawable original = headerFills.remove(view);
            if (original != null) view.setBackground(original);
            return;
        }
        Drawable background = view.getBackground();
        if (background == null || headerFills.containsKey(view)) return;
        headerFills.put(view, background);
        view.setBackground(new ColorDrawable(Color.BLACK));
    }

    /** board_header_image's and board_header_image_blur's ids, read once, 0 for a build without one. */
    static int headerImage = -1, headerBlur = -1;

    /** A tint Pinterest set since the bar turned black is the one off gives back. */
    private static void paintCard(View card, boolean black) {
        if (!black) {
            if (cards.containsKey(card)) card.setBackgroundTintList(cards.remove(card));
            return;
        }
        ColorStateList tint = card.getBackgroundTintList();
        if (card.getBackground() == null || tint != null && isBlack(tint)) return;
        cards.put(card, tint);
        card.setBackgroundTintList(ColorStateList.valueOf(Color.BLACK));
    }

    /**
     * Every button in the row that has a fill under a tint takes Pinterest's tint through the
     * levels curve, or gets Pinterest's own tint back. The row's labels and icons stay as they are.
     */
    private static void tintButtons(View view, boolean black) {
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) tintButtons(group.getChildAt(index), black);
        }
        ColorStateList tint = view.getBackgroundTintList();
        if (tint == null || view.getBackground() == null) return;
        if (!black) {
            if (tint instanceof LeveledTint) view.setBackgroundTintList(((LeveledTint) tint).original);
            return;
        }
        if (tint instanceof LeveledTint) return;
        view.setBackgroundTintList(new LeveledTint(tint));
        Logger.printDebug(() -> "Profile filter " + view.getClass().getSimpleName() + " tinted black");
    }

    /**
     * [color] as it shows over black, each channel stretched so DARKEST_KEPT and below land on
     * black and white stays white, drawn solid. Pinterest's button gray at night is a light gray at
     * 30% (#4D72727E in 14.44.0), which the curve alone would only lighten. No color stays none.
     */
    static int leveled(int color) {
        int alpha = Color.alpha(color);
        if (alpha == 0) return color;
        return Color.rgb(level(Color.red(color), alpha), level(Color.green(color), alpha), level(Color.blue(color), alpha));
    }

    private static int level(int channel, int alpha) {
        float overBlack = channel * alpha / 255f;
        return Math.max(0, Math.min(255, Math.round((overBlack - DARKEST_KEPT) * 255f / (255 - DARKEST_KEPT))));
    }

    /**
     * Pinterest's tint with each color through the levels curve, state by state: its dark grays
     * black, a picked button's white still white. Off, Pause or light mode give back [original].
     */
    static final class LeveledTint extends ColorStateList {
        final ColorStateList original;

        LeveledTint(ColorStateList original) {
            super(new int[][] {new int[0]}, new int[] {leveled(original.getDefaultColor())});
            this.original = original;
        }

        @Override public int getColorForState(int[] stateSet, int defaultColor) {
            return leveled(original.getColorForState(stateSet, defaultColor));
        }

        @Override public int getDefaultColor() {
            return leveled(original.getDefaultColor());
        }

        @Override public boolean isStateful() {
            return original.isStateful();
        }

        @Override public boolean isOpaque() {
            return original.isOpaque();
        }

        @Override public int getChangingConfigurations() {
            return original.getChangingConfigurations();
        }

        @Override public ColorStateList withAlpha(int alpha) {
            return new LeveledTint(original.withAlpha(alpha));
        }
    }

    /**
     * Before each frame while a profile filter row is on show, its buttons take the tint the switch
     * wants. Pinterest tints a button again when it's picked, with no layout pass to catch it.
     */
    private static final class FilterKeeper implements View.OnAttachStateChangeListener, ViewTreeObserver.OnPreDrawListener {
        private final WeakReference<View> row;
        private ViewTreeObserver observer;

        private FilterKeeper(View row) {
            this.row = new WeakReference<>(row);
        }

        static void watch(View row) {
            FilterKeeper keeper = new FilterKeeper(row);
            row.addOnAttachStateChangeListener(keeper);
            if (row.isAttachedToWindow()) keeper.onViewAttachedToWindow(row);
        }

        @Override public void onViewAttachedToWindow(View view) {
            stop();
            observer = view.getViewTreeObserver();
            observer.addOnPreDrawListener(this);
        }

        @Override public void onViewDetachedFromWindow(View view) {
            stop();
        }

        private void stop() {
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
        }

        @Override public boolean onPreDraw() {
            try {
                View view = row.get();
                if (view != null) tintButtons(view, Utils.settingsReady() && Settings.BLACK_BOARDS.get() && night(view));
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.AMOLED_BLACK, "profile filters frame", failure);
            }
            return true;
        }
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
     * [card] names one view painted the same way, or is null. A [generic] sheet is any sheet or menu, and one with a switch of its own, the same view or
     * one inside or around it, keeps that switch: the generic one follows it, whichever was handed
     * over first. An [own] sheet carries the gray on its own fill as well.
     */
    private static void built(View sheet, BooleanSetting setting, boolean generic, boolean own, boolean topBand,
                              String chips, String card, String what, String... fills) {
        try {
            if (sheet == null) return;
            Sheet before = sheets.get(sheet);
            if (generic && before != null && !before.generic) return;
            int[] ids = new int[fills.length];
            for (int index = 0; index < fills.length; index++) ids[index] = id(sheet, fills[index]);
            Sheet known = new Sheet(setting, generic, own, topBand, ids, chips == null ? 0 : id(sheet, chips),
                    card == null ? 0 : id(sheet, card));
            sheets.put(sheet, known);
            if (before == null) {
                sheet.addOnLayoutChangeListener(REPAINT_SHEET);
                sheet.addOnAttachStateChangeListener(LEAVING);
            } else {
                known.band = before.band;
                if (before.generic && !generic) paintSheet(sheet, before, false);
            }
            boolean black = UiHooks.enabled(FamilyNames.AMOLED_BLACK, switchOf(sheet, known)) && night(sheet);
            paintSheet(sheet, known, black);
            if (generic) return;
            List<View> around = new ArrayList<>();
            for (Map.Entry<View, Sheet> open : sheets.entrySet()) {
                View other = open.getKey();
                if (other != null && other != sheet && open.getValue().generic && related(other, sheet)) around.add(other);
            }
            for (View other : around) paintSheet(other, sheets.get(other), black);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AMOLED_BLACK, what, failure);
        }
    }

    /** The switch a sheet follows: its own, or for a generic sheet, that of a sheet with one inside or around it. */
    private static BooleanSetting switchOf(View sheet, Sheet known) {
        if (!known.generic) return known.setting;
        for (Map.Entry<View, Sheet> open : sheets.entrySet()) {
            View other = open.getKey();
            if (other != null && other != sheet && !open.getValue().generic && related(other, sheet)) return open.getValue().setting;
        }
        return known.setting;
    }

    /** Whether one view holds the other. */
    private static boolean related(View one, View other) {
        return holds(one, other) || holds(other, one);
    }

    private static boolean holds(View outer, View inner) {
        for (ViewParent parent = inner.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (parent == outer) return true;
        }
        return false;
    }

    private static void paintSheet(View sheet, Sheet known, boolean black) {
        if (known.own) paintFill(sheet, black, false);
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
        View card = known.card == 0 ? null : sheet.findViewById(known.card);
        if (card != null) paintFill(card, black, true);
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
            if (Utils.settingsReady() && switchOf(sheet, open.getValue()).get() && night(sheet)) return true;
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
        else if (background instanceof GradientDrawable) paint((GradientDrawable) background, black, washes);
        else if (background instanceof ColorDrawable) paint((ColorDrawable) background, black, washes);
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
        /** Whether it's any sheet or menu, which follows a sheet with a switch of its own inside or around it. */
        final boolean generic;
        /** Whether the sheet's own fill carries the gray too. */
        final boolean own;
        /** Whether the band under the status bar turns black with the sheet. */
        final boolean topBand;
        final int[] fills;
        /** The row whose children each carry the gray, 0 for none. */
        final int chips;
        /** A view inside the sheet that carries the gray, see-through or not, 0 for none. */
        final int card;
        /** The strip behind the gesture handle in the window the sheet was last laid out in. */
        WeakReference<View> strip;
        /** The black band over the sheet's top padding while it's drawn, null otherwise. */
        ColorDrawable band;

        Sheet(BooleanSetting setting, boolean generic, boolean own, boolean topBand, int[] fills, int chips, int card) {
            this.setting = setting;
            this.generic = generic;
            this.own = own;
            this.topBand = topBand;
            this.fills = fills;
            this.chips = chips;
            this.card = card;
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
        paint(fill, black, false);
    }

    /** [washes] also takes a fill that is partly see-through, never one that is fully clear. */
    private static void paint(ColorDrawable fill, boolean black, boolean washes) {
        if (!black) {
            Integer original = colors.remove(fill);
            // Pinterest gives the strip each page's own color, and a color it set since isn't ours to undo.
            if (original != null && fill.getColor() == Color.BLACK) fill.setColor(original);
            return;
        }
        int color = fill.getColor();
        int alpha = Color.alpha(color);
        if ((washes ? alpha == 0 : alpha != 0xFF) || color == Color.BLACK) return;
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
