package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.MORPHE_LOADER;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.MORPHE_LOGO;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.getBoolean;

import android.annotation.SuppressLint;
import android.content.Context;

/**
 * Morphe's logo and loading animation in place of Reddit's, when the Morphe branding patch added them to the app. Each
 * load of a Reddit loader or Snoo resource ID passes through here; Reddit's stays until its switch is turned on.
 */
@SuppressWarnings("unused")
public final class Branding {

    private static volatile int loaderId = -1;
    private static volatile int logoId = -1;

    private Branding() {
    }

    /** Injection point: the loading animation to show in place of Reddit's {@code id}. */
    public static int loader(int id) {
        if (!getBoolean(MORPHE_LOADER)) return id;
        if (loaderId < 0) loaderId = resource("morphe_reddit_loader", "raw");
        return loaderId != 0 ? loaderId : id;
    }

    /** Injection point: the logo to show in place of Reddit's Snoo {@code id}. */
    public static int logo(int id) {
        if (!getBoolean(MORPHE_LOGO)) return id;
        if (logoId < 0) logoId = resource("morphe_reddit_logo", "drawable");
        return logoId != 0 ? logoId : id;
    }

    /** Whether the app holds Morphe's branding files, which only the Morphe branding patch adds. */
    static boolean available() {
        return resource("morphe_reddit_loader", "raw") != 0;
    }

    @SuppressLint({"PrivateApi", "DiscouragedApi"})
    private static int resource(String name, String type) {
        try {
            Context context = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (context == null) return -1;
            return context.getResources().getIdentifier(name, type, context.getPackageName());
        } catch (Exception ex) {
            return 0;
        }
    }
}
