package app.pomee4.extension.commentswipe;

import android.app.Activity;
import android.graphics.Color;
import android.view.ViewTreeObserver;
import android.widget.ListView;
import android.widget.TextView;

import java.lang.reflect.Method;

/**
 * The settings style of the Morphe Patches for Reddit 2026.25.0+ (RedditSettingsStyle), which draws the
 * settings like the Compose settings of Reddit, in the colors of the active Reddit theme. The class is
 * in the app when the Morphe Reddit patches are applied, so it is called by reflection, and the platform
 * style is kept if it is missing.
 */
final class MorpheStyle {
    private static final String STYLE_CLASS =
            "app.morphe.extension.reddit.settings.preference.RedditSettingsStyle";

    private static Class<?> styleClass;
    private static boolean looked;

    private MorpheStyle() {
    }

    private static Class<?> styleClass() {
        if (!looked) {
            looked = true;
            try {
                Class<?> type = Class.forName(STYLE_CLASS, true, MorpheStyle.class.getClassLoader());
                if ((boolean) type.getMethod("isModernStyle").invoke(null)) styleClass = type;
            } catch (Throwable ex) {
                Logger.printDebug(() -> "Morphe settings style not available: " + ex);
            }
        }
        return styleClass;
    }

    private static Object call(String name, Class<?>[] parameters, Object... arguments) throws Exception {
        Method method = styleClass().getMethod(name, parameters);
        return method.invoke(null, arguments);
    }

    /**
     * Loads the colors of the active Reddit theme.
     *
     * @param redditActivity An activity of Reddit, which has the Reddit theme.
     * @return If the Morphe style is used.
     */
    static boolean load(Activity redditActivity) {
        if (styleClass() == null) return false;
        try {
            call("loadThemeColors", new Class<?>[]{Activity.class}, redditActivity);
            return true;
        } catch (Throwable ex) {
            Logger.printException(() -> "loadThemeColors failure", ex);
            styleClass = null;
            return false;
        }
    }

    static int backgroundColor() {
        return color("getBackgroundColor", Color.BLACK);
    }

    static int titleColor() {
        return color("getTitleColor", Color.WHITE);
    }

    static int textColor() {
        return color("getTextColor", Color.WHITE);
    }

    static boolean isDark() {
        int color = backgroundColor();
        return (Color.red(color) * 299 + Color.green(color) * 587 + Color.blue(color) * 114) / 1000 < 128;
    }

    private static int color(String name, int fallback) {
        try {
            return (int) call(name, new Class<?>[0]);
        } catch (Throwable ex) {
            return fallback;
        }
    }

    static void styleToolbarTitle(TextView title) {
        try {
            call("styleToolbarTitle", new Class<?>[]{TextView.class}, title);
        } catch (Throwable ex) {
            Logger.printException(() -> "styleToolbarTitle failure", ex);
        }
    }

    /**
     * Styles the rows of the preference list: section headers, rows, carets and toggles.
     */
    static ViewTreeObserver.OnPreDrawListener styleList(ListView list) {
        try {
            return (ViewTreeObserver.OnPreDrawListener) call("styleList", new Class<?>[]{ListView.class}, list);
        } catch (Throwable ex) {
            Logger.printException(() -> "styleList failure", ex);
            return null;
        }
    }
}
