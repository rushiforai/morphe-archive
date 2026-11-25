/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Moves the folder tab strip from under the chat list's header to right above the bottom bar. The
 * strip stays where Telegram lays it out and is only translated, so its touches, its fade and its
 * blur keep working. The hooks answer the sizes that follow from the move: the list loses the gap
 * the strip left at the top and gains room at the bottom, what sits under the header moves up, and
 * the compose button rides above the strip.
 *
 * A chat list without the bottom bar (the forward picker, the archive, a community) keeps its tabs
 * where they are, since it has no bar to sit on. Every answer follows the strip's fade, so a strip
 * that's hidden, in search or with no folders, takes no room.
 */
public final class BottomFolderTabs {
    private BottomFolderTabs() {}

    /** What the diagnostic report counts each time the strip takes a new place. */
    static final String MOVED = "folder tabs moved above the bottom bar";

    private static final String WHAT = "bottom folder tabs";

    /** How far the strip reaches under the bar's top edge: the bar's glass starts below that edge. */
    static final int OVERLAP_DP = 6;

    /** How much lower the compact bar's top edge is than Telegram's 72 dp bar. */
    static final int COMPACT_DP = 72 - MainTabs.COMPACT_HEIGHT;

    /** The room the bar's blur keeps above the strip, so the strip's glass has something to show. */
    static final int CAPTURE_DP = 8;

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    /** Every chat list seen so far, with how far it last lifted its compose button. */
    private static final Map<Object, Float> lifts = new WeakHashMap<>();

    /**
     * Stands in for the strip's setTranslationY where the chat list places everything under its
     * header. Telegram calls that on every layout and every step of the strip's fade.
     */
    public static void place(Object list, Object strip, float stock) {
        View view = (View) strip;
        float translation = stock;
        try {
            float moved = moves(list) ? movedTranslation(list, view) : Float.NaN;
            if (!Float.isNaN(moved)) {
                translation = moved;
                if (view.getTranslationY() != moved) HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, MOVED);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, WHAT, failure);
        }
        view.setTranslationY(translation);
        try {
            float lift = moves(list) ? room(view) : 0f;
            Float last = lifts.put(list, lift);
            if (last == null ? lift != 0f : last != lift) telegram.updateCompose(list);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, WHAT, failure);
        }
    }

    /** How much of the strip's height the views under the header make way for: none once it's moved. */
    public static float headerShare(Object list, float stock) {
        return gone(list) ? 0f : stock;
    }

    /** How much of the strip the list leaves room for at its top: none once it's moved. */
    public static float topShare(Object list, float stock) {
        return gone(list) ? 0f : stock;
    }

    /** The list's bottom padding, with room for the strip so its last chat isn't left behind it. */
    public static int bottomPadding(Object list, int stock) {
        try {
            return stock + Math.round(roomOf(list));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, WHAT, failure);
            return stock;
        }
    }

    /** How far the compose button is lifted: over the strip, unless something lifts it further. */
    public static float composeLift(Object list, float stock) {
        try {
            return Math.max(stock, roomOf(list));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, WHAT, failure);
            return stock;
        }
    }

    /** The top of what the bar's blur captures, raised to take the moved strip in. */
    public static int captureTop(Object list, int stock) {
        try {
            if (!moves(list)) return stock;
            Object found = telegram.strip(list);
            if (!(found instanceof View) || visible((View) found) <= 0f) return stock;
            View strip = (View) found;
            return stock - height(strip) - dp(strip, CAPTURE_DP);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, WHAT, failure);
            return stock;
        }
    }

    /** Puts every chat list right after the switch flips. Main thread only. */
    public static void refreshAll() {
        for (Object list : new ArrayList<>(lifts.keySet())) {
            try {
                telegram.updatePlace(list);
                telegram.updateCompose(list);
                Object strip = telegram.strip(list);
                if (strip instanceof View && ((View) strip).getParent() instanceof View) {
                    // The list's own padding is only read when the list itself measures again.
                    relayout((View) ((View) strip).getParent(), 2);
                }
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, WHAT, failure);
            }
        }
    }

    /** Whether the move is on in this build and in the settings. */
    static boolean available() {
        try {
            return Utils.settingsReady() && Settings.FOLDER_TABS_BOTTOM.get()
                    && PatchFamily.Capability.BOTTOM_TABS.installed();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, WHAT, failure);
            return false;
        }
    }

    /** Where the strip's top goes, as a translation from {@code layoutTop}. */
    static float translationFor(int parentHeight, int navigation, int bar, int overlap, int stripHeight, int layoutTop) {
        return parentHeight - navigation - bar + overlap - stripHeight - layoutTop;
    }

    /** Whether [list] has a bottom bar for its strip to sit on and the switch is on. */
    private static boolean moves(Object list) {
        return available() && telegram.barRoom(list) > 0;
    }

    private static boolean gone(Object list) {
        try {
            return moves(list);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, WHAT, failure);
            return false;
        }
    }

    /** The strip's translation above the bar, or NaN while there's nothing laid out to measure from. */
    private static float movedTranslation(Object list, View strip) {
        if (!(strip.getParent() instanceof View)) return Float.NaN;
        int parentHeight = ((View) strip.getParent()).getHeight();
        int height = height(strip);
        if (parentHeight <= 0 || height <= 0) return Float.NaN;
        int bar = telegram.barRoom(list) - (compactBar() ? dp(strip, COMPACT_DP) : 0);
        return translationFor(parentHeight, telegram.navHeight(list), bar, dp(strip, OVERLAP_DP), height, strip.getTop());
    }

    private static boolean compactBar() {
        return Settings.COMPACT_TAB_BAR.get() && PatchFamily.Capability.COMPACT_TAB_BAR.installed();
    }

    /** The room [list]'s moved strip takes above the bar, 0 when it isn't moved or isn't showing. */
    private static float roomOf(Object list) {
        if (!moves(list)) return 0f;
        Object strip = telegram.strip(list);
        return strip instanceof View ? room((View) strip) : 0f;
    }

    private static float room(View strip) {
        return Math.max(0, height(strip) - dp(strip, OVERLAP_DP)) * visible(strip);
    }

    private static float visible(View strip) {
        return strip.getVisibility() == View.VISIBLE ? strip.getAlpha() : 0f;
    }

    /** The strip's height, from its layout params until it's been measured. */
    private static int height(View strip) {
        int measured = strip.getMeasuredHeight();
        if (measured > 0) return measured;
        ViewGroup.LayoutParams params = strip.getLayoutParams();
        return params != null ? Math.max(params.height, 0) : 0;
    }

    private static int dp(View view, int value) {
        return (int) Math.ceil(view.getResources().getDisplayMetrics().density * value);
    }

    private static void relayout(View view, int depth) {
        view.requestLayout();
        if (depth == 0 || !(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int child = 0; child < group.getChildCount(); child++) relayout(group.getChildAt(child), depth - 1);
    }

    /** What this needs from Telegram. */
    interface Telegram {
        /** The chat list's folder tab strip, or null before it exists. */
        Object strip(Object list);

        /** The height of the system navigation bar under the chat list. */
        int navHeight(Object list);

        /** The room the chat list keeps for the bottom bar, 0 when it has none. */
        int barRoom(Object list);

        /** Has the chat list place what's under its header again. */
        void updatePlace(Object list);

        /** Has the chat list place its compose button again. */
        void updateCompose(Object list);
    }

    private static final class Stubs implements Telegram {
        @Override public Object strip(Object list) { return BottomFolderTabs.tabStrip(list); }

        @Override public int navHeight(Object list) { return BottomFolderTabs.navHeightOf(list); }

        @Override public int barRoom(Object list) { return BottomFolderTabs.barRoomOf(list); }

        @Override public void updatePlace(Object list) { BottomFolderTabs.placeAgain(list); }

        @Override public void updateCompose(Object list) { BottomFolderTabs.composeAgain(list); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code list.filterTabsView}. */
    public static Object tabStrip(Object list) { return null; }

    /** {@code list.navigationBarHeight}. */
    public static int navHeightOf(Object list) { return 0; }

    /** {@code list.additionNavigationBarHeight}. */
    public static int barRoomOf(Object list) { return 0; }

    /** {@code list.updateContextViewPosition()}. */
    public static void placeAgain(Object list) {}

    /** {@code list.updateFloatingButtonOffset()}. */
    public static void composeAgain(Object list) {}
}
