/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.misc;

import android.content.Context;

import java.util.Locale;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.EarlySwitch;
import app.morphe.extension.pinedrama.settings.Settings;

/**
 * The switch in front of Keep the app language (#61).
 *
 * <p>Early in each start PineDrama compares the phone's language with the one it saw last time.
 * When a language was picked in PineDrama's own settings and it decides the phone's language
 * changed, it clears that pick from {@code key_language_sp_key} and follows the phone again. The
 * #61 reporter's TikTok came up in English after every reboot while its Language page still said
 * Italian, and their own build that skipped this reset stayed Italian. With the switch on the
 * reset returns before it clears anything. With it off, and while HushPine is paused, PineDrama's
 * reset runs as it ships.
 *
 * <p>The reset runs inside the application's attachBaseContext, before the settings context
 * exists and before ActivityThread has an application, so the switch is read from the saved file
 * through the context PineDrama hands the reset. PineDrama passes null there sometimes, and then the
 * process's application is tried.
 *
 * <p>Skipping the reset alone wasn't enough: the reporter's PineDrama still came up in English after
 * a reboot, with the language page and HushPine's settings in Italian. PineDrama's own strings come
 * from its reword table, which loads for whatever locale it sees early in the start, and that can
 * be the wrong one right after a boot. Their build that stayed Italian also put the picked
 * language back at the top of the application's onCreate, so the switch does that too: the
 * picked language becomes the process's default, PineDrama's own apply puts it on the app's
 * resources, and a reword table already loaded is switched to it, which also empties the cache
 * PineDrama answers strings from. Switching only a table loaded for another language wasn't enough:
 * when PineDrama's search service starts the process at boot, the table loads for the pick but the
 * cache fills with the phone's language first, and the UI stays in it (emulator, 2026-10-10).
 */
@SuppressWarnings("unused")
public final class AppLanguage {
    /** {@link Settings#KEEP_APP_LANGUAGE}'s key, for the read before the settings context. */
    static final String SWITCH_KEY = "keep_app_language";

    /** PineDrama's own language calls. A test puts a fake here. */
    interface Language {
        /** The language picked in PineDrama's settings, or null when it follows the phone. */
        Locale picked(Context context);

        /** Puts the picked language on the app's resources. */
        void apply(Context context);

        /** The language PineDrama's strings are loaded for, or null before they load. */
        Locale strings();

        /** Loads PineDrama's strings for a language. */
        void loadStrings(Locale locale);
    }

    static Language language = new Language() {
        @Override public Locale picked(Context context) {
            return pickedLocale(context);
        }

        @Override public void apply(Context context) {
            applyPickedLocale(context);
        }

        @Override public Locale strings() {
            return stringsLocale();
        }

        @Override public void loadStrings(Locale locale) {
            loadStringsFor(locale);
        }
    };

    private AppLanguage() {
    }

    /** True while PineDrama's language reset should leave the language picked in PineDrama alone. */
    public static boolean keepChosenLanguage(Context context) {
        return Utils.getContext() != null
                ? Settings.KEEP_APP_LANGUAGE.get() : EarlySwitch.isOn(context, SWITCH_KEY);
    }

    /** Called first thing in the application's onCreate, in every process. */
    public static void applyAtStart(Context context) {
        try {
            if (!keepChosenLanguage(context)) return;
            Locale picked = language.picked(context);
            Locale before = Locale.getDefault();
            Locale strings = language.strings();
            if (picked == null) {
                Logger.printInfo(() -> "Keep the app language: nothing picked in PineDrama, "
                        + before + " from the phone stays");
                return;
            }
            if (!picked.equals(before)) Locale.setDefault(picked);
            language.apply(context);
            // Loaded strings switch to the picked language even when they say they're in it.
            // PineDrama answers each string from a cache keyed by the string's id alone, and a
            // process its search or push service starts at boot fills that cache in the phone's
            // language before PineDrama applies the pick, so the UI came up in English with the
            // table saying Italian (emulator, 47.1.4, 2026-10-10). Only the switch empties the
            // cache; PineDrama's own apply leaves it. Before they load nothing is cached, and they
            // load for the default set above.
            if (strings != null) language.loadStrings(picked);
            Logger.printInfo(() -> "Keep the app language: put back " + picked + " (default was "
                    + before + ", strings " + strings + ")");
        } catch (Throwable error) {
            Logger.printException(() -> "Keep the app language: putting the language back failed", error);
        }
    }

    // The bodies below are PineDrama's calls, written in by the patch. Unpatched they do nothing.

    static Locale pickedLocale(Context context) {
        return null;
    }

    static void applyPickedLocale(Context context) {
    }

    static Locale stringsLocale() {
        return null;
    }

    static void loadStringsFor(Locale locale) {
    }
}
