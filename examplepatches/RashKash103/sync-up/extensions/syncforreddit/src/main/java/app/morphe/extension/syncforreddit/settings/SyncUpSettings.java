package app.morphe.extension.syncforreddit.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Reads the settings this bundle's patches add, from wherever Sync is keeping them.
 *
 * <p>Sync keeps a set for each account signed in, in a file named after that account, and points
 * its settings screens at it. Reading the file an app has by default finds nothing those screens
 * ever wrote, which is what once made every added setting look unset.
 *
 * @noinspection unused
 */
public final class SyncUpSettings {
    private SyncUpSettings() {}

    /** @return What the checkbox with this key is set to. */
    public static boolean flag(String key, boolean fallback) {
        SharedPreferences settings = store();
        if (settings == null) {
            return fallback;
        }
        try {
            return settings.getBoolean(key, fallback);
        } catch (ClassCastException ex) {
            // Written by something else under the same name; the default is the safer answer.
            Logger.printInfo(() -> "settings: could not read " + key + ": " + ex);
            return fallback;
        }
    }

    /**
     * A setting Sync stores as text even though it is a number, which is how its own list
     * settings are written.
     */
    public static int number(String key, int fallback) {
        SharedPreferences settings = store();
        if (settings == null) {
            return fallback;
        }
        try {
            String held = settings.getString(key, null);
            return held == null || held.isEmpty() ? fallback : Integer.parseInt(held.trim());
        } catch (Exception ex) {
            Logger.printInfo(() -> "settings: could not read " + key + ": " + ex);
            return fallback;
        }
    }

    /**
     * Held for as long as the app runs: the settings keep only a weak hold on a listener, and
     * one that is not kept anywhere is collected and stops being told anything.
     */
    private static final java.util.List<SharedPreferences.OnSharedPreferenceChangeListener>
            listening = new java.util.ArrayList<>();

    /**
     * Calls back when a setting whose name starts with this changes, so that something showing
     * it does not have to wait to be asked again.
     */
    public static void whenChanged(String prefix, Runnable what) {
        SharedPreferences settings = store();
        if (settings == null) {
            return;
        }
        try {
            SharedPreferences.OnSharedPreferenceChangeListener told = (changed, key) -> {
                if (key == null || !key.startsWith(prefix)) {
                    return;
                }
                Logger.printDebug(() -> "settings: " + key + " changed");
                what.run();
            };
            synchronized (listening) {
                listening.add(told);
            }
            settings.registerOnSharedPreferenceChangeListener(told);
            Logger.printDebug(() -> "settings: listening for " + prefix + "*");
        } catch (Exception ex) {
            Logger.printInfo(() -> "settings: could not listen for " + prefix + "*: " + ex);
        }
    }

    /** Says what each key was read as, and whether it was ever written. */
    public static void report(String what, String... keys) {
        SharedPreferences settings = store();
        if (settings == null) {
            Logger.printInfo(() -> what + ": no settings to read");
            return;
        }
        StringBuilder read = new StringBuilder();
        for (String key : keys) {
            Object held = settings.getAll().get(key);
            read.append(key).append('=').append(held == null ? "unset" : held).append(' ');
        }
        Logger.printDebug(() -> what + ": " + read + "in " + name());
    }

    /** Which settings file is in use, for as long as that is in question. */
    private static String name() {
        try {
            return t7.z.i() ? t7.z.a() : "the default";
        } catch (Throwable ex) {
            return "the default";
        }
    }

    /** @return Where Sync keeps the settings in use, which is a file per account. */
    public static SharedPreferences store() {
        Context context = Utils.getContext();
        if (context == null) {
            return null;
        }
        try {
            String named = null;
            try {
                if (t7.z.i()) {
                    named = t7.z.a();
                }
            } catch (Throwable ex) {
                // An older or newer Sync that keeps one set of settings for everyone.
                Logger.printInfo(() -> "settings: could not tell which are in use: " + ex);
            }
            return named == null || named.isEmpty()
                    ? PreferenceManager.getDefaultSharedPreferences(context)
                    : context.getSharedPreferences(named, Context.MODE_PRIVATE);
        } catch (Exception ex) {
            Logger.printInfo(() -> "settings: could not be reached: " + ex);
            return null;
        }
    }
}
