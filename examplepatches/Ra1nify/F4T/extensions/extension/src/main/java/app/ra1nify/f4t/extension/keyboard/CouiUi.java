package app.ra1nify.f4t.extension.keyboard;

import android.content.Context;
import android.content.Intent;
import android.util.AttributeSet;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Reflection bridge to the stock COUI preference widgets.
 *
 * The extension is compiled against the platform only, so every host widget is created by name here.
 * This keeps the F4T page on the official COUI layouts instead of drawing its own rows.
 */
final class CouiUi {
    private static final String TAG = "F4T";
    static final String PACKAGE_PREFIX = "com.coui.appcompat.preference.";

    private CouiUi() {
    }

    static Class<?> load(String descriptor) throws ClassNotFoundException {
        return Class.forName(descriptor);
    }

    /** Instantiates a COUI widget through its (Context) or (Context, AttributeSet) constructor. */
    static Object widget(Context context, String simpleName) {
        try {
            Class<?> clazz = load(PACKAGE_PREFIX + simpleName);
            Object widget;
            try {
                Constructor<?> ctor = clazz.getConstructor(Context.class);
                widget = ctor.newInstance(context);
            } catch (NoSuchMethodException ignored) {
                Constructor<?> ctor = clazz.getConstructor(Context.class, AttributeSet.class);
                widget = ctor.newInstance(context, null);
            }
            applyLayout(context, widget, simpleName);
            return widget;
        } catch (Throwable error) {
            Log.e(TAG, "could not create COUI widget " + simpleName, error);
            return null;
        }
    }

    /**
     * Programmatic COUI widgets do not get the stock style attributes, so the row layout and the switch
     * widget layout have to be applied explicitly. The values mirror the stock
     * {@code Preference.COUI.SwitchPreference} style.
     */
    private static void applyLayout(Context context, Object widget, String simpleName) {
        String packageName = context.getPackageName();
        int rowLayout = context.getResources().getIdentifier("coui_preference", "layout", packageName);
        if (rowLayout != 0) {
            set(widget, "setLayoutResource", rowLayout);
        }
        if (simpleName.contains("Switch")) {
            int switchLayout = context.getResources()
                    .getIdentifier("coui_preference_widget_switch", "layout", packageName);
            if (switchLayout != 0) {
                set(widget, "setWidgetLayoutResource", switchLayout);
            }
        }
    }

    static void set(Object target, String method, Object... args) {
        if (target == null) return;
        try {
            Method found = null;
            for (Method candidate : target.getClass().getMethods()) {
                if (!candidate.getName().equals(method) ||
                        candidate.getParameterTypes().length != args.length) {
                    continue;
                }
                if (matches(candidate.getParameterTypes(), args)) {
                    found = candidate;
                    break;
                }
            }
            if (found == null) {
                Log.w(TAG, "no " + method + " on " + target.getClass().getName());
                return;
            }
            found.setAccessible(true);
            found.invoke(target, args);
        } catch (Throwable error) {
            Log.e(TAG, "could not call " + method + " on " + target.getClass().getName(), error);
        }
    }

    private static boolean matches(Class<?>[] types, Object[] args) {
        for (int i = 0; i < types.length; i++) {
            Object arg = args[i];
            if (arg == null) continue;
            Class<?> type = types[i];
            if (type.isPrimitive()) {
                Class<?> boxed = boxedType(type);
                if (boxed == null || !boxed.isInstance(arg)) return false;
            } else if (!type.isAssignableFrom(arg.getClass())) {
                return false;
            }
        }
        return true;
    }

    private static Class<?> boxedType(Class<?> primitive) {
        if (primitive == int.class) return Integer.class;
        if (primitive == boolean.class) return Boolean.class;
        if (primitive == float.class) return Float.class;
        if (primitive == long.class) return Long.class;
        if (primitive == double.class) return Double.class;
        if (primitive == short.class) return Short.class;
        if (primitive == byte.class) return Byte.class;
        if (primitive == char.class) return Character.class;
        return null;
    }

    /** Adds a preference to a group/screen. */
    static void add(Object group, Object preference) {
        if (group == null || preference == null) return;
        for (Method method : group.getClass().getMethods()) {
            if (!method.getName().equals("addPreference") || method.getParameterTypes().length != 1) continue;
            try {
                method.invoke(group, preference);
                return;
            } catch (Throwable error) {
                Log.e(TAG, "addPreference failed", error);
                return;
            }
        }
    }

    /** Wires a preference click to opening another F4T page. */
    static void onClick(Object preference, String page) {
        if (preference == null) return;
        try {
            Class<?> listenerType = null;
            Method setter = null;
            for (Method method : preference.getClass().getMethods()) {
                if (method.getName().equals("setOnPreferenceClickListener") &&
                        method.getParameterTypes().length == 1) {
                    setter = method;
                    listenerType = method.getParameterTypes()[0];
                    break;
                }
            }
            if (setter == null || listenerType == null) {
                Log.w(TAG, "setOnPreferenceClickListener not found");
                return;
            }
            final Context context = (Context) preference.getClass()
                    .getMethod("getContext").invoke(preference);
            Object listener = Proxy.newProxyInstance(
                    listenerType.getClassLoader(),
                    new Class<?>[]{listenerType},
                    (proxy, method, args) -> {
                        if (method.getReturnType() == boolean.class) {
                            if (args != null && args.length == 1) openPage(context, page);
                            return true;
                        }
                        return defaultValue(method.getReturnType());
                    });
            setter.invoke(preference, listener);
        } catch (Throwable error) {
            Log.e(TAG, "could not wire click for " + page, error);
        }
    }

    /** Wires a switch change to the F4T preference store that the patch gates read. */
    static void onToggle(Context context, Object preference, String key) {
        if (preference == null || context == null || key == null) return;
        try {
            Class<?> listenerType = null;
            Method setter = null;
            for (Method method : preference.getClass().getMethods()) {
                if (method.getName().equals("setOnPreferenceChangeListener") &&
                        method.getParameterTypes().length == 1) {
                    setter = method;
                    listenerType = method.getParameterTypes()[0];
                    break;
                }
            }
            if (setter == null || listenerType == null) {
                Log.w(TAG, "setOnPreferenceChangeListener not found");
                return;
            }
            final Context appContext = context.getApplicationContext() == null
                    ? context : context.getApplicationContext();
            Object listener = Proxy.newProxyInstance(
                    listenerType.getClassLoader(),
                    new Class<?>[]{listenerType},
                    (proxy, method, args) -> {
                        if (method.getName().equals("onPreferenceChange")
                                && args != null && args.length == 2 && args[1] instanceof Boolean) {
                            FeatureSwitches.setValue(appContext, key, args[1]);
                        }
                        return true;
                    });
            setter.invoke(preference, listener);
        } catch (Throwable error) {
            Log.e(TAG, "could not wire toggle for " + key, error);
        }
    }

    private static Object defaultValue(Class<?> type) {
        if (type == boolean.class) return Boolean.FALSE;
        if (type == int.class) return 0;
        if (type == long.class) return 0L;
        if (type == float.class) return 0f;
        if (type == double.class) return 0d;
        if (type == short.class) return (short) 0;
        if (type == byte.class) return (byte) 0;
        if (type == char.class) return (char) 0;
        return null;
    }

    /** Mirrors any preference value change into the F4T preference store read by the patch gates. */
    static void mirror(Context context, Object preference, String key) {
        if (preference == null || context == null || key == null) return;
        try {
            Class<?> listenerType = null;
            Method setter = null;
            for (Method method : preference.getClass().getMethods()) {
                if (method.getName().equals("setOnPreferenceChangeListener") &&
                        method.getParameterTypes().length == 1) {
                    setter = method;
                    listenerType = method.getParameterTypes()[0];
                    break;
                }
            }
            if (setter == null || listenerType == null) return;
            final Context appContext = context.getApplicationContext() == null
                    ? context : context.getApplicationContext();
            Object listener = Proxy.newProxyInstance(
                    listenerType.getClassLoader(),
                    new Class<?>[]{listenerType},
                    (proxy, method, args) -> {
                        if (method.getReturnType() == boolean.class) {
                            if (args != null && args.length == 2) {
                                FeatureSwitches.setValue(appContext, key, args[1]);
                            }
                            return true;
                        }
                        return defaultValue(method.getReturnType());
                    });
            setter.invoke(preference, listener);
        } catch (Throwable error) {
            Log.e(TAG, "could not mirror " + key, error);
        }
    }

    /** Opens a F4T page; inside the F4T activity this switches page in place. */
    static void openPage(Context context, String page) {
        try {
            if (context instanceof F4TSettingsActivity) {
                ((F4TSettingsActivity) context).openPage(page);
                return;
            }
            Intent intent = new Intent();
            intent.setClassName(context.getPackageName(),
                    "app.ra1nify.f4t.extension.keyboard.F4TSettingsActivity");
            intent.putExtra(SettingsHost.EXTRA_PAGE, page);
            if (!(context instanceof android.app.Activity)) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            context.startActivity(intent);
        } catch (Throwable error) {
            Log.e(TAG, "could not open page " + page, error);
        }
    }
}
