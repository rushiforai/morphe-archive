/*
 * The way this adds a row to Reddit's Compose settings follows Morphe Patches
 * (https://github.com/MorpheApp/morphe-patches), GPLv3. See its NOTICE file for the
 * GPLv3 Section 7 terms.
 */
package app.userinsights.extension;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Adds a "User Insights" row to Reddit's settings (Reddit 2026.30.0+), above the Morphe row.
 * The row is a copy of Reddit's "Privacy policy" row with another key; the patch changes its
 * title, icon, click action, section and order.
 *
 * Kotlin types are only referenced by the patched bytecode, never here, so the extension
 * builds without the Kotlin library.
 */
@SuppressWarnings("unused")
public final class RedditSettingsEntry {
    private static final String PRIVACY_POLICY_ROW_KEY = "key_pref_privacy_policy";
    static final String ROW_KEY = "key_pref_user_insights";
    private static final String TITLE = "User Insights";
    private static final String ICON_DRAWABLE = "user_insights_settings_icon";

    private static Class<?> rowClass;
    private static Field keyField;
    private static Object iconComposable;
    private static int iconResourceId = -1;

    private RedditSettingsEntry() {
    }

    /**
     * Injection point: start of the settings registry constructor.
     *
     * @param rows All Compose settings rows of the app.
     * @return The rows plus the User Insights row.
     */
    public static Set<Object> addRow(Set<Object> rows) {
        try {
            for (Object row : rows) {
                Field field = findKeyField(row, PRIVACY_POLICY_ROW_KEY);
                if (field == null) {
                    continue;
                }
                Object copy = copyObject(row);
                field.set(copy, ROW_KEY);
                rowClass = row.getClass();
                keyField = field;
                Set<Object> newRows = new LinkedHashSet<>(rows);
                newRows.add(copy);
                return newRows;
            }
            Log.w(UserInsights.TAG, "Privacy policy settings row not found");
        } catch (Throwable t) {
            Log.e(UserInsights.TAG, "addRow failed", t);
        }
        return rows;
    }

    /**
     * Injection point: settings row getters and content.
     *
     * @return If the row is the User Insights row.
     */
    public static boolean isEntryRow(Object row) {
        try {
            return row != null && keyField != null && row.getClass() == rowClass
                    && ROW_KEY.equals(keyField.get(row));
        } catch (Throwable t) {
            return false;
        }
    }

    /** Injection point. */
    public static String getTitle() {
        return TITLE;
    }

    /**
     * Injection point.
     *
     * @param original The original click handler (a Kotlin Function0).
     * @return A Kotlin Function0 that opens the User Insights settings.
     */
    public static Object getOnClick(Object original) {
        try {
            Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0", false,
                    RedditSettingsEntry.class.getClassLoader());
            return Proxy.newProxyInstance(function0.getClassLoader(), new Class<?>[]{function0},
                    new LambdaHandler(args -> {
                        Activity activity = UserInsights.currentActivity();
                        Context context = activity != null ? activity : UserInsights.app();
                        if (context != null) {
                            UserInsights.openSettings(context);
                        }
                    }));
        } catch (Throwable t) {
            Log.e(UserInsights.TAG, "getOnClick failed", t);
            return original;
        }
    }

    /**
     * Injection point.
     *
     * @param original The original leading icon (a Kotlin Function2).
     * @return A Kotlin Function2 that draws the User Insights icon.
     */
    public static Object getIcon(Object original) {
        try {
            if (iconComposable == null) {
                Class<?> function2 = Class.forName("kotlin.jvm.functions.Function2", false,
                        RedditSettingsEntry.class.getClassLoader());
                iconComposable = Proxy.newProxyInstance(function2.getClassLoader(), new Class<?>[]{function2},
                        new LambdaHandler(args -> {
                            if (iconResourceId < 0) {
                                Context context = UserInsights.app();
                                iconResourceId = context == null ? 0 : context.getResources().getIdentifier(
                                        ICON_DRAWABLE, "drawable", context.getPackageName());
                            }
                            if (iconResourceId != 0 && args != null && args.length > 0) {
                                drawIcon(args[0], iconResourceId);
                            }
                        }));
            }
            return iconComposable;
        } catch (Throwable t) {
            Log.e(UserInsights.TAG, "getIcon failed", t);
            return original;
        }
    }

    /**
     * Placeholder that is replaced during patching with a call to the icon composable of the app.
     * Not private, so the nested class calls it directly and not through a synthetic accessor.
     *
     * @param composer   Compose composer.
     * @param resourceId Vector drawable resource of the icon.
     */
    static void drawIcon(Object composer, int resourceId) {
        // Replaced during patching.
    }

    private static Field findKeyField(Object row, String value) throws IllegalAccessException {
        for (Class<?> type = row.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != String.class || Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                field.setAccessible(true);
                if (value.equals(field.get(row))) {
                    return field;
                }
            }
        }
        return null;
    }

    /** A shallow copy, made without a constructor call, of an object of any class. */
    private static Object copyObject(Object source) throws Exception {
        Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
        Field theUnsafe = unsafeClass.getDeclaredField("theUnsafe");
        theUnsafe.setAccessible(true);
        Object unsafe = theUnsafe.get(null);
        Method allocate = unsafeClass.getMethod("allocateInstance", Class.class);
        Object copy = allocate.invoke(unsafe, source.getClass());

        for (Class<?> type = source.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                field.setAccessible(true);
                field.set(copy, field.get(source));
            }
        }
        return copy;
    }

    private interface Body {
        void run(Object[] args);
    }

    /** Implements a Kotlin function interface; invoke() runs the body and returns null (Unit). */
    private static final class LambdaHandler implements InvocationHandler {
        private final Body body;

        LambdaHandler(Body body) {
            this.body = body;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            switch (method.getName()) {
                case "invoke":
                    try {
                        body.run(args);
                    } catch (Throwable t) {
                        Log.e(UserInsights.TAG, "Settings row action failed", t);
                    }
                    return null;
                case "equals":
                    return args != null && args.length == 1 && proxy == args[0];
                case "hashCode":
                    return System.identityHashCode(proxy);
                case "toString":
                    return "UserInsightsLambda";
                default:
                    return null;
            }
        }
    }
}
