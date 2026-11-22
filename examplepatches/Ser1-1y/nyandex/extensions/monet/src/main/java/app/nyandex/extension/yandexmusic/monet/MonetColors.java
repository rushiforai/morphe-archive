/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.extension.yandexmusic.monet;

import android.content.Context;
import android.os.Build;
import android.util.Log;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.Locale;

/**
 * Colors for the My Vibe buttons ("Встряхнуть Мою волну", "Добавить энергии", …).
 *
 * The server sends a color per button. Buttons of an artist keep it (it is derived from the
 * artist); every other button gets one of the Monet accent colors instead, chosen from the
 * button's animation so it stays the same between refreshes and differs between buttons.
 */
@SuppressWarnings("unused")
public final class MonetColors {
    private static final String TAG = "NyandexMonet";

    /** Bright tones of the three Material You accent palettes, readable on the black page. */
    private static final int[] ACCENTS = Build.VERSION.SDK_INT >= 31 ? new int[]{
            android.R.color.system_accent1_200,
            android.R.color.system_accent2_200,
            android.R.color.system_accent3_200,
            android.R.color.system_accent1_300,
            android.R.color.system_accent2_300,
            android.R.color.system_accent3_300,
            android.R.color.system_accent1_100,
            android.R.color.system_accent3_100,
    } : new int[0];

    private static volatile Context context;

    private MonetColors() {
    }

    /**
     * @param color The color the server sent for the button, as "#RRGGBB".
     * @param agent The button's agent DTO (animation, cover with color, entity).
     * @return The color to use.
     */
    public static String waveButtonColor(String color, Object agent) {
        try {
            if (color == null || agent == null || ACCENTS.length == 0) return color;
            if ("artist".equals(entityType(agent))) return color;

            Context current = context();
            if (current == null) return color;

            Object animation = jsonField(agent, "animationUri");
            String key = animation instanceof String ? (String) animation : color;
            int index = (key.hashCode() & 0x7fffffff) % ACCENTS.length;
            int argb = current.getColor(ACCENTS[index]);
            return String.format(Locale.US, "#%06X", argb & 0xFFFFFF);
        } catch (Throwable throwable) {
            Log.e(TAG, "Failed to pick a Monet color", throwable);
            return color;
        }
    }

    /** entity.type of the agent DTO; read through the Gson field names, as getters are renamed. */
    private static String entityType(Object agent) {
        Object entity = jsonField(agent, "entity");
        Object type = entity == null ? null : jsonField(entity, "type");
        return type instanceof String ? ((String) type).toLowerCase(Locale.ROOT) : null;
    }

    /** The value of the field annotated with {@code @SerializedName(name)}. */
    static Object jsonField(Object target, String name) {
        for (Class<?> type = target.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                for (Annotation annotation : field.getAnnotations()) {
                    if (!annotation.annotationType().getName().endsWith(".SerializedName")) continue;
                    try {
                        Object value = annotation.annotationType().getMethod("value").invoke(annotation);
                        if (name.equals(value)) {
                            field.setAccessible(true);
                            return field.get(target);
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
        }
        return null;
    }

    private static Context context() {
        Context current = context;
        if (current != null) return current;
        try {
            Object application = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (application instanceof Context) {
                current = ((Context) application).getApplicationContext();
                context = current;
            }
        } catch (Throwable throwable) {
            Log.e(TAG, "No application context", throwable);
        }
        return current;
    }
}
