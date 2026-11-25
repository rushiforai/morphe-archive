/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;
import androidx.annotation.Nullable;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import java.lang.reflect.Field;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * An API ID and hash typed into the app, for when Telegram turns down the one the app was patched with
 * (issues #107 and #111, discussions #105 and #109). The sign-in refusal from {@link SignInHelp} offers
 * Enter your API ID, which asks for both from my.telegram.org/apps, keeps them in a preferences file of
 * their own (never in a settings export or the diagnostic report) and restarts Telegram. Each
 * connection manager asks here first thing in its constructor, before it reads BuildVars.APP_ID for
 * the native layer, so from then on sign-in, the native connection and bot sign-in all use the saved
 * pair, and {@link #nativeVersion} makes the connection tell the server about the new ID. Without one
 * nothing changes, and Use registered Telegram API credentials works as before.
 * Remove puts back what the app was patched with. Pause leaves it alone: it's how the account signs in.
 */
public final class ApiCredentials {
    static final String PREFS = "hushtelegram_api_credentials";
    static final String ID_KEY = "api_id";
    static final String HASH_KEY = "api_hash";
    private static final Pattern DIGITS = Pattern.compile("[0-9]{1,10}");
    private static final Pattern HASH = Pattern.compile("[0-9a-f]{32}");

    /** Telegram's side. A test answers it itself. */
    interface Telegram {
        void set(int id, String hash) throws ReflectiveOperationException;
    }

    static final Telegram PATCHED = (id, hash) -> {
        Class<?> buildVars = BotSignIn.buildVars(ApiCredentials.class.getClassLoader());
        Field appId = HostNames.field(buildVars, "APP_ID");
        Field appHash = HostNames.field(buildVars, "APP_HASH");
        // R8 marks both final, since only BuildVars' initializer sets them. Every reader is a plain
        // static read, and ART lets an accessible final field change.
        appId.setAccessible(true);
        appHash.setAccessible(true);
        appId.setInt(null, id);
        appHash.set(null, hash);
    };

    static volatile Telegram telegram = PATCHED;

    /** Whether this process has put the saved pair in place, or found none. */
    static volatile boolean applied;

    /** The ID this process put in place, or 0 while Telegram signs in with the one it was patched with. */
    static volatile int appliedId;

    /** Spreads an ID over every bit of the build number. Odd, so no two IDs land on one number. */
    private static final int SPREAD = 0x9E3779B1;

    private ApiCredentials() {}

    /** A saved ID and hash. */
    static final class Pair {
        final int id;
        final String hash;

        Pair(int id, String hash) {
            this.id = id;
            this.hash = hash;
        }
    }

    /**
     * Hooked first thing in each connection manager's constructor, before it reads the API ID. The
     * first one puts the saved pair into BuildVars and the rest find it done. Without a context yet
     * there's nothing to read, so the next connection manager tries again.
     */
    public static void applySaved() {
        if (!applied) applyFrom(Utils.getContext());
    }

    /** Not an applySaved overload: the patch finds its hook by name. */
    static void applyFrom(@Nullable Context context) {
        if (applied || context == null) return;
        synchronized (ApiCredentials.class) {
            if (applied) return;
            try {
                Pair saved = read(prefs(context));
                if (saved != null) {
                    telegram.set(saved.id, saved.hash);
                    appliedId = saved.id;
                    Logger.printInfo(() -> "Signing in with the API ID typed into the app");
                }
            } catch (Throwable failure) {
                Logger.printException(() -> "Couldn't put the saved API ID in place", failure);
            }
            applied = true;
        }
    }

    /**
     * Hooked on the build number each connection manager hands init, after {@link #applySaved}. The
     * native connection sends the API ID to the server again only when that number differs from the
     * one it saved, and a server still holding the old ID turns sign-in down, so a saved pair in place
     * gets a number of its own. Telegram's own otherwise, and again once the pair is removed.
     */
    public static int nativeVersion(int stock) {
        int id = appliedId;
        return id == 0 ? stock : SessionDevice.fold(stock, id * SPREAD);
    }

    /** The saved pair, or null when there's none or what's there isn't a pair. */
    @Nullable
    static Pair read(SharedPreferences prefs) {
        String id = prefs.getString(ID_KEY, null);
        String hash = prefs.getString(HASH_KEY, null);
        if (!validId(id) || !validHash(hash)) return null;
        return new Pair(Integer.parseInt(id.trim()), normalHash(hash));
    }

    /** Whether a pair is saved on this phone. */
    public static boolean hasSaved(Context context) {
        return read(prefs(context)) != null;
    }

    /** Whether [text] is an API ID: a positive number that fits an int, spaces around it allowed. */
    public static boolean validId(@Nullable String text) {
        if (text == null) return false;
        String id = text.trim();
        if (!DIGITS.matcher(id).matches()) return false;
        long value = Long.parseLong(id);
        return value > 0 && value <= Integer.MAX_VALUE;
    }

    /** Whether [text] is an API hash: 32 hex digits, spaces around it and capitals allowed. */
    public static boolean validHash(@Nullable String text) {
        return text != null && HASH.matcher(normalHash(text)).matches();
    }

    static String normalHash(String text) {
        return text.trim().toLowerCase(Locale.ROOT);
    }

    /** Saves [id] and [hash], which the caller has checked. True once they're on disk. */
    public static boolean save(Context context, String id, String hash) {
        return prefs(context).edit().putString(ID_KEY, id.trim()).putString(HASH_KEY, normalHash(hash)).commit();
    }

    /** Takes the saved pair out. True once that's on disk. */
    public static boolean clear(Context context) {
        return prefs(context).edit().clear().commit();
    }

    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
