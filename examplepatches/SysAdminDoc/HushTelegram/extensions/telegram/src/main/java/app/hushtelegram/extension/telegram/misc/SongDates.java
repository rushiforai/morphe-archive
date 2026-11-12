/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;

import java.text.DateFormat;
import java.util.Date;
import java.util.function.Function;
import java.util.function.LongSupplier;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram keeps the songs on your profile without the day you added them. With the switch on,
 * this phone writes the day down as a song goes on your profile, and your profile's song list shows
 * it after the artist. A song removed from the profile loses it. Songs added before the switch was
 * on, or from another device, have none. Moving a song that has none to the top of the list looks
 * the same as adding it, so it gets that day.
 *
 * <p>The days are kept per account, by the song file's id, on this phone only.
 */
public final class SongDates {
    private SongDates() {}

    private static final String PREFS = "hushtelegram_song_dates";

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    static LongSupplier clock = System::currentTimeMillis;

    /** Called as Telegram sends a request that adds, moves or removes a song on your profile. */
    public static void saving(Object request) {
        if (request == null) return;
        try {
            if (!on()) return;
            long song = savedId(request);
            if (song == 0 || moves(request)) return;
            int account = Accounts.selected();
            if (account < 0) return;
            long self = selfId(account);
            if (self == 0) return;
            if (unsaves(request)) forget(self, song);
            else note(self, song, clock.getAsLong());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LYRICS, "song date", failure);
        }
    }

    /**
     * Asked by the song rows wherever they read the artist. On your own profile's list, a song
     * with a known day gets it after the artist. {@code unknown} is Telegram's boolean, read as
     * non-zero for yes.
     */
    public static String author(Object message, int unknown) {
        String artist = musicAuthor(message, unknown != 0);
        if (message == null) return artist;
        try {
            long owner = listedBy(message);
            if (owner == 0 || !on()) return artist;
            int account = account(message);
            if (account < 0 || owner != selfId(account)) return artist;
            long added = added(owner, documentId(message));
            if (added == 0) return artist;
            HookStatus.counted(FamilyNames.LYRICS, "song date shown");
            return withDay(artist, DateFormat.getDateInstance(DateFormat.MEDIUM).format(new Date(added)));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LYRICS, "song date", failure);
            return artist;
        }
    }

    /** The artist, then a dot and the day, or the day alone when there's no artist. */
    static String withDay(String artist, String day) {
        if (artist == null || artist.isEmpty()) return day;
        return artist + " " + (char) 0xB7 + " " + day;
    }

    static void note(long self, long song, long when) {
        Context context = Utils.getContext();
        if (context == null) return;
        SharedPreferences saved = store.apply(context);
        String key = key(self, song);
        if (saved.getLong(key, 0) != 0) return;
        saved.edit().putLong(key, when).apply();
        HookStatus.counted(FamilyNames.LYRICS, "song date noted");
    }

    static void forget(long self, long song) {
        Context context = Utils.getContext();
        if (context == null) return;
        store.apply(context).edit().remove(key(self, song)).apply();
    }

    /** When [song] went on [self]'s profile, or 0 when this phone didn't see it. */
    static long added(long self, long song) {
        if (song == 0) return 0;
        Context context = Utils.getContext();
        if (context == null) return 0;
        return store.apply(context).getLong(key(self, song), 0);
    }

    private static String key(long self, long song) {
        return self + ":" + song;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.LYRICS);
        try {
            return Utils.settingsReady() && Settings.SONG_DATES.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LYRICS, "switch", failure);
            return false;
        }
    }

    /** Telegram's own artist. Replaced when patching. */
    public static String musicAuthor(Object message, boolean unknown) { return null; }

    /**
     * The profile whose song list made [message], or 0 for a real message. Those rows have no
     * date and come from that profile. Replaced when patching.
     */
    public static long listedBy(Object message) { return 0; }

    /** The account [message] was loaded on. Replaced when patching. */
    public static int account(Object message) { return -1; }

    /** The id of the song's file, or 0. Replaced when patching. */
    public static long documentId(Object message) { return 0; }

    /** The id of the song a request adds or removes, or 0. Replaced when patching. */
    public static long savedId(Object request) { return 0; }

    /** Whether the request takes the song off the profile. Replaced when patching. */
    public static boolean unsaves(Object request) { return false; }

    /** Whether the request only moves the song in the list. Replaced when patching. */
    public static boolean moves(Object request) { return true; }

    /** The user id of [account], or 0. Replaced when patching. */
    public static long selfId(int account) { return 0; }
}
