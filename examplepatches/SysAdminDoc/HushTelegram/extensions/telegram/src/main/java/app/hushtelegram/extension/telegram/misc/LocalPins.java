/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.util.SparseArray;
import android.view.View;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.ToIntFunction;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsLock;

/**
 * Pin chats on this phone (#79): the chat list's long press menu offers Pin on this phone, and the
 * chats picked that way sit right under Telegram's own pinned chats in All Chats, newest message
 * first among themselves.
 *
 * <p>Nothing goes to Telegram. The server's pins, its pin limit and the other devices stay as they
 * are, and the archive and the folder tabs keep Telegram's order. The picks are dialog ids, the same
 * peer on every account, so one list in the settings covers them all and the settings file carries
 * it without any account's own id. The order runs inside the hidden chats' sort hook, after the
 * date order, and moves only chats that aren't pinned or the archive's row.
 */
public final class LocalPins {
    private LocalPins() {}

    /** What the diagnostic report counts each sort that put the picked chats up top as. */
    static final String SORTED = "chats pinned on this phone";

    /** The most chats one phone keeps pinned, so the setting stays short. */
    public static final int MAX_PINS = 20;

    /** The long press menu's Pin on this phone and Unpin on this phone items, after Record calls here's id. */
    static final int PIN_ID = 0x48544805;
    static final int UNPIN_ID = 0x48544806;

    /** The chat ids a long press picked on a chat list, through the stub below. A test answers it itself. */
    static Function<Object, List<?>> selection = LocalPins::selectedOf;

    /** Each chat list's two items, so they can follow the switch and the selection. Main thread only. */
    private static final Map<Object, WeakReference<View>> PIN_ITEMS = new WeakHashMap<>();
    private static final Map<Object, WeakReference<View>> UNPIN_ITEMS = new WeakHashMap<>();

    /**
     * The picked chats in [text], comma-separated dialog ids as {@link #join} writes them, or null
     * for anything else: a zero, a repeat, a sign or padding a write never puts there, or more than
     * {@link #MAX_PINS}.
     */
    @Nullable
    static Set<Long> parse(@Nullable String text) {
        if (text == null) return null;
        Set<Long> ids = new LinkedHashSet<>();
        if (text.isEmpty()) return ids;
        for (String part : text.split(",", -1)) {
            long id;
            try {
                id = Long.parseLong(part);
            } catch (NumberFormatException notAnId) {
                return null;
            }
            if (id == 0 || !String.valueOf(id).equals(part) || !ids.add(id)) return null;
        }
        return ids.size() > MAX_PINS ? null : ids;
    }

    /** Whether [text] is one this would save, for a settings file's value. */
    public static boolean allowed(@Nullable String text) {
        return parse(text) != null;
    }

    /** How many chats [text] pins, none for a value this never wrote. */
    public static int count(@Nullable String text) {
        Set<Long> ids = parse(text);
        return ids == null ? 0 : ids.size();
    }

    static String join(Set<Long> ids) {
        StringBuilder text = new StringBuilder();
        for (long id : ids) {
            if (text.length() > 0) text.append(',');
            text.append(id);
        }
        return text.toString();
    }

    /** The picked chats, none when the setting can't be read or holds something this never wrote. */
    static Set<Long> pins() {
        Set<Long> ids = parse(Settings.LOCAL_PINNED_CHATS.get());
        return ids == null ? Collections.emptySet() : ids;
    }

    /** Whether the switch is on and this build carries the menu's selection read, which pause turns off. */
    private static boolean ready() {
        return Utils.settingsReady() && Settings.LOCAL_PINS.get() && PatchFamily.Capability.LOCAL_PINS.installed();
    }

    /**
     * Called from {@link HiddenChats#prune} after the date order: moves the picked chats in All
     * Chats to the first places after the pinned chats, newest first, or does nothing while the
     * switch is off or nothing is picked.
     */
    @SuppressWarnings("unchecked")
    static void sort(Object controller) {
        try {
            if (!Utils.settingsReady() || !Settings.LOCAL_PINS.get()) return;
            Set<Long> pins = pins();
            if (pins.isEmpty() || !PatchFamily.Capability.LOCAL_PINS.installed()) return;
            HiddenChats.Telegram chats = HiddenChats.telegram;
            SparseArray<?> folders = chats.folders(controller);
            // Folder 0 is All Chats; the archive and the folder tabs keep their own order.
            Object all = folders == null ? null : folders.get(0);
            if (!(all instanceof List)) return;
            ChatSort.Telegram dates = ChatSort.telegram;
            lead((List<Object>) all, dialog -> chats.pinned(dialog) || dates.isFolder(dialog),
                    dialog -> pins.contains(chats.dialogId(dialog)), dates::lastDate);
            HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, SORTED);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, SORTED, failure);
        }
    }

    /**
     * Puts the [pinned] chats that aren't [fixed] first, newest first, into the places the chats
     * that aren't [fixed] took, with the others after them in the order they had. A [fixed] chat
     * or a null never moves.
     */
    static <T> void lead(List<T> list, Predicate<T> fixed, Predicate<T> pinned, ToIntFunction<T> date) {
        List<Integer> slots = new ArrayList<>();
        List<T> up = new ArrayList<>();
        List<T> rest = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            T each = list.get(i);
            if (each == null || fixed.test(each)) continue;
            slots.add(i);
            (pinned.test(each) ? up : rest).add(each);
        }
        if (up.isEmpty()) return;
        Comparator<T> byDate = Comparator.comparingInt(date);
        up.sort(byDate.reversed());
        up.addAll(rest);
        for (int i = 0; i < slots.size(); i++) list.set(slots.get(i), up.get(i));
    }

    /** Called by {@link HiddenChats#menuItem} after Record calls here: adds Pin on this phone and Unpin on this phone. */
    static void menuItem(Object list, Object more) {
        try {
            Context context = Utils.getContext();
            View pin = item(context, more, PIN_ID, "msg_pin", L10n.t("Pin on this phone"));
            View unpin = item(context, more, UNPIN_ID, "msg_unpin", L10n.t("Unpin on this phone"));
            if (pin != null) PIN_ITEMS.put(list, new WeakReference<>(pin));
            if (unpin != null) UNPIN_ITEMS.put(list, new WeakReference<>(unpin));
            menuShown(list);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "pin on this phone item", failure);
        }
    }

    @Nullable
    private static View item(@Nullable Context context, Object more, int id, String icon, String text) {
        int drawable = context == null ? 0 : context.getResources().getIdentifier(icon, "drawable", context.getPackageName());
        Object item = HiddenChats.telegram.addMenuItem(more, id, drawable, text);
        return item instanceof View ? (View) item : null;
    }

    /**
     * Called by {@link HiddenChats#menuShown} on each change of selection: with the switch on,
     * Unpin on this phone shows when every selected chat is pinned here and Pin on this phone shows
     * otherwise. With it off, or paused, neither shows.
     */
    static void menuShown(Object list) {
        View pin = held(PIN_ITEMS, list);
        View unpin = held(UNPIN_ITEMS, list);
        if (pin == null && unpin == null) return;
        boolean offered = false;
        boolean unpinning = false;
        try {
            if (ready()) {
                Set<Long> picked = picked(selection.apply(list));
                unpinning = !picked.isEmpty() && pins().containsAll(picked);
                offered = true;
            }
        } catch (Throwable failure) {
            offered = false;
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "pin on this phone item", failure);
        }
        if (pin != null) pin.setVisibility(offered && !unpinning ? View.VISIBLE : View.GONE);
        if (unpin != null) unpin.setVisibility(offered && unpinning ? View.VISIBLE : View.GONE);
    }

    @Nullable
    private static View held(Map<Object, WeakReference<View>> items, Object list) {
        WeakReference<View> held = items.get(list);
        return held == null ? null : held.get();
    }

    private static Set<Long> picked(@Nullable List<?> selected) {
        Set<Long> picked = new LinkedHashSet<>();
        for (int i = 0; selected != null && i < selected.size(); i++) {
            Object chat = selected.get(i);
            if (chat instanceof Long && (Long) chat != 0) picked.add((Long) chat);
        }
        return picked;
    }

    /**
     * Called by {@link HiddenChats#menuChoice} for a tap on either item: the selected chats join
     * the ones pinned here, or leave them, every signed-in account's list sorts again, and Telegram
     * gets its back arrow, which closes the selection.
     */
    static int menuChoice(Object listener, int id) {
        try {
            if (!ready() || SettingsLock.refuses()) return id;
            Set<Long> picked = picked(HiddenChats.telegram.selectedChats(listener));
            if (picked.isEmpty()) return HiddenChats.CLOSE_SELECTION;
            boolean pinning = id == PIN_ID;
            // Read and written in one queued task, so two quick taps don't drop each other's chats.
            boolean queued = Utils.runInOrderOnBackgroundThread(() -> {
                Set<Long> pins = new LinkedHashSet<>(pins());
                if (pinning) pins.addAll(picked);
                else pins.removeAll(picked);
                boolean full = pins.size() > MAX_PINS;
                boolean saved = !full && Settings.LOCAL_PINNED_CHATS.saveCommitted(join(pins));
                Utils.runOnMainThread(() -> {
                    if (full) {
                        Utils.showToastLong(L10n.f("You can pin up to %1$d chats on this phone.", MAX_PINS));
                    } else if (!saved) {
                        Utils.showToastLong(L10n.t("Couldn't save the chats. Try again in a moment."));
                    } else {
                        HiddenChats.refreshAll();
                        Utils.showToastShort(pinning ? L10n.t("Pinned in All Chats on this phone.") : L10n.t("Unpinned on this phone."));
                    }
                });
            });
            if (!queued) Utils.showToastLong(L10n.t("Couldn't save the chats. Try again in a moment."));
            return HiddenChats.CLOSE_SELECTION;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "pin on this phone", failure);
            return id;
        }
    }

    // Stub. The patch gives it Telegram's code; until then it reads nothing.

    /** {@code DialogsActivity.selectedDialogs}, the chat ids a long press picked on [list]. */
    @Nullable
    public static ArrayList<?> selectedOf(Object list) { return null; }
}
