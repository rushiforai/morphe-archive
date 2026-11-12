package app.spicetify.extension.spotify.theme;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.Map;

/** Loads the selected theme into Spotify's resources at startup, and applies new selections. */
public final class ThemeRuntime {
    private static final String TAG = "Spicetify";
    /** The role colors of the theme in use, for the screens Spicetify draws itself. */
    private static volatile Map<String, Integer> roles = Collections.emptyMap();

    private ThemeRuntime() {}

    /**
     * Themes need Android 11, which can lay more resources over Spotify's: an overlay Spotify registers
     * for itself from Android 14 ({@link ThemeOverlay}), a {@link ThemeTable} before it.
     */
    public static boolean supported() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.R;
    }

    /** The overlay needs Android 14 and a system overlay manager; the table stands in elsewhere. */
    private static boolean overlay(Context context) {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE && ThemeOverlay.isAvailable(context);
    }

    /** Injection point, from PatchSettings.initialize in SpotifyApplication.onCreate. */
    public static void install(Context context) {
        try {
            ThemeState.migrate(context);
            if (!supported()) return;
            Application application = (Application) context.getApplicationContext();
            boolean overlay = overlay(application);
            // A table from before an update to Android 14 has nothing left to do.
            if (overlay) ThemeTable.delete(application);
            addLoader(application.getResources(), overlay);
            application.registerActivityLifecycleCallbacks(new Callbacks(overlay));
            // Android deletes an app's own overlays when the app is installed again (Morphe found the
            // same), and the table follows the installed Spotify's resource IDs, so the saved theme is
            // registered on every start. Material You gets the current wallpaper colors this way too.
            Map<String, Integer> colors = roleColors(application, ThemeState.load(application));
            boolean image = ThemeBackground.hasImage(application);
            Map<String, Integer> values = values(colors, image);
            // Compose reads the values from memory, so at startup it follows the saved theme even if
            // the resources can't take it.
            follow(colors, values, image);
            load(application, values);
        } catch (Exception e) {
            Log.w(TAG, "Theme could not be loaded", e);
        }
    }

    /**
     * Applies and saves a selection without a background image, deleting the one in use. Returns false,
     * and changes and saves nothing, when it can't be applied.
     */
    public static boolean select(Context context, ThemeState.Selection selection) {
        return select(context, selection, null);
    }

    /**
     * Applies and saves a selection with the image to draw behind Spotify, or none: an image from
     * {@link ThemeBackground#fit}, at about screen size. Returns false, and changes and saves nothing,
     * when it can't be applied, or when the image isn't one Android can read.
     */
    public static boolean select(Context context, ThemeState.Selection selection, byte[] image) {
        try {
            // The role map is empty only when the theme patch didn't inject its table.
            if (!supported() || ThemeRoleMap.load().isEmpty()) return false;
            Map<String, Integer> colors = roleColors(context, selection);
            Map<String, Integer> values = values(colors, image != null);
            // The image is written first, so once the resources take the theme only a rename is left.
            File staged = image == null ? null : ThemeBackground.stage(context, image);
            try {
                // The resources first: when they can't take the theme, Compose keeps the current one.
                load(context, values);
                ThemeBackground.replace(context, staged);
            } finally {
                if (staged != null) staged.delete();
            }
            follow(colors, values, image != null);
            ThemeState.save(context, selection);
            return true;
        } catch (Exception e) {
            Log.w(TAG, "Theme could not be applied", e);
            return false;
        }
    }

    /** A role's color in the theme in use, or {@code stock} where the theme keeps Spotify's. */
    public static int color(String role, int stock) {
        Integer color = roles.get(role);
        return color == null ? stock : color;
    }

    /** A selection's role colors; none for Spotify's own colors. */
    public static Map<String, Integer> roleColors(Context context, ThemeState.Selection selection) {
        // A scheme was resolved when it was pasted.
        if (ThemeState.SCHEME.equals(selection.kind)) return selection.colors;
        return ThemeState.CUSTOM.equals(selection.kind)
                ? ThemeResolver.resolve(selection.colors, "button").colors
                : ThemePresets.colors(context, selection.kind);
    }

    /** One value for each color resource the role colors map, with the page background see-through behind an image. */
    private static Map<String, Integer> values(Map<String, Integer> colors, boolean image) {
        return ThemeRoleMap.overlayValues(ThemeRoleMap.load(), image ? ThemeResolver.seeThrough(colors) : colors);
    }

    /** Hands a theme to Compose, and its opaque colors to the screens Spicetify draws itself. */
    private static void follow(Map<String, Integer> colors, Map<String, Integer> values, boolean image) {
        roles = colors;
        ComposeTheme.update(values, image);
    }

    /** Lays a theme's values over Spotify's resources; none restore Spotify's own. */
    private static void load(Context context, Map<String, Integer> values) throws IOException {
        if (!overlay(context)) {
            ThemeTable.load(context, values);
        } else if (values.isEmpty()) {
            ThemeOverlay.unregister(context);
        } else {
            ThemeOverlay.register(context, values);
        }
    }

    /** Adds the overlay's loader, or the table's, to {@code resources}. */
    private static void addLoader(Resources resources, boolean overlay) {
        if (overlay) {
            ThemeOverlay.applyTo(resources);
        } else {
            ThemeTable.applyTo(resources);
        }
    }

    /**
     * Loads the theme into each activity's resources before any of its views exist, and draws the
     * background image after, once the activity's own onCreate can no longer overwrite it.
     */
    @TargetApi(Build.VERSION_CODES.Q)
    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        private final boolean overlay;

        Callbacks(boolean overlay) {
            this.overlay = overlay;
        }

        @Override
        public void onActivityPreCreated(Activity activity, Bundle state) {
            try {
                addLoader(activity.getResources(), overlay);
            } catch (RuntimeException e) {
                Log.w(TAG, "Theme could not be loaded into " + activity.getClass().getName(), e);
            }
        }

        @Override public void onActivityCreated(Activity activity, Bundle state) {}

        @Override
        public void onActivityPostCreated(Activity activity, Bundle state) {
            try {
                ThemeBackground.applyTo(activity);
            } catch (RuntimeException | OutOfMemoryError e) {
                // Without the image, Spotify draws its own background; never crash its start for it.
                Log.w(TAG, "Background could not be drawn in " + activity.getClass().getName(), e);
            }
        }

        @Override public void onActivityStarted(Activity activity) {}
        @Override public void onActivityResumed(Activity activity) {}
        @Override public void onActivityPaused(Activity activity) {}
        @Override public void onActivityStopped(Activity activity) {}
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        @Override public void onActivityDestroyed(Activity activity) {}
    }
}
