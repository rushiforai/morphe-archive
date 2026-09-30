package local.reddit.extension;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.preference.PreferenceCategory;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;

/** Standalone listing filter for Reddit Dev Platform app posts. */
public final class AppPostFilter {
    private static final String PREFS = "local.reddit.app_posts";
    private static final String HIDE = "hide_app_posts";
    private static volatile boolean enabled = true;
    private AppPostFilter() {}

    public static void initialize(Object screen, Resources resources) {
        try {
            Activity activity = (Activity) screen.getClass().getMethod("H3").invoke(screen);
            if (activity != null) enabled = activity.getApplicationContext()
                .getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(HIDE, true);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    @SuppressWarnings("deprecation")
    public static void addSetting(Object value) {
        if (!(value instanceof PreferenceScreen)) return;
        PreferenceScreen screen = (PreferenceScreen) value;
        if (screen.findPreference(HIDE) != null) return;
        Context screenContext = screen.getContext();
        Context context = screenContext.getApplicationContext();
        enabled = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(HIDE, true);
        PreferenceCategory category = new PreferenceCategory(screenContext);
        category.setTitle("Feed");
        screen.addPreference(category);
        SwitchPreference setting = new SwitchPreference(screenContext);
        setting.setKey(HIDE);
        setting.setTitle("Hide games in feed");
        setting.setSummary("Hide interactive Reddit app and game posts in newly loaded listings");
        setting.setPersistent(false);
        setting.setChecked(enabled);
        setting.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
            @Override public boolean onPreferenceChange(Preference preference, Object next) {
                enabled = (Boolean) next;
                context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putBoolean(HIDE, enabled).apply();
                return true;
            }
        });
        category.addPreference(setting);
    }

    public static List<?> filterListing(List<?> original) {
        if (!enabled || original == null || original.isEmpty()) return original;
        ArrayList<Object> kept = null;
        for (int i = 0; i < original.size(); i++) {
            Object item = original.get(i);
            Object link = findLink(item, 0, Collections.newSetFromMap(new IdentityHashMap<>()));
            if (link != null && isAppPost(link)) {
                if (kept == null) {
                    kept = new ArrayList<>(original.size());
                    kept.addAll(original.subList(0, i));
                }
            } else if (kept != null) kept.add(item);
        }
        return kept == null ? original : kept;
    }

    private static boolean isAppPost(Object link) {
        try {
            Method getter = link.getClass().getMethod("getIsDevPlatformCustomPost");
            return (Boolean) getter.invoke(link);
        } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    private static Object findLink(Object value, int depth, Set<Object> seen) {
        if (value == null || depth > 4 || !seen.add(value)) return null;
        if ("com.reddit.domain.model.Link".equals(value.getClass().getName())) return value;
        if (value instanceof Iterable<?>) {
            for (Object child : (Iterable<?>) value) {
                Object found = findLink(child, depth + 1, seen);
                if (found != null) return found;
            }
            return null;
        }
        String name = value.getClass().getName();
        if (name.startsWith("java.") || name.startsWith("android.") || name.startsWith("kotlin.")) return null;
        for (Class<?> type = value.getClass(); type != null && type != Object.class; type = type.getSuperclass())
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    Object found = findLink(field.get(value), depth + 1, seen);
                    if (found != null) return found;
                } catch (ReflectiveOperationException | RuntimeException ignored) { }
            }
        return null;
    }
}
