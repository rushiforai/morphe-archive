package app.immersivekeyboard.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Gives the keyboard a light theme and a dark theme that follow the system's dark mode. The
 * pair is chosen in the "Light & dark pair" card that {@link ThemePairMenu} adds to Gboard's
 * Themes screen; picking a theme in Gboard's own list also sets the current mode's half.
 * Until a mode has a theme of its own, an imported theme with the same name and the opposite
 * variant is used if there is one ("Glass Keys Light" and "Glass Keys Dark").
 */
@SuppressWarnings("unused")
public final class ThemeDarkMode {
    private static final String TAG = "ImmersiveKB";
    static final String THEME_PREFERENCE = "additional_keyboard_theme";
    static final String FILE_THEME_PREFIX = "files:";
    static final String USER_THEME_PREFIX = "user_theme_";
    private static final String KEY_BORDER_PREFERENCE = "enable_key_border";
    private static final String MEMORY = "immersive_keyboard_themes";
    private static final String ENABLED = "pair_enabled";
    private static final String LAST_MODE = "last_mode";
    static final String THEME_SUFFIX = "_theme";
    private static final String BORDER_SUFFIX = "_key_border";
    private static final long CHECK_INTERVAL_MS = 1500;

    private static final Map<String, ThemeInfo> CACHE = new HashMap<>();
    private static long lastCheck;
    private static int lastNightMode = -1;

    private ThemeDarkMode() {
    }

    /** Injection point. Called from InputView.dispatchDraw. */
    public static void check(View inputView) {
        try {
            Context context = inputView.getContext();
            int nightMode = context.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK;
            long now = SystemClock.uptimeMillis();
            if (nightMode == lastNightMode && now - lastCheck < CHECK_INTERVAL_MS) {
                return;
            }
            lastNightMode = nightMode;
            lastCheck = now;
            boolean light = nightMode != Configuration.UI_MODE_NIGHT_YES;
            apply(context, light, false);
            WallpaperSwitch.check(context, light);
        } catch (Throwable failure) {
            Log.w(TAG, "theme dark mode check failed", failure);
        }
    }

    static SharedPreferences gboardPreferences(Context context) {
        return context.createDeviceProtectedStorageContext().getSharedPreferences(
                context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
    }

    static SharedPreferences memory(Context context) {
        return context.createDeviceProtectedStorageContext()
                .getSharedPreferences(MEMORY, Context.MODE_PRIVATE);
    }

    static boolean isLight(Context context) {
        return (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) != Configuration.UI_MODE_NIGHT_YES;
    }

    static boolean enabled(Context context) {
        return memory(context).getBoolean(ENABLED, true);
    }

    static void setEnabled(Context context, boolean enabled) {
        memory(context).edit().putBoolean(ENABLED, enabled).apply();
        if (enabled) {
            applyNow(context);
        }
    }

    /** The theme chosen for light or dark mode, or null when there is none yet. */
    static String theme(Context context, boolean light) {
        return memory(context).getString((light ? "light" : "dark") + THEME_SUFFIX, null);
    }

    static void setTheme(Context context, boolean light, String theme) {
        String mode = light ? "light" : "dark";
        memory(context).edit()
                .putString(mode + THEME_SUFFIX, theme)
                .remove(mode + BORDER_SUFFIX)
                .apply();
    }

    /** Called when the system dark mode changes while the keyboard is hidden. */
    static void modeChanged(Context context, boolean light) {
        apply(context, light, false);
    }

    /** Selects the current mode's theme right away, for changes made in the menu. */
    static void applyNow(Context context) {
        apply(context, isLight(context), true);
    }

    private static void apply(Context context, boolean wantLight, boolean force) {
        if (!enabled(context)) {
            return;
        }
        SharedPreferences gboard = gboardPreferences(context);
        SharedPreferences memory = memory(context);
        String selected = gboard.getString(THEME_PREFERENCE, "");
        if (selected == null || selected.isEmpty()) {
            return;
        }
        String mode = wantLight ? "light" : "dark";
        String rememberedTheme = memory.getString(mode + THEME_SUFFIX, null);
        String lastMode = memory.getString(LAST_MODE, null);

        if (!force && mode.equals(lastMode)) {
            // Same mode as last time: whatever is selected now is this mode's choice.
            if (!selected.equals(rememberedTheme)) {
                remember(memory, mode, selected, gboard);
                Log.i(TAG, mode + " theme remembered: " + selected);
            }
            return;
        }

        // The mode changed since the keyboard was last shown.
        String next = null;
        boolean border = gboard.getBoolean(KEY_BORDER_PREFERENCE, false);
        if (rememberedTheme != null && exists(context, rememberedTheme)) {
            next = rememberedTheme;
            border = memory.getBoolean(mode + BORDER_SUFFIX, border);
        } else {
            // Nothing picked for this mode yet: fall back to an imported theme of the same name
            // with the opposite light or dark variant, such as "Glass Keys Dark" and "Light".
            next = pairedTheme(context, selected, wantLight);
        }
        SharedPreferences.Editor memoryEditor = memory.edit().putString(LAST_MODE, mode);
        if (next != null && !next.equals(selected)) {
            gboard.edit()
                    .putString(THEME_PREFERENCE, next)
                    .putBoolean(KEY_BORDER_PREFERENCE, border)
                    .apply();
            memoryEditor.putString(mode + THEME_SUFFIX, next)
                    .putBoolean(mode + BORDER_SUFFIX, border);
            Log.i(TAG, "switched to " + mode + " theme " + next);
        } else if (rememberedTheme == null) {
            memoryEditor.putString(mode + THEME_SUFFIX, selected)
                    .putBoolean(mode + BORDER_SUFFIX, border);
        }
        memoryEditor.apply();
    }

    private static void remember(SharedPreferences memory, String mode, String theme,
            SharedPreferences gboard) {
        memory.edit()
                .putString(mode + THEME_SUFFIX, theme)
                .putBoolean(mode + BORDER_SUFFIX,
                        gboard.getBoolean(KEY_BORDER_PREFERENCE, false))
                .putString(LAST_MODE, mode)
                .apply();
    }

    /** Built-in themes always exist; imported ones can be deleted. */
    static boolean exists(Context context, String theme) {
        if (!theme.startsWith(FILE_THEME_PREFIX)) {
            return true;
        }
        return new File(context.getFilesDir(), theme.substring(FILE_THEME_PREFIX.length()))
                .isFile();
    }

    private static String pairedTheme(Context context, String selected, boolean wantLight) {
        if (!selected.startsWith(FILE_THEME_PREFIX + USER_THEME_PREFIX)) {
            return null;
        }
        File[] files = context.getFilesDir().listFiles(
                (directory, name) -> name.startsWith(USER_THEME_PREFIX) && name.endsWith(".zip"));
        if (files == null) {
            return null;
        }
        String selectedName = selected.substring(FILE_THEME_PREFIX.length());
        ThemeInfo current = null;
        for (File file : files) {
            if (file.getName().equals(selectedName)) {
                current = info(file);
            }
        }
        if (current == null || current.light == wantLight || current.pairName.isEmpty()) {
            return null;
        }
        File best = null;
        for (File file : files) {
            ThemeInfo candidate = info(file);
            if (candidate != null && candidate.light == wantLight
                    && candidate.pairName.equals(current.pairName)
                    && (best == null || file.lastModified() > best.lastModified())) {
                best = file;
            }
        }
        return best == null ? null : FILE_THEME_PREFIX + best.getName();
    }

    static ThemeInfo info(File file) {
        String key = file.getName() + ":" + file.lastModified() + ":" + file.length();
        ThemeInfo cached = CACHE.get(key);
        if (cached != null) {
            return cached;
        }
        try (ZipFile zip = new ZipFile(file)) {
            ZipEntry entry = zip.getEntry("metadata.json");
            if (entry == null || entry.getSize() > 1024 * 1024) {
                return null;
            }
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            try (InputStream input = zip.getInputStream(entry)) {
                byte[] buffer = new byte[8192];
                int read;
                while ((read = input.read(buffer)) > 0 && bytes.size() < 1024 * 1024) {
                    bytes.write(buffer, 0, read);
                }
            }
            JSONObject metadata = new JSONObject(bytes.toString("UTF-8"));
            String name = metadata.optString("name", "");
            ThemeInfo info = new ThemeInfo(name, metadata.optBoolean("is_light_theme", false));
            CACHE.put(key, info);
            return info;
        } catch (Throwable failure) {
            return null;
        }
    }

    static final class ThemeInfo {
        final String name;
        final boolean light;
        /** The name without its light or dark word, shared by both variants. */
        final String pairName;

        ThemeInfo(String name, boolean light) {
            this.name = name;
            this.light = light;
            this.pairName = name.replaceAll("(?i)[\\s_-]*(dark|light|night|day)\\b", "")
                    .trim().toLowerCase(Locale.ROOT);
        }
    }
}
