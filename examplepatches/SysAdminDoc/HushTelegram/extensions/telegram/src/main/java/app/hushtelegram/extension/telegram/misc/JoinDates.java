/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.text.format.DateUtils;
import android.view.View;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Shows when each person joined a group in its member lists (#79): the Members page and the list on
 * the group's profile. The date is the one Telegram already sends with every member, so nothing
 * more is asked of it. A list binds a member and then its row, and the row writes its second line
 * afterwards, so the patch tells this class which member each row shows and the date goes after
 * the last seen text that line carries. A row showing its own text instead, such as an admin's
 * role or who removed someone, keeps it, and a member without a date gets nothing added.
 *
 * <p>Telegram saves a group's members with the time it saved them, and reading them back it writes
 * that time over each member's own date. The patch calls {@link #stored} just before, so a member
 * read from the saved list shows the date it came with, and the owner, who has none, shows nothing.
 */
public final class JoinDates {
    private JoinDates() {}

    /** When the member each bound row shows joined, in seconds since 1970. A dropped row drops out. */
    private static final Map<Object, Integer> JOINED = new WeakHashMap<>();
    /** Each member read back from a saved list, with the date it had before Telegram wrote the save time over it. */
    private static final Map<Object, Integer> STORED = Collections.synchronizedMap(new WeakHashMap<>());
    /** The date of the member being bound, until the patch names its row. */
    private static int pending;
    /** The row writing its second line right now. */
    private static WeakReference<Object> current = new WeakReference<>(null);

    /** Called with the member a list is about to bind to a row. */
    public static void member(Object participant) {
        try {
            pending = participant != null && on() ? joined(participant) : 0;
        } catch (Throwable failure) {
            pending = 0;
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "member join date", failure);
        }
    }

    /**
     * Called as Telegram reads a member back from its saved list, right before it writes the time it
     * saved the list over that member's join date. Kept with the switch off too, so turning it on later
     * doesn't show save times for lists already read.
     */
    public static void stored(Object participant) {
        try {
            if (participant != null) STORED.put(participant, participantDate(participant));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "saved member join date", failure);
        }
    }

    /** When [participant] joined: the date it had before a saved list's time went over it, else its own. */
    private static int joined(Object participant) {
        Integer kept = STORED.get(participant);
        if (kept == null) {
            Object inner = channelMember(participant);
            if (inner != null) kept = STORED.get(inner);
        }
        return kept != null ? kept : participantDate(participant);
    }

    /** Called with the row the member from {@link #member} is bound to. */
    public static void cell(Object cell) {
        try {
            if (cell == null) return;
            if (pending > 0) JOINED.put(cell, pending);
            else JOINED.remove(cell);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "member join date row", failure);
        } finally {
            pending = 0;
        }
    }

    /** Called first thing when a member row writes its lines. */
    public static void updating(Object cell) {
        try {
            current = new WeakReference<>(cell);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "member join date row", failure);
        }
    }

    /** The last seen text a member row is about to show, with when its member joined after it. */
    public static String status(String text) {
        if (text == null || text.isEmpty()) return text;
        try {
            if (!on()) return text;
            Object cell = current.get();
            if (!(cell instanceof View)) return text;
            Integer joined = JOINED.get(cell);
            if (joined == null || joined <= 0) return text;
            Context context = ((View) cell).getContext();
            String shown = L10n.f(context, "%1$s · joined %2$s", text, when(context, joined));
            HookStatus.counted(FamilyNames.SHOW_LOCAL_IDS, "member join date shown");
            return shown;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "member join date", failure);
            return text;
        }
    }

    /** [seconds] as the phone writes a date and time, such as "12 Mar 2024, 14:05". */
    static String when(Context context, int seconds) {
        return DateUtils.formatDateTime(context, seconds * 1000L, DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_SHOW_YEAR
                | DateUtils.FORMAT_SHOW_TIME | DateUtils.FORMAT_ABBREV_MONTH);
    }

    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.MEMBER_JOIN_DATES.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "member join dates switch", failure);
            return false;
        }
    }

    /** Forgets every row, for tests. */
    static void clearForTests() {
        JOINED.clear();
        STORED.clear();
        pending = 0;
        current = new WeakReference<>(null);
    }

    /** Replaced when patching: when [participant], one of Telegram's group or channel members, joined; 0 when it doesn't say. */
    public static int participantDate(Object participant) { return 0; }

    /** Replaced when patching: the channel member a group member wraps, or null. */
    public static Object channelMember(Object participant) { return null; }
}
