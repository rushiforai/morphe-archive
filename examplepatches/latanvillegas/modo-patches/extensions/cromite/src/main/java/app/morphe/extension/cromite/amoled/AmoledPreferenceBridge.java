package app.morphe.extension.cromite.amoled;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Reflection bridge for the verified R8-renamed androidx.preference API in
 * Cromite 153.0.8010.37. No androidx.preference compile-time dependency.
 *
 * The patch injects install(Object) at the end of ThemeSettingsFragment.a2
 * and onClick(Object) into androidx.preference.Preference.z().
 */
public final class AmoledPreferenceBridge {
    private static final String KEY = "morphe_amoled_brightness";

    private AmoledPreferenceBridge() {}

    public static void install(Object fragment) {
        if (fragment == null) return;
        try {
            Method getContext = fragment.getClass().getMethod("getContext");
            Context context = (Context) getContext.invoke(fragment);
            if (context == null) return;

            Method getScreen = findMethod(fragment.getClass(), "Z1");
            Object screen = getScreen.invoke(fragment);
            if (screen == null) return;

            Method find = findMethod(fragment.getClass(), "Y1", CharSequence.class);
            if (find.invoke(fragment, KEY) != null) return;

            Class<?> preferenceClass = Class.forName("androidx.preference.Preference",
                    false, fragment.getClass().getClassLoader());
            Constructor<?> constructor = preferenceClass.getConstructor(Context.class);
            Object preference = constructor.newInstance(context);
            findMethod(preferenceClass, "R", String.class).invoke(preference, KEY);
            findMethod(preferenceClass, "a0", CharSequence.class)
                    .invoke(preference, "AMOLED y brillo");
            findMethod(preferenceClass, "X", CharSequence.class)
                    .invoke(preference, "Tema, brillo de ventana y luminancia web");

            findMethod(screen.getClass(), "f0", preferenceClass).invoke(screen, preference);
        } catch (ReflectiveOperationException | SecurityException error) {
            android.util.Log.e("MorpheCromite", "Could not install AMOLED preference", error);
        }
    }

    /**
     * Invoked from the empty base Preference.z() method. Only the unique
     * Morphe preference is handled; all other preference clicks are untouched.
     */
    public static void onClick(Object preference) {
        if (preference == null) return;
        try {
            if (!hasMorpheKey(preference)) return;
            Field contextField = findField(preference.getClass(), "r");
            Context context = (Context) contextField.get(preference);
            Activity activity = unwrapActivity(context);
            if (activity != null) AmoledBrightnessController.showSettings(activity);
        } catch (ReflectiveOperationException | SecurityException error) {
            android.util.Log.e("MorpheCromite", "Could not open AMOLED settings", error);
        }
    }

    /**
     * Avoid assuming a particular obfuscated backing-field name for the key.
     * R8 may rename Preference fields independently of method names.
     */
    private static boolean hasMorpheKey(Object preference) throws IllegalAccessException {
        for (Class<?> type = preference.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != String.class) continue;
                field.setAccessible(true);
                if (KEY.equals(field.get(preference))) return true;
            }
        }
        return false;
    }

    private static Activity unwrapActivity(Context context) {
        for (int depth = 0; context != null && depth < 16; depth++) {
            if (context instanceof Activity) return (Activity) context;
            if (!(context instanceof ContextWrapper)) return null;
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) return null;
            context = next;
        }
        return null;
    }

    private static Method findMethod(Class<?> type, String name, Class<?>... parameters)
            throws NoSuchMethodException {
        for (Class<?> cursor = type; cursor != null; cursor = cursor.getSuperclass()) {
            try {
                Method method = cursor.getDeclaredMethod(name, parameters);
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) {
                // The method may be inherited from a superclass.
            }
        }
        throw new NoSuchMethodException(type.getName() + "." + name);
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> cursor = type; cursor != null; cursor = cursor.getSuperclass()) {
            try {
                Field field = cursor.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                // The field may be declared by the base Preference class.
            }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }
}
