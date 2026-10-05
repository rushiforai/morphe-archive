package app.template.extension;

import android.widget.TextView;

import app.template.extension.settings.Prefs;

import java.lang.reflect.Field;

/**
 * "Runtime as 1h 47m" — when the Mod-settings toggle is on, rewrites the film-page runtime line
 * from Letterboxd's "%d mins" to an hours-and-minutes form.
 *
 * <p>Called from the head of {@code FilmHeaderFragment.configureRuntime(Integer, FragmentFilmHeaderBinding)}.
 * If this returns true the patch does an early {@code return-void}, so the app's own formatting
 * never runs; on false (toggle off, no runtime, or anything unexpected) the app renders as usual.
 * The binding is passed as {@link Object} and its {@code runtimeView} field read by reflection —
 * the generated binding class isn't on the extension's compile path.
 */
public final class RuntimeFormat {

    private RuntimeFormat() {}

    public static boolean applyIfEnabled(Integer minutes, Object binding) {
        try {
            if (!Prefs.getBoolean(Prefs.KEY_RUNTIME_HHMM, true)) return false;
            if (minutes == null || minutes <= 0 || binding == null) return false;

            Field field = binding.getClass().getField("runtimeView");
            Object view = field.get(binding);
            if (!(view instanceof TextView)) return false;

            ((TextView) view).setText(format(minutes));
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** 107 → "1h 47m", 120 → "2h", 47 → "47m". */
    static String format(int minutes) {
        int hours = minutes / 60;
        int rest = minutes % 60;
        if (hours == 0) return rest + "m";
        if (rest == 0) return hours + "h";
        return hours + "h " + rest + "m";
    }
}
