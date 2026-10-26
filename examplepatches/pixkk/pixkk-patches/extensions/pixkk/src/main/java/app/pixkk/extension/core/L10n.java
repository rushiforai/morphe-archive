package app.pixkk.extension.core;

import android.content.Context;

/** Text as written. The comment menu code asks for it through here. */
public final class L10n {
    private L10n() {
    }

    public static String t(String english) {
        return english;
    }

    public static String t(Context context, String english) {
        return english;
    }

    public static CharSequence t(Context context, CharSequence text) {
        return text;
    }
}
