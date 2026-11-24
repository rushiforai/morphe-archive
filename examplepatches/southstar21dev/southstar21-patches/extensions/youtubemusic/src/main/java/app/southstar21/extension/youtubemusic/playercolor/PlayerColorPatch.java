package app.southstar21.extension.youtubemusic.playercolor;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import app.southstar21.extension.youtubemusic.YouTubeMusicHooks;
import app.southstar21.extension.youtubemusic.settings.Settings;

/**
 * Disable dynamic player color: the full player's background stays one neutral color instead of
 * taking on each song's album art colors.
 * <p>
 * YouTube Music colors the player in one method of its player page controller, which takes the
 * two colors (top and bottom) and puts them on the page's gradient, the color that fades in while
 * swiping between songs, and the scrims. The patch calls {@link #color(int)} on both at its start.
 */
@SuppressWarnings("unused")
public final class PlayerColorPatch {
    /** The color choices, in the menu's order: YouTube Music's own default, black, dark grey. */
    public static final String[] COLOR_NAMES = {"YouTube Music", "Black", "Dark grey"};
    private static final int BLACK = Color.BLACK;
    private static final int DARK_GREY = 0xFF1C1C1E;

    /** The player page controller and the song's own colors, last time it colored the player. */
    private static WeakReference<Object> player = new WeakReference<>(null);
    private static int lastTop, lastBottom;
    private static boolean seen;
    private static Method colorMethod;
    private static int defaultColor;

    private PlayerColorPatch() {
    }

    /** The patch makes this return true. */
    public static boolean isIncluded() {
        return false;
    }

    /**
     * Called by the patch at the start of the method that colors the player, with the colors it
     * was given (the song's, or YouTube Music's default between songs).
     */
    public static void onColors(Object controller, int top, int bottom) {
        if (controller != player.get()) {
            player = new WeakReference<>(controller);
            colorMethod = null;
        }
        lastTop = top;
        lastBottom = bottom;
        seen = true;
    }

    /** Called by the patch on each of the two colors: the neutral color while the patch is on. */
    public static int color(int original) {
        try {
            if (!isIncluded() || !Settings.playerColorEnabled()) return original;
            return neutral();
        } catch (Throwable t) {
            Log.e(YouTubeMusicHooks.TAG, "Player color", t);
            return original;
        }
    }

    /** The chosen neutral color, opaque. */
    public static int neutral() {
        switch (Settings.playerColorChoice()) {
            case 1:
                return BLACK;
            case 2:
                return DARK_GREY;
            default:
                return youTubeMusicDefault();
        }
    }

    /**
     * YouTube Music's own background for the player between songs: its theme's
     * playerPageDefaultBackgroundColor, which is ytm_color_grey_12.
     */
    public static int youTubeMusicDefault() {
        if (defaultColor != 0) return defaultColor;
        Context context = Settings.context();
        if (context == null) return 0xFF030303;
        Resources res = context.getResources();
        // Resources keep the original package name even if the app was renamed (GmsCore support).
        int id = res.getIdentifier("ytm_color_grey_12", "color", "com.google.android.apps.youtube.music");
        if (id == 0) id = res.getIdentifier("ytm_color_grey_12", "color", context.getPackageName());
        defaultColor = id != 0 ? (res.getColor(id, context.getTheme()) | 0xFF000000) : 0xFF030303;
        return defaultColor;
    }

    /**
     * The setting changed: colors the player again right away, by running YouTube Music's own
     * method again with the last song's colors (which the patch then maps).
     */
    public static void reapply() {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Object controller = player.get();
                if (controller == null || !seen) return;
                Method method = colorMethod;
                if (method == null) {
                    method = findColorMethod(controller.getClass());
                    if (method == null) return;
                    colorMethod = method;
                }
                method.invoke(controller, lastTop, lastBottom, 250L);
            } catch (Throwable t) {
                Log.e(YouTubeMusicHooks.TAG, "Player color reapply", t);
            }
        });
    }

    /** The controller's only private (int, int, long) void method: the one the patch hooks. */
    private static Method findColorMethod(Class<?> type) {
        Method found = null;
        for (Method m : type.getDeclaredMethods()) {
            Class<?>[] p = m.getParameterTypes();
            if (m.getReturnType() == void.class && p.length == 3 && p[0] == int.class && p[1] == int.class
                    && p[2] == long.class && Modifier.isPrivate(m.getModifiers())) {
                if (found != null) return null; // More than one: don't guess.
                found = m;
            }
        }
        if (found != null) found.setAccessible(true);
        return found;
    }
}
