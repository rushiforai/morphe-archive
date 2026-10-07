package local.reddit.extension;

import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;

/** Standalone filter for legacy listings and modern Dev Platform post cards. */
public final class AppPostFilter {
    private static final String PREFS = "local.reddit.app_posts";
    private static final String HIDE = "hide_app_posts";
    private static volatile boolean enabled = true;
    private AppPostFilter() {}

    /** Read saved settings before any feed is loaded, including the modern bottom bar. */
    public static void initialize(Context context) {
        enabled = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(HIDE, true);
    }

    @SuppressWarnings("deprecation")
    public static void addSetting(Object value) {
        if (!(value instanceof PreferenceScreen)) return;
        PreferenceScreen screen = (PreferenceScreen) value;
        if (screen.findPreference(HIDE) != null) return;
        Context screenContext = screen.getContext();
        Context context = screenContext.getApplicationContext();
        initialize(context);
        SwitchPreference setting = new SwitchPreference(screenContext);
        setting.setKey(HIDE);
        setting.setTitle("Hide apps in feed");
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
        for (int i = 0; i < screen.getPreferenceCount(); i++) {
            Preference category = screen.getPreference(i);
            if (category instanceof PreferenceGroup && category.getClass().getName().equals(
                    "app.morphe.extension.reddit.settings.preference.categories.AdsPreferenceCategory")) {
                ((PreferenceGroup) category).addPreference(setting);
                return;
            }
        }
        // The ads category is absent when the user did not select the upstream ads patch.
        setting.setOrder(0);
        screen.addPreference(setting);
    }

    /** Remove whole post cards, including cached/server-driven cards that never use Listing. */
    public static Object filterConverted(Object element, Object converted) {
        if (!enabled || element == null || converted == null) return converted;
        try {
            String type = element.getClass().getName();
            if ("ym1.u1".equals(type)) {
                // PostElement.o() is Reddit's flattened content list. Its own cache filter
                // identifies Devvit posts by this component, including crosspost content.
                Object content = element.getClass().getMethod("o").invoke(element);
                if (content instanceof Iterable<?>)
                    for (Object child : (Iterable<?>) content)
                        if (child != null && "com.reddit.devplatform.feed.custompost.b".equals(
                                child.getClass().getName())) return null;
            } else if ("ym1.z".equals(type)) {
                // Compact posts do not expose the media component. Their IndicatorsElement
                // records the Dev Platform privacy link instead (not the author badge).
                Object indicators = element.getClass().getField("o").get(element);
                if (indicators != null && "ym1.v0".equals(indicators.getClass().getName())
                        && indicators.getClass().getField("k").getBoolean(indicators)) return null;
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return converted;
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
