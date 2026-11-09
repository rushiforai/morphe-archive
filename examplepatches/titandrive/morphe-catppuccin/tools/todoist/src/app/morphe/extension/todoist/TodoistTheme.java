package app.morphe.extension.todoist;

import android.app.Application;
import android.content.res.Resources;
import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import java.util.WeakHashMap;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.IdentityHashMap;

/** Applies the resource palette to Todoist's parallel Compose color model. */
public final class TodoistTheme {
    private static Application app;
    private static final java.util.Map<Integer,Object> palettes = new java.util.HashMap<>();
    private static boolean customActive;
    private static final WeakHashMap<Activity, String> appliedThemes = new WeakHashMap<>();
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static Activity resumed;
    private static boolean refreshQueued;
    private static Object currentTheme() {
        try {
            Class<?> manager = Class.forName("ffl");
            Object instance = app.getClass().getMethod("m", Class.class).invoke(app, manager);
            return manager.getMethod("c").invoke(instance);
        } catch (ReflectiveOperationException error) { throw new IllegalStateException("Todoist theme manager changed", error); }
    }
    private static String key(Object theme) {
        try { return (String) theme.getClass().getField("e").get(theme); }
        catch (ReflectiveOperationException error) { throw new IllegalStateException(error); }
    }
    private static void refreshIfNeeded() {
        if (resumed == null || refreshQueued) return;
        refreshQueued = true;
        main.post(() -> {
            try {
                Activity activity = resumed;
                if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
                String previous = appliedThemes.get(activity);
                String current = key(currentTheme());
                if (previous != null && !previous.equals(current)
                    && (previous.startsWith("catppuccin_") || current.startsWith("catppuccin_"))) {
                    appliedThemes.put(activity, current);
                    activity.recreate();
                }
            } finally { refreshQueued = false; }
        });
    }
    public static void install(Application application) {
        app = application;
        // Register before Todoist's native overlay callback so this captures the
        // theme actually used during creation, rather than a later Compose update.
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            public void onActivityCreated(Activity activity, Bundle state) { appliedThemes.put(activity, key(currentTheme())); }
            public void onActivityResumed(Activity activity) { resumed = activity; refreshIfNeeded(); }
            public void onActivityPaused(Activity activity) { if (resumed == activity) resumed = null; }
            public void onActivityDestroyed(Activity activity) { appliedThemes.remove(activity); }
            public void onActivityStarted(Activity activity) {}
            public void onActivityStopped(Activity activity) {}
            public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        });
    }
    public static int resource(String name, String kind) {
        if (app == null) throw new IllegalStateException("Todoist application has not initialized");
        Resources resources = app.getResources();
        int id = resources.getIdentifier(name, kind, "com.todoist");
        if (id == 0) id = resources.getIdentifier(name, kind, app.getPackageName());
        if (id == 0) throw new Resources.NotFoundException(name);
        return id;
    }
    public static synchronized Object customPalette(Object theme) {
        int id = TodoistIdentities.themeId(theme);
        if (id == 0) return null;
        if (palettes.containsKey(id)) return palettes.get(id);
        try {
            Object key = Class.forName("g77").getField(id == TodoistIdentities.LATTE ? "C" : "c").get(null);
            java.util.Map<?,?> stock = (java.util.Map<?,?>)Class.forName("f77").getField("a").get(null);
            Object model = cloneModel(stock.get(key));
            apply(model, id == TodoistIdentities.LATTE ? "catppuccin_latte_" : "catppuccin_macchiato_", model.getClass().getName());
            palettes.put(id, model);
            return model;
        } catch (ReflectiveOperationException error) { throw new IllegalStateException("Todoist color model changed", error); }
    }
    // Clone the immutable model instead of mutating Todoist's shared stock palettes.
    private static Object cloneModel(Object value) throws ReflectiveOperationException {
        Class<?> type = value.getClass();
        java.util.List<Field> longs = new java.util.ArrayList<>();
        java.util.List<Field> objects = new java.util.ArrayList<>();
        String text = value.toString(); int bracket = text.indexOf('(');
        String[] pairs = TodoistSchema.TOKENS.get(bracket < 0 ? "" : text.substring(0, bracket));
        if (pairs != null) for (String pair : pairs) longs.add(type.getField(pair.split(":")[0]));
        for (Field field : type.getFields()) if (!Modifier.isStatic(field.getModifiers()) && !field.getType().isPrimitive()) objects.add(field);
        for (java.lang.reflect.Constructor<?> constructor : type.getConstructors()) {
            Class<?>[] parameters = constructor.getParameterTypes();
            if (parameters.length != longs.size() + objects.size()) continue;
            Object[] args = new Object[parameters.length]; int index = 0;
            java.util.Set<Field> used = new java.util.HashSet<>();
            for (int i = 0; i < parameters.length; i++) {
                if (parameters[i] == long.class) args[i] = longs.get(index++).getLong(value);
                else {
                    Field found = null;
                    for (Field field : objects) if (!used.contains(field) && field.getType() == parameters[i]) { found = field; break; }
                    if (found == null) throw new ReflectiveOperationException("Palette constructor changed: " + type);
                    used.add(found); args[i] = cloneModel(found.get(value));
                }
            }
            return constructor.newInstance(args);
        }
        throw new ReflectiveOperationException("Palette constructor missing: " + type);
    }
    public static int nativeStyle(Object theme) {
        int id = TodoistIdentities.themeId(theme);
        if (id == 0) return 0;
        return resource(id == TodoistIdentities.LATTE ? "ThemeOverlay.Catppuccin.Latte" : "ThemeOverlay.Catppuccin.Macchiato", "style");
    }
    public static int previewStyle(Object identity) {
        int id = TodoistIdentities.id(identity);
        if (id == 0) return 0;
        return resource(id == TodoistIdentities.LATTE ? "ThemeOverlay.Catppuccin.Latte" : "ThemeOverlay.Catppuccin.Macchiato", "style");
    }
    public static void selectedTheme(Object theme) { customActive = TodoistIdentities.themeId(theme) != 0; refreshIfNeeded(); }
    public static int todayNumberColor(int original, int selectionFill) {
        return customActive ? selectionFill : original;
    }
    public static int navigationIcon(int original) {
        if (!customActive) return original;
        String name = app.getResources().getResourceEntryName(original);
        String outline = name.replace("ic_views_fill_tiles", "ic_views_outline_tiles")
            .replace("ic_inbox_fill_production", "ic_inbox_outline_production")
            .replace("ic_notifications_fill_default", "ic_notifications_outline_default")
            .replace("ic_calendar_plain_fill", "ic_calendar_plain_outline")
            .replace("ic_calendar_month_fill", "ic_calendar_month_outline")
            .replace("ic_workspace_fill", "ic_workspace_outline")
            .replace("ic_filter_fill", "ic_filter_small_outline").replace("ic_label_fill", "ic_label_outline");
        return name.equals(outline) ? original : resource(outline, "drawable");
    }
    private static void apply(Object value, String prefix, String root) throws ReflectiveOperationException {
        Class<?> type = value.getClass();
        String description = value.toString();
        int split = description.indexOf('(');
        String[] pairs = TodoistSchema.TOKENS.get(split < 0 ? "" : description.substring(0, split));
        if (pairs != null) for (String pair : pairs) {
            String[] parts = pair.split(":");
            String token = prefix + parts[1];
            Resources resources = app.getResources();
            int id = resource(token, "color");
            long color = ((long)resources.getColor(id, app.getTheme())) << 32;
            Field field = type.getField(parts[0]);
            field.setAccessible(true);
            field.setLong(value, color);
        }
        for (Field field : type.getFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
            if (field.getType().getName().startsWith(root + "$")) {
                Object nested = field.get(value);
                if (nested != null) apply(nested, prefix, root);
            }
        }
    }
}
