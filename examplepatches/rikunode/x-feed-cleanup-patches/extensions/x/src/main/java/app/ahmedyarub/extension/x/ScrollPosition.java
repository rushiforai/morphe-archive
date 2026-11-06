package app.ahmedyarub.extension.x;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Keeps the home timelines' scroll positions across launches.
 *
 * The app remembers where each timeline was scrolled to only while it runs, so after a restart it
 * opens at the top, where the first refresh then adds the newest posts. The positions are also
 * saved to preferences and used when the app has none.
 */
@SuppressWarnings("unused")
public final class ScrollPosition {

    private static final Set<String> HOME_TIMELINES =
            new HashSet<>(Arrays.asList("FOR_YOU", "FOLLOWING", "HOME_SUBSCRIBED", "RANKED_FOLLOWING"));

    private static final String PREFERENCES = "morphe_x_scroll";

    /** The scroll position holder class. Rewritten by the patch. */
    private static String holderClass() {
        return "";
    }

    private static SharedPreferences preferences() {
        return Utils.getContext().getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    /** The holder's two ints: the first visible item and its offset. */
    private static List<Field> intFields(Class<?> holder) {
        List<Field> fields = new ArrayList<>();
        for (Field field : holder.getDeclaredFields()) {
            if (field.getType() == int.class && !Modifier.isStatic(field.getModifiers())) {
                field.setAccessible(true);
                fields.add(field);
            }
        }
        return fields;
    }

    /** Called when the app remembers a timeline's scroll position. */
    public static void save(Object timeline, Object position) {
        try {
            String key = String.valueOf(timeline);
            if (!HOME_TIMELINES.contains(key) || position == null) return;

            List<Field> fields = intFields(position.getClass());
            if (fields.size() != 2) return;

            preferences().edit()
                    .putString(key, fields.get(0).getInt(position) + "," + fields.get(1).getInt(position))
                    .apply();
        } catch (Exception ex) {
            Logger.printException(() -> "Scroll position save failure", ex);
        }
    }

    /**
     * The position a timeline opens at: the app's own, or else the one saved before the app last
     * stopped. Null leaves the app to start at the top.
     */
    public static Object restore(Object timeline, Object position) {
        if (position != null) return position;

        try {
            String key = String.valueOf(timeline);
            if (!HOME_TIMELINES.contains(key)) return null;

            String saved = preferences().getString(key, null);
            if (saved == null) return null;

            String[] parts = saved.split(",");
            Constructor<?> constructor = Class.forName(holderClass()).getDeclaredConstructor(int.class, int.class);
            constructor.setAccessible(true);
            return constructor.newInstance(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]));
        } catch (Exception ex) {
            Logger.printException(() -> "Scroll position restore failure", ex);
            return null;
        }
    }
}
