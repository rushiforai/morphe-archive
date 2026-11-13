/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.util.SparseArray;
import android.widget.Toast;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Select between: an item in a chat's selection bar that selects every message between the first
 * and last one already selected. While the chat stays in selection, picking a message above or
 * below the range fills the gap to it too, so a range grows with one tap.
 *
 * <p>Telegram does the selecting. Each message goes through the chat's own select method, which
 * also sets the bar's buttons, and then the count and the rows' checks are redrawn the way
 * Telegram's own tap redraws them (the select method alone leaves both stale). Service messages and
 * date rows can't be selected and are skipped. If a selected message has scrolled out of what the
 * chat has loaded the range can't be known, so nothing is selected and a toast says why. The
 * selection stops at Telegram's 100 message limit, again with a toast.
 */
public final class SelectBetween {
    private SelectBetween() {}

    /** The bar item's number, far past Telegram's own, and what Telegram's click handler is told instead once it's taken. */
    static final int ITEM = 0x48544d20;
    static final int TAKEN = 0x48544d2f;
    /** Telegram's limit on selected messages. */
    static final int LIMIT = 100;

    /** What a request came to. */
    enum Outcome { SELECTED, TOO_FEW, NOT_LOADED, NOTHING, LIMIT }

    /** The positions in the chat's list to select, and why the list is what it is. */
    static final class Plan {
        final List<Integer> pick = new ArrayList<>();
        Outcome outcome = Outcome.SELECTED;
    }

    private static WeakReference<Object> armed = new WeakReference<>(null);
    private static boolean busy;

    /**
     * Everything between the outermost two of the [selected] ids in [ids] (the chat's order) that
     * can be selected and isn't, up to [limit] selected in all.
     */
    static Plan between(int[] ids, boolean[] selectable, Set<Integer> selected, int limit) {
        Plan plan = new Plan();
        if (selected.size() < 2) {
            plan.outcome = Outcome.TOO_FEW;
            return plan;
        }
        int low = Integer.MAX_VALUE;
        int high = -1;
        int found = 0;
        for (int i = 0; i < ids.length; i++) {
            if (!selected.contains(ids[i])) continue;
            found++;
            low = Math.min(low, i);
            high = Math.max(high, i);
        }
        if (found != selected.size()) {
            plan.outcome = Outcome.NOT_LOADED;
            return plan;
        }
        fill(plan, ids, selectable, selected, limit, 0, low + 1, high - 1);
        return plan;
    }

    /**
     * What to select before [tapped] so the range reaches it, when it lies outside the selected
     * ones: the messages from the nearest selected one up to it. Nothing for a tap inside the range,
     * on a selected message, or when the chat doesn't have every selected message loaded.
     */
    static Plan extend(int[] ids, boolean[] selectable, Set<Integer> selected, int limit, int tapped) {
        Plan plan = new Plan();
        if (selected.isEmpty() || selected.contains(tapped)) {
            plan.outcome = Outcome.NOTHING;
            return plan;
        }
        int low = Integer.MAX_VALUE;
        int high = -1;
        int found = 0;
        int at = -1;
        for (int i = 0; i < ids.length; i++) {
            if (ids[i] == tapped) at = i;
            if (!selected.contains(ids[i])) continue;
            found++;
            low = Math.min(low, i);
            high = Math.max(high, i);
        }
        if (found != selected.size()) {
            plan.outcome = Outcome.NOT_LOADED;
            return plan;
        }
        if (at < 0 || at >= low && at <= high) {
            plan.outcome = Outcome.NOTHING;
            return plan;
        }
        if (at < low) fill(plan, ids, selectable, selected, limit, 1, at + 1, low - 1);
        else fill(plan, ids, selectable, selected, limit, 1, high + 1, at - 1);
        return plan;
    }

    static void fill(Plan plan, int[] ids, boolean[] selectable, Set<Integer> selected, int limit, int reserved, int from, int to) {
        // [reserved] seats stay free for the tapped message, which Telegram selects after these.
        int room = limit - selected.size() - reserved;
        for (int i = from; i <= to; i++) {
            if (!selectable[i] || selected.contains(ids[i])) continue;
            if (plan.pick.size() >= room) {
                plan.outcome = Outcome.LIMIT;
                return;
            }
            plan.pick.add(i);
        }
        if (plan.pick.isEmpty()) plan.outcome = Outcome.NOTHING;
    }

    /** Asked as Telegram finishes the selection bar's buttons. Select all and Screenshot go in here too. */
    public static void addItem(Object chat) {
        HookStatus.invoked(FamilyNames.MESSAGE_MENU_REPEAT);
        try {
            boolean between = on();
            boolean all = SelectAll.inChats();
            boolean screenshot = SelectionScreenshot.on();
            if (!between && !all && !screenshot) return;
            Object menu = menu(chat);
            if (menu == null) return;
            int width = Math.round(48 * Utils.getContext().getResources().getDisplayMetrics().density);
            if (all) {
                addMenuItem(menu, SelectAll.ITEM, SelectAll.icon(), L10n.t("Select all"), width);
                HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "select all offered");
            }
            if (between) {
                addMenuItem(menu, ITEM, icon(), L10n.t("Select between"), width);
                HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "select between offered");
            }
            if (screenshot) {
                addMenuItem(menu, SelectionScreenshot.ITEM, SelectionScreenshot.icon(), L10n.t("Screenshot"), width);
                HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "selection screenshot offered");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "select between item", failure);
        }
    }

    /** Asked first when a selection bar button is tapped. Returns what Telegram's own handler should see. */
    public static int clicked(Object chat, int id) {
        if (id == SelectionScreenshot.ITEM) return SelectionScreenshot.clicked(chat);
        if (id == SelectAll.ITEM) return all(chat);
        if (id != ITEM) return id;
        try {
            if (!on()) return id;
            run(chat);
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "select between used");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "select between", failure);
            toast(L10n.t("Couldn't complete that action. Try again."));
        }
        return TAKEN;
    }

    /** Asked before Telegram toggles a message's selection. A message past the range pulls the gap in with it. */
    public static void selecting(Object chat, Object message) {
        if (busy || armed.get() != chat || message == null) return;
        try {
            if (!on()) return;
            Set<Integer> selected = selectedIds(chat);
            if (selected.isEmpty()) {
                armed = new WeakReference<>(null);
                return;
            }
            Snapshot snapshot = snapshot(chat);
            if (snapshot == null) return;
            Plan plan = extend(snapshot.ids, snapshot.selectable, selected, LIMIT, messageId(message));
            apply(chat, snapshot, plan, false);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "select between range", failure);
        }
    }

    private static void run(Object chat) {
        Set<Integer> selected = selectedIds(chat);
        Snapshot snapshot = snapshot(chat);
        if (snapshot == null) {
            toast(L10n.t("Those messages aren't all loaded"));
            return;
        }
        Plan plan = between(snapshot.ids, snapshot.selectable, selected, LIMIT);
        apply(chat, snapshot, plan, true);
        // A tap on a message redraws after selecting it. The picks here come from a bar button, so nothing else would.
        if (!plan.pick.isEmpty()) refresh(chat);
        if (plan.outcome == Outcome.SELECTED || plan.outcome == Outcome.LIMIT) armed = new WeakReference<>(chat);
    }

    /** Select all's tap in a chat: every loaded message, newest first. Telegram's handler never sees it. */
    private static int all(Object chat) {
        try {
            if (!SelectAll.inChats()) return TAKEN;
            Snapshot snapshot = snapshot(chat);
            if (snapshot == null) {
                toast(L10n.t("Couldn't complete that action. Try again."));
                return TAKEN;
            }
            Plan plan = SelectAll.plan(snapshot.ids, snapshot.selectable, selectedIds(chat), LIMIT);
            apply(chat, snapshot, plan, false);
            if (!plan.pick.isEmpty()) refresh(chat);
            if (plan.outcome == Outcome.NOTHING) toast(L10n.t("Everything here is already selected"));
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "select all used");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "select all", failure);
            toast(L10n.t("Couldn't complete that action. Try again."));
        }
        return TAKEN;
    }

    private static void apply(Object chat, Snapshot snapshot, Plan plan, boolean said) {
        busy = true;
        try {
            for (int index : plan.pick) pick(chat, snapshot.messages.get(index));
        } finally {
            busy = false;
        }
        if (plan.outcome == Outcome.LIMIT) toast(L10n.t("Stopped at 100 messages"));
        else if (plan.outcome == Outcome.NOT_LOADED) toast(L10n.t("Those messages aren't all loaded"));
        else if (said && plan.outcome == Outcome.TOO_FEW) toast(L10n.t("Select two messages first"));
        else if (said && plan.outcome == Outcome.NOTHING) toast(L10n.t("Nothing in between to select"));
    }

    private static boolean on() {
        return Utils.settingsReady() && Settings.SELECT_BETWEEN.get();
    }

    /** The chat's loaded messages, as ids in its order, with which of them can be selected. */
    private static final class Snapshot {
        final List<Object> messages;
        final int[] ids;
        final boolean[] selectable;

        Snapshot(List<Object> messages) {
            this.messages = messages;
            ids = new int[messages.size()];
            selectable = new boolean[messages.size()];
            for (int i = 0; i < ids.length; i++) {
                Object message = messages.get(i);
                ids[i] = messageId(message);
                // Telegram's own multi-select takes only plain messages, never a date row or a service message.
                selectable[i] = contentType(message) == 0;
            }
        }
    }

    private static Snapshot snapshot(Object chat) {
        ArrayList<Object> list = messages(chat);
        return list == null ? null : new Snapshot(list);
    }

    private static Set<Integer> selectedIds(Object chat) {
        Set<Integer> ids = new HashSet<>();
        SparseArray<Object>[] both = selected(chat);
        if (both == null) return ids;
        for (SparseArray<Object> side : both) {
            for (int i = 0; i < side.size(); i++) ids.add(side.keyAt(i));
        }
        return ids;
    }

    /** The selected messages themselves, both sides of the chat. */
    static List<Object> selectedMessages(Object chat) {
        List<Object> messages = new ArrayList<>();
        SparseArray<Object>[] both = selected(chat);
        if (both == null) return messages;
        for (SparseArray<Object> side : both) {
            for (int i = 0; i < side.size(); i++) {
                if (side.valueAt(i) != null) messages.add(side.valueAt(i));
            }
        }
        return messages;
    }

    private static void toast(String text) {
        Context context = Utils.getContext();
        if (context == null) return;
        Utils.runOnMainThreadNowOrLater(() -> Toast.makeText(context, text, Toast.LENGTH_SHORT).show());
    }

    // Filled in by the patch with this build's chat screen.

    /** The chat's selected messages by id, one array entry for each side of a forwarded chat. */
    public static SparseArray<Object>[] selected(Object chat) { return null; }

    /** The messages the chat shows, in its order. */
    public static ArrayList<Object> messages(Object chat) { return null; }

    /** Selects the message the way tapping it would. */
    public static void pick(Object chat, Object message) {}

    /** Redraws the selection count and the rows' checks, the two calls Telegram's own tap makes after selecting. */
    public static void refresh(Object chat) {}

    /** The selection bar's menu. */
    public static Object menu(Object chat) { return null; }

    /** Adds a button to the selection bar's menu. */
    public static void addMenuItem(Object menu, int id, int icon, String text, int width) {}

    public static int icon() { return 0; }

    public static int messageId(Object message) { return 0; }

    public static int contentType(Object message) { return 0; }
}
