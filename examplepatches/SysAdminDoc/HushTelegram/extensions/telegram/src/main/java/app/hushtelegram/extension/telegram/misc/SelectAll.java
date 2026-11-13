/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Select all: a button in the bar that shows while you pick messages, in a chat and in a chat's
 * shared media, that selects everything loaded there, newest first, up to Telegram's limit of 100.
 *
 * <p>In a chat the button rides Select between's bar hooks and selects through the chat's own
 * select method (see {@link SelectBetween}). In shared media it goes into the bar the first time
 * Telegram shows it, on the tabs that list messages (media, files, voice, links, music and GIFs).
 * Each message goes through the tab's own tap, which keeps the count and the bar's buttons right,
 * and the tab's lists are then redrawn so their checks show.
 */
public final class SelectAll {
    private SelectAll() {}

    /** The bar item's number, next to Select between's and Screenshot's. */
    static final int ITEM = 0x48544d22;
    /** Shared media's message tabs are its first six; stories, members and the rest come after. */
    static final int MEDIA_TABS = 6;

    /** The button each shared media screen got, so a second showing only sets whether it shows. */
    private static final Map<Object, WeakReference<View>> buttons = new WeakHashMap<>();

    /** Every message in [ids] (newest first) that can be selected and isn't, up to [limit] selected in all. */
    static SelectBetween.Plan plan(int[] ids, boolean[] selectable, Set<Integer> selected, int limit) {
        SelectBetween.Plan plan = new SelectBetween.Plan();
        SelectBetween.fill(plan, ids, selectable, selected, limit, 0, 0, ids.length - 1);
        return plan;
    }

    /** Whether a chat's selection bar gets the button. */
    static boolean inChats() {
        return Utils.settingsReady() && Settings.SELECT_ALL.get() && PatchFamily.Capability.SELECT_ALL.installed();
    }

    static boolean inSharedMedia() {
        return Utils.settingsReady() && Settings.SELECT_ALL.get() && PatchFamily.Capability.SHARED_MEDIA_SELECT_ALL.installed();
    }

    /** Asked as Telegram shows or hides shared media's selection bar, before it does. */
    public static void showing(Object layout, boolean show) {
        if (!show || layout == null) return;
        HookStatus.invoked(FamilyNames.MESSAGE_MENU_REPEAT);
        try {
            WeakReference<View> held = buttons.get(layout);
            View button = held == null ? null : held.get();
            boolean wanted = inSharedMedia() && messages(layout, tab(layout)) != null;
            if (button == null) {
                if (!wanted) return;
                Object made = addButton(layout, ITEM, icon(), L10n.t("Select all"));
                if (!(made instanceof View)) return;
                button = (View) made;
                // Telegram's own listener answers the bar's ids it knows, so this one takes the tap instead.
                button.setOnClickListener(tapped -> selectAll(layout));
                buttons.put(layout, new WeakReference<>(button));
                HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "shared media select all offered");
            }
            button.setVisibility(wanted ? View.VISIBLE : View.GONE);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "shared media select all item", failure);
        }
    }

    private static void selectAll(Object layout) {
        try {
            if (!inSharedMedia() || !actionMode(layout)) return;
            int tab = tab(layout);
            ArrayList<Object> list = messages(layout, tab);
            if (list == null) {
                toast(L10n.t("Couldn't complete that action. Try again."));
                return;
            }
            // A snapshot, since each tap can change what the tab shows.
            Object[] shown = list.toArray();
            int[] ids = new int[shown.length];
            boolean[] selectable = new boolean[shown.length];
            for (int i = 0; i < shown.length; i++) {
                selectable[i] = shown[i] != null;
                if (selectable[i]) ids[i] = messageId(shown[i]);
            }
            SelectBetween.Plan plan = plan(ids, selectable, selectedIds(layout), SelectBetween.LIMIT);
            for (int index : plan.pick) pick(layout, shown[index], tab);
            if (!plan.pick.isEmpty()) redraw(layout);
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "shared media select all used");
            if (plan.outcome == SelectBetween.Outcome.LIMIT) toast(L10n.t("Stopped at 100 messages"));
            else if (plan.outcome == SelectBetween.Outcome.NOTHING) toast(L10n.t("Everything here is already selected"));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "shared media select all", failure);
            toast(L10n.t("Couldn't complete that action. Try again."));
        }
    }

    /** Rebinds every list on shared media's pages, which draws each cell's check from the selection. */
    private static void redraw(Object layout) {
        Object[] pages = pages(layout);
        if (pages == null) return;
        for (Object page : pages) {
            if (!(page instanceof ViewGroup)) continue;
            ViewGroup group = (ViewGroup) page;
            for (int i = 0; i < group.getChildCount(); i++) notifyList(group.getChildAt(i));
        }
    }

    private static Set<Integer> selectedIds(Object layout) {
        Set<Integer> ids = new HashSet<>();
        SparseArray<Object>[] both = selected(layout);
        if (both == null) return ids;
        for (SparseArray<Object> side : both) {
            if (side == null) continue;
            for (int i = 0; i < side.size(); i++) ids.add(side.keyAt(i));
        }
        return ids;
    }

    private static ArrayList<Object> messages(Object layout, int tab) {
        return tab >= 0 && tab < MEDIA_TABS ? tabMessages(layout, tab) : null;
    }

    private static void toast(String text) {
        Context context = Utils.getContext();
        if (context == null) return;
        Utils.runOnMainThreadNowOrLater(() -> Toast.makeText(context, text, Toast.LENGTH_SHORT).show());
    }

    // Filled in by the patch with this build's shared media screen.

    /** Adds a button to shared media's selection bar through Telegram's own item maker, and returns it. */
    public static Object addButton(Object layout, int id, int icon, String label) { return null; }

    /** Whether shared media is picking messages. */
    public static boolean actionMode(Object layout) { return false; }

    /** The tab on screen. */
    public static int tab(Object layout) { return -1; }

    /** The messages a message tab shows, newest first, or null for a tab that has none. */
    public static ArrayList<Object> tabMessages(Object layout, int tab) { return null; }

    /** The selected messages by id, one array entry for each side of a migrated group. */
    public static SparseArray<Object>[] selected(Object layout) { return null; }

    /** Selects the message the way tapping it on [tab] would. */
    public static void pick(Object layout, Object message, int tab) {}

    /** Shared media's pages, one view each. */
    public static Object[] pages(Object layout) { return null; }

    /** Rebinds [view]'s rows if it's one of Telegram's lists. */
    public static void notifyList(Object view) {}

    public static int messageId(Object message) { return 0; }

    public static int icon() { return 0; }
}
