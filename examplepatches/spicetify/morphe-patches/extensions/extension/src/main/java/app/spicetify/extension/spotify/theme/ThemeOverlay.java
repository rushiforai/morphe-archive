package app.spicetify.extension.spotify.theme;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.loader.ResourcesLoader;
import android.content.res.loader.ResourcesProvider;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import app.spicetify.extension.spotify.settings.PatchSettings;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Overrides the theme patch's colour resources at runtime through one resource loader (Android 11+).
 * The loader is attached to the application and to every Activity; changing its provider updates all of them.
 */
public final class ThemeOverlay {
    private static final String TAG = "SpicetifyTheme";
    private static final String DIRECTORY = "spicetify-theme";
    // Same resource names as the theme patch's ThemeColors.kt.
    static final String[] BACKGROUND_NAMES = {"gray_7", "gray_10", "dark_base_background_base",
            "dark_base_background_elevated_base", "bg_gradient_end_color", "sthlm_blk"};
    static final String[] ACCENT_NAMES = {"dark_brightaccent_background_base", "dark_base_text_brightaccent", "green_light"};
    static final String PRESSED_ACCENT_NAME = "dark_brightaccent_background_press";

    /** Resource IDs for the overridden colours; index 0 of each group is read for the patched value. */
    static final class Ids {
        final int[] background;
        final int[] accent;
        final int pressedAccent;

        Ids(int[] background, int[] accent, int pressedAccent) {
            this.background = background;
            this.accent = accent;
            this.pressedAccent = pressedAccent;
        }
    }

    private static volatile Object loader;
    private static volatile Object provider;
    private static volatile Context context;
    private static volatile Ids ids;
    private static volatile int patchedBackground = 0xFF121212;
    private static volatile int patchedAccent = Color.rgb(30, 215, 96);

    private ThemeOverlay() {}

    public static boolean supported() {
        return Build.VERSION.SDK_INT >= 30;
    }

    /** True once the overlay is attached, so in-app colour changes can take effect. */
    public static boolean active() {
        return loader != null;
    }

    public static int patchedBackground() {
        return patchedBackground;
    }

    public static int patchedAccent() {
        return patchedAccent;
    }

    public static int background() {
        Integer saved = PatchSettings.themeBackground();
        return saved == null ? patchedBackground : saved;
    }

    public static int surface() {
        return EncorePalette.surface(PatchSettings.themeBackground(), PatchSettings.themeSurface());
    }

    public static int accent() {
        Integer saved = PatchSettings.themeAccent();
        return saved == null ? patchedAccent : saved;
    }

    /** Colours for the saved groups only; a group without a saved colour keeps each resource's own value. */
    static Map<Integer, Integer> colors(Ids ids, Integer background, Integer surface, Integer accent) {
        Map<Integer, Integer> colors = new LinkedHashMap<>();
        if (background != null || surface != null) {
            for (int id : ids.background) colors.put(id, EncorePalette.base(background));
            colors.put(ids.background[3], EncorePalette.elevated(background, surface));
        }
        if (accent != null) {
            for (int id : ids.accent) colors.put(id, accent);
            colors.put(ids.pressedAccent, EncorePalette.pressed(accent));
        }
        return colors;
    }

    /** Resolves the theme colours, attaches the loader, and applies any saved in-app colours. */
    public static void install(Application application) {
        if (Build.VERSION.SDK_INT < 30 || loader != null) return;
        try {
            Ids resolved = resolve(application);
            if (resolved == null) {
                Log.w(TAG, "Theme colour resources are missing; in-app colours are unavailable.");
                return;
            }
            attach(application, resolved, application.getColor(resolved.background[2]), application.getColor(resolved.accent[0]));
            refresh();
        } catch (RuntimeException error) {
            Log.e(TAG, "Could not attach theme colours", error);
        }
    }

    /** Applies the saved in-app colours, or the patched colours when none are saved; false when that failed. */
    public static boolean refresh() {
        if (Build.VERSION.SDK_INT < 30 || loader == null) return false;
        try {
            update();
            return true;
        } catch (IOException | RuntimeException error) {
            Log.e(TAG, "Could not apply theme colours", error);
            return false;
        }
    }

    private static Ids resolve(Context context) {
        int[] background = resolve(context, BACKGROUND_NAMES);
        int[] accent = resolve(context, ACCENT_NAMES);
        int[] pressed = resolve(context, new String[] {PRESSED_ACCENT_NAME});
        return background == null || accent == null || pressed == null ? null : new Ids(background, accent, pressed[0]);
    }

    private static int[] resolve(Context context, String[] names) {
        int[] resolved = new int[names.length];
        for (int i = 0; i < names.length; i++) {
            resolved[i] = context.getResources().getIdentifier(names[i], "color", context.getPackageName());
            if (resolved[i] == 0) return null;
        }
        return resolved;
    }

    @TargetApi(30)
    static void attach(Application application, Ids resolved, int background, int accent) {
        patchedBackground = background;
        patchedAccent = accent;
        ResourcesLoader created = new ResourcesLoader();
        application.getResources().addLoaders(created);
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityPreCreated(Activity activity, Bundle state) { activity.getResources().addLoaders(created); }
            @Override public void onActivityCreated(Activity activity, Bundle state) {}
            @Override public void onActivityStarted(Activity activity) {}
            @Override public void onActivityResumed(Activity activity) {}
            @Override public void onActivityPaused(Activity activity) {}
            @Override public void onActivityStopped(Activity activity) {}
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
            @Override public void onActivityDestroyed(Activity activity) {}
        });
        context = application;
        ids = resolved;
        loader = created;
    }

    @TargetApi(30)
    private static synchronized void update() throws IOException {
        ResourcesLoader current = (ResourcesLoader) loader;
        Integer background = PatchSettings.themeBackground();
        Integer surface = PatchSettings.themeSurface();
        Integer accent = PatchSettings.themeAccent();
        File directory = new File(context.getNoBackupFilesDir(), DIRECTORY);
        ResourcesProvider previous = (ResourcesProvider) provider;
        if (background == null && surface == null && accent == null) {
            current.clearProviders();
            provider = null;
            if (previous != null) previous.close();
            deleteTables(directory, null);
            return;
        }
        byte[] table = ColorTable.build(context.getPackageName(), typeNames(ids.pressedAccent), colors(ids, background, surface, accent));
        File file = new File(directory, String.format("colors-%08x.arsc", Arrays.hashCode(table)));
        if (!file.isFile()) write(directory, file, table);
        ResourcesProvider next;
        try (ParcelFileDescriptor descriptor = ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY)) {
            next = ResourcesProvider.loadFromTable(descriptor, null);
        }
        current.setProviders(List.of(next));
        provider = next;
        if (previous != null) previous.close();
        deleteTables(directory, file);
    }

    private static List<String> typeNames(int id) {
        int type = (id >>> 16) & 0xFF;
        List<String> names = new ArrayList<>();
        for (int i = 1; i < type; i++) names.add("type" + i);
        names.add("color");
        return names;
    }

    private static void write(File directory, File file, byte[] table) throws IOException {
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Cannot create " + directory);
        File temporary = File.createTempFile("colors-", ".tmp", directory);
        try (FileOutputStream output = new FileOutputStream(temporary)) {
            output.write(table);
        }
        if (!temporary.renameTo(file) && !file.isFile()) throw new IOException("Cannot write " + file);
        if (temporary.exists() && !temporary.delete()) Log.w(TAG, "Could not delete " + temporary);
    }

    private static void deleteTables(File directory, File keep) {
        File[] tables = directory.listFiles((dir, name) -> name.startsWith("colors-") && name.endsWith(".arsc"));
        if (tables == null) return;
        for (File table : tables) {
            if (!table.equals(keep) && !table.delete()) Log.w(TAG, "Could not delete " + table);
        }
    }

    /** Detaches the loader so tests start from an uninstalled overlay. */
    @TargetApi(30)
    static synchronized void detach() {
        if (loader == null) return;
        ((ResourcesLoader) loader).clearProviders();
        context.getResources().removeLoaders((ResourcesLoader) loader);
        if (provider != null) ((ResourcesProvider) provider).close();
        provider = null;
        loader = null;
    }
}
