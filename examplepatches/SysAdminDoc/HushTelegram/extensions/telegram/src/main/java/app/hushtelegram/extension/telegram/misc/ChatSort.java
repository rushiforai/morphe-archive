/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.util.SparseArray;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.function.Predicate;
import java.util.function.ToIntFunction;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Orders the chat list by the date of each chat's last message, newest or oldest first.
 *
 * <p>It runs right after Telegram sorts its lists, in the same place the hidden chats leave. Only
 * the unpinned chats move: pinned chats and the archive's row keep the exact places Telegram gave
 * them, and the chats between them swap around. It's a view order on this phone. Nothing goes to
 * the server and the real pinned order doesn't change.
 */
public final class ChatSort {
    private ChatSort() {}

    /** What the diagnostic report counts each sort that reordered the chat list as. */
    static final String SORTED = "chat list ordered by date";

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    /**
     * Called from {@link HiddenChats#prune} after the hidden chats left: reorders every folder's
     * list and each folder tab's list, or does nothing while the switch is off.
     */
    static void sortLists(Object controller) {
        try {
            if (!Utils.settingsReady() || !Settings.SORT_BY_DATE.get()) return;
            boolean oldest = Settings.SORT_OLDEST_FIRST.get();
            HiddenChats.Telegram chats = HiddenChats.telegram;
            SparseArray<?> folders = chats.folders(controller);
            for (int i = 0; folders != null && i < folders.size(); i++) sortList(folders.valueAt(i), oldest);
            Object[] tabs = chats.selectedFilters(controller);
            for (int i = 0; tabs != null && i < tabs.length; i++) {
                if (tabs[i] != null) sortList(chats.filterDialogs(tabs[i]), oldest);
            }
            HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, SORTED);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "chat list order", failure);
        }
    }

    @SuppressWarnings("unchecked")
    private static void sortList(@Nullable Object list, boolean oldest) {
        if (!(list instanceof List)) return;
        sortSlots((List<Object>) list, oldest, telegram::lastDate,
                dialog -> HiddenChats.telegram.pinned(dialog) || telegram.isFolder(dialog));
    }

    /**
     * Puts the chats that aren't [fixed] in date order, into the places those chats took. A [fixed]
     * chat or a null never moves, and chats with the same date keep the order they had.
     */
    static <T> void sortSlots(List<T> list, boolean oldest, ToIntFunction<T> date, Predicate<T> fixed) {
        List<Integer> slots = new ArrayList<>();
        List<T> movable = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            T each = list.get(i);
            if (each == null || fixed.test(each)) continue;
            slots.add(i);
            movable.add(each);
        }
        Comparator<T> byDate = Comparator.comparingInt(date);
        movable.sort(oldest ? byDate : byDate.reversed());
        for (int i = 0; i < slots.size(); i++) list.set(slots.get(i), movable.get(i));
    }

    /** What this needs from Telegram. */
    interface Telegram {
        int lastDate(Object dialog);

        boolean isFolder(Object dialog);
    }

    private static final class Stubs implements Telegram {
        @Override public int lastDate(Object dialog) { return ChatSort.lastDate(dialog); }
        @Override public boolean isFolder(Object dialog) { return ChatSort.isFolder(dialog); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code dialog.last_message_date}, in seconds. */
    public static int lastDate(Object dialog) { return 0; }

    /** Whether the entry is the archive's row, a {@code TL_dialogFolder}, not a chat. */
    public static boolean isFolder(Object dialog) { return false; }
}
