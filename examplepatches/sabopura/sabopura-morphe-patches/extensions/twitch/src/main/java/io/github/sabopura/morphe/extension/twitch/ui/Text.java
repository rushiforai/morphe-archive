package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;

import java.lang.ref.WeakReference;
import java.util.Locale;

import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;

/**
 * Japanese or English text. No string resources needed. The language is the one the viewer chose
 * in the settings, or else the one the app's screens use: the screens' configuration, not only the
 * device default, so a per-app language (Android 13+ "App languages") is followed too.
 */
public final class Text {
    /** The setting that picks the language, kept with the chat settings. */
    public static final String KEY = "ui_language";
    public static final String AUTO = "auto", JAPANESE = "ja", ENGLISH = "en";

    private static volatile WeakReference<Context> screen = new WeakReference<>(null);
    private static volatile String choice = AUTO;

    private Text() {
    }

    /**
     * Remembers a context of the screen being built, for its configured language, and reads the
     * language setting, so whatever is built next speaks the language chosen by then.
     */
    public static void use(Context context) {
        if (context == null) return;
        screen = new WeakReference<>(context);
        try {
            choice = ChatSettings.preferences(context).getString(KEY, AUTO);
        } catch (RuntimeException unreadable) {
            // A context too early to have storage: the choice read before stands.
        }
    }

    public static boolean japanese() {
        return japanese(choice, appLanguage());
    }

    /** The rule alone, for tests: a fixed choice wins, anything else follows the app's language. */
    static boolean japanese(String choice, String appLanguage) {
        if (JAPANESE.equals(choice)) return true;
        if (ENGLISH.equals(choice)) return false;
        return "ja".equals(appLanguage);
    }

    private static String appLanguage() {
        Context context = screen.get();
        if (context != null) {
            Configuration config = context.getResources().getConfiguration();
            Locale locale = Build.VERSION.SDK_INT >= 24 && !config.getLocales().isEmpty()
                    ? config.getLocales().get(0) : config.locale;
            if (locale != null) return locale.getLanguage();
        }
        return Locale.getDefault().getLanguage();
    }

    public static String label(String ja, String en) {
        return japanese() ? ja : en;
    }
}
