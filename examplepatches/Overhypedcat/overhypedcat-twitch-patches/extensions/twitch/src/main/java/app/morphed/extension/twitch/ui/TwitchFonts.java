package app.morphed.extension.twitch.ui;

import android.content.Context;
import android.graphics.Typeface;

/** Twitch's own fonts (Inter, as its React Native screens use), from the app's assets; the system's if missing. */
public final class TwitchFonts {
    private static Typeface regular, semiBold;

    private TwitchFonts() {
    }

    public static synchronized Typeface regular(Context context) {
        if (regular == null) regular = load(context, "fonts/Inter-Regular.otf", Typeface.DEFAULT);
        return regular;
    }

    public static synchronized Typeface semiBold(Context context) {
        if (semiBold == null) semiBold = load(context, "fonts/Inter-SemiBold.otf", Typeface.DEFAULT_BOLD);
        return semiBold;
    }

    private static Typeface load(Context context, String asset, Typeface fallback) {
        try {
            return Typeface.createFromAsset(context.getAssets(), asset);
        } catch (RuntimeException missing) {
            return fallback; // another app version without it: the system font still reads fine
        }
    }
}
