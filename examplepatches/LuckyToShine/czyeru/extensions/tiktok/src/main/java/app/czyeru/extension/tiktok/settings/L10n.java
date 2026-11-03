/*
 * Adapted from Hushfeed (https://github.com/SysAdminDoc/hushfeed), GPL-3.0.
 */
package app.czyeru.extension.tiktok.settings;

import android.content.Context;

import java.util.Locale;

/**
 * English-only stand-in for Hushfeed's translation table, so code ported from Hushfeed keeps its
 * {@code L10n.t(...)} calls. The English text is shown as is.
 */
public final class L10n {
    private L10n() {
    }

    public static String t(String english) {
        return english;
    }

    public static CharSequence t(Context context, CharSequence text) {
        return text;
    }

    public static String t(Context context, String english) {
        return english;
    }

    public static String f(String english, Object... args) {
        return format(english, args);
    }

    public static String f(Context context, String english, Object... args) {
        return format(english, args);
    }

    public static String quantity(Context context, long count, String one, String other) {
        return quantity(context, count, one, other, count);
    }

    public static String quantity(Context context, long count, String one, String other, Object... args) {
        return format(count == 1 ? one : other, args);
    }

    private static String format(String text, Object... args) {
        try {
            return String.format(Locale.getDefault(), text, args);
        } catch (Throwable ignored) {
            return String.format(Locale.ROOT, text, args);
        }
    }
}
