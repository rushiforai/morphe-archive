package app.pomee4.extension.commentswipe;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.LinkedHashSet;
import java.util.Set;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/**
 * "Comment swipe" row of the Reddit settings (General section, after the Morphe row), which opens
 * {@link SettingsActivity}. Reddit 2026.30.0+ (Compose settings).
 * <p>
 * The row is a copy of the "Privacy policy" row with another key, made the same way as the Morphe
 * row of the Morphe Patches. The copy uses the {@code patch_copyWithKey} method that the Morphe
 * settings patch adds to the row class, so this bundle does not add a second copy of it.
 */
@SuppressWarnings("unused")
public final class SettingsRow {
    private static final String ROW_KEY = "pomee4_comment_swipe_settings";
    private static final String PRIVACY_POLICY_ROW_KEY = "key_pref_privacy_policy";
    private static final String ROW_LABEL = "Swipe actions";
    private static final String ICON_DRAWABLE = "pomee4_comment_swipe_settings_icon";

    private static final Function2<Object, Object, Object> ICON = new IconComposable();

    private SettingsRow() {
    }

    /**
     * Injection point.
     *
     * @param rows All Compose settings rows of the app.
     * @return The rows and the comment swipe settings row.
     */
    public static Set<Object> addSettingRow(Set<Object> rows) {
        try {
            for (Object row : rows) {
                if (row == null) continue;
                Method getKey = findMethod(row.getClass(), "patch_getKey");
                if (getKey == null || !PRIVACY_POLICY_ROW_KEY.equals(getKey.invoke(row))) continue;

                Method copyWithKey = findMethod(row.getClass(), "patch_copyWithKey", String.class);
                if (copyWithKey == null) break;

                Set<Object> newRows = new LinkedHashSet<>(rows);
                newRows.add(copyWithKey.invoke(row, ROW_KEY));
                return newRows;
            }
            Logger.printException(() -> "Privacy policy settings row or Morphe row methods not found", null);
        } catch (Exception ex) {
            Logger.printException(() -> "addSettingRow failure", ex);
        }
        return rows;
    }

    /**
     * Injection point.
     *
     * @param key The key of a Compose settings row.
     * @return If the row is the comment swipe settings row.
     */
    public static boolean isSettingRow(String key) {
        return ROW_KEY.equals(key);
    }

    /**
     * Injection point.
     */
    public static String getSettingLabel() {
        return ROW_LABEL;
    }

    /**
     * Injection point.
     */
    public static Function2<Object, Object, Object> getSettingIconComposable() {
        return ICON;
    }

    /**
     * Injection point.
     *
     * @param original The original click handler of the row, which captures the Compose context.
     * @return A click handler that opens the comment swipe settings.
     */
    public static Function0<Object> getSettingOnClick(Function0<?> original) {
        final Context rowContext = findContext(original);

        // noinspection Convert2Lambda
        return new Function0<>() {
            @Override
            public Object invoke() {
                try {
                    Context context = rowContext != null ? rowContext : CommentSwipeActionsPatch.currentActivity();
                    if (context == null) return null;
                    Intent intent = new Intent(context, SettingsActivity.class);
                    if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    context.startActivity(intent);
                } catch (Exception ex) {
                    Logger.printException(() -> "Could not open the comment swipe settings", ex);
                }
                return null;
            }
        };
    }

    /**
     * Placeholder that is replaced during patching with a call to the icon composable of the app.
     * Not private, so the nested class calls it directly and not through a synthetic accessor.
     *
     * @param composer   Compose composer.
     * @param resourceId Vector drawable resource of the icon.
     */
    static void drawSettingIcon(Object composer, int resourceId) {
        // Replaced during patching.
    }

    static final class IconComposable implements Function2<Object, Object, Object> {
        private int iconResourceId = -1;

        @Override
        public Object invoke(Object composer, Object changed) {
            if (iconResourceId < 0) {
                Context context = CommentSwipeActionsPatch.currentActivity();
                if (context == null) return null;
                iconResourceId = context.getResources().getIdentifier(
                        ICON_DRAWABLE, "drawable", context.getPackageName());
            }
            if (iconResourceId != 0) {
                drawSettingIcon(composer, iconResourceId);
            }
            return null;
        }
    }

    private static Method findMethod(Class<?> type, String name, Class<?>... parameters) {
        try {
            return type.getMethod(name, parameters);
        } catch (NoSuchMethodException ex) {
            return null;
        }
    }

    /**
     * @return The Context captured by a Kotlin lambda, preferring its Activity, or null.
     */
    private static Context findContext(Object lambda) {
        if (lambda == null) return null;
        try {
            for (Field field : lambda.getClass().getDeclaredFields()) {
                if (field.getType().isPrimitive()) continue;
                field.setAccessible(true);
                Object value = field.get(lambda);
                if (value instanceof Context context) {
                    Context unwrapped = context;
                    while (unwrapped instanceof ContextWrapper wrapper && !(unwrapped instanceof Activity)) {
                        Context base = wrapper.getBaseContext();
                        if (base == null || base == unwrapped) break;
                        unwrapped = base;
                    }
                    return unwrapped instanceof Activity ? unwrapped : context;
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "findContext failure", ex);
        }
        return null;
    }
}
