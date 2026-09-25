package app.morphe.extension.tiktok.theme;

import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.preference.PreferenceManager;

import java.util.Locale;

/**
 * Small app-private persistence layer dedicated to the BlueIT Theme Engine.
 *
 * The generic Morphe Setting backend intentionally removes values equal to their default and the
 * legacy Android ListPreference may also persist the same key in a second preference file. That is
 * a bad fit for a patch-time seed: an explicitly selected "TikTok default" must still be remembered
 * so the patch default cannot re-apply on the next process start.
 *
 * This store therefore keeps the effective preset in its own app-private SharedPreferences file.
 * It does not migrate or replace the rest of Morphe's settings storage.
 */
@SuppressWarnings({"deprecation", "unused"})
public final class ThemeStateStore {
    private static final String FILE_NAME = "blueit_theme_engine_prefs";
    private static final String KEY_PRESET = "preset";
    private static final String LEGACY_KEY_PRESET = "blueit_theme_preset";

    private static volatile String cachedPreset;

    private ThemeStateStore() {}

    /** Resolves the effective preset and, in the main process, seeds the dedicated store once. */
    public static String initialize(Context context, String patchDefaultPreset) {
        return resolve(context, patchDefaultPreset, true);
    }

    /**
     * Returns the runtime preset without consuming a future non-default patch seed.
     *
     * This distinction matters while Android is inflating BlueIT settings: SettingsUi may ask for
     * colors before ThemeEngineBootstrap.initialize() has had a chance to supply the patch option.
     * In that case we temporarily report TikTok default but do not cache or persist it.
     */
    public static String currentPreset(Context context) {
        return resolve(context, "default", false);
    }

    /** Persists an explicit user choice, including the literal "default" choice. */
    public static void saveUserPreset(Context context, String preset) {
        String normalized = normalize(preset);
        cachedPreset = normalized;

        if (context != null && isMainAppProcess(context)) {
            try {
                context.getSharedPreferences(FILE_NAME, Context.MODE_PRIVATE)
                        .edit()
                        .putString(KEY_PRESET, normalized)
                        .commit();
            } catch (Throwable ignored) {
            }

            // Stop the framework ListPreference from competing with the dedicated Theme store.
            try {
                PreferenceManager.getDefaultSharedPreferences(context)
                        .edit()
                        .remove(LEGACY_KEY_PRESET)
                        .commit();
            } catch (Throwable ignored) {
            }
        }

        syncLegacySetting(normalized);
    }

    public static boolean isLiquidGlass(Context context) {
        return "liquid_glass".equals(currentPreset(context));
    }

    private static String resolve(Context context, String patchDefaultPreset, boolean allowPatchSeed) {
        String cached = cachedPreset;
        if (cached != null) {
            syncLegacySetting(cached);
            return cached;
        }

        synchronized (ThemeStateStore.class) {
            cached = cachedPreset;
            if (cached != null) {
                syncLegacySetting(cached);
                return cached;
            }

            String effective = null;
            SharedPreferences dedicated = null;
            try {
                if (context != null) {
                    dedicated = context.getSharedPreferences(FILE_NAME, Context.MODE_PRIVATE);
                    if (dedicated.contains(KEY_PRESET)) {
                        effective = normalize(dedicated.getString(KEY_PRESET, "default"));
                    }
                }
            } catch (Throwable ignored) {
            }

            // dev.7 used a persistent Android ListPreference as well as ThemeSettings. Prefer that
            // framework value when migrating because it may contain the user's latest explicit pick.
            if (effective == null && context != null) {
                try {
                    SharedPreferences framework = PreferenceManager.getDefaultSharedPreferences(context);
                    if (framework.contains(LEGACY_KEY_PRESET)) {
                        effective = normalize(framework.getString(LEGACY_KEY_PRESET, "default"));
                    }
                } catch (Throwable ignored) {
                }
            }

            if (effective == null) {
                try {
                    String legacy = normalize(ThemeSettings.PRESET.get());
                    if (!"default".equals(legacy)) {
                        effective = legacy;
                    }
                } catch (Throwable ignored) {
                }
            }

            // A read-only palette lookup must not turn "no value yet" into a persisted default.
            // Leave initialization pending so the later bootstrap/TUX call can still apply the
            // patcher's requested initial preset exactly once.
            if (effective == null && !allowPatchSeed) {
                return "default";
            }

            if (effective == null) {
                effective = normalize(patchDefaultPreset);
            }

            cachedPreset = effective;

            if (context != null && isMainAppProcess(context)) {
                try {
                    if (dedicated == null) {
                        dedicated = context.getSharedPreferences(FILE_NAME, Context.MODE_PRIVATE);
                    }
                    dedicated.edit().putString(KEY_PRESET, effective).commit();
                } catch (Throwable ignored) {
                }

                try {
                    PreferenceManager.getDefaultSharedPreferences(context)
                            .edit()
                            .remove(LEGACY_KEY_PRESET)
                            .commit();
                } catch (Throwable ignored) {
                }
            }

            syncLegacySetting(effective);
            return effective;
        }
    }

    private static void syncLegacySetting(String preset) {
        try {
            String normalized = normalize(preset);
            if (!normalized.equals(ThemeSettings.PRESET.get())) {
                ThemeSettings.PRESET.save(normalized);
            }
        } catch (Throwable ignored) {
            // The dedicated store remains the source of truth even if Morphe settings are not ready.
        }
    }

    private static boolean isMainAppProcess(Context context) {
        try {
            String expected = context.getApplicationInfo().processName;
            if (expected == null || expected.isEmpty()) expected = context.getPackageName();

            String current = null;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                current = Application.getProcessName();
            } else {
                ActivityManager manager =
                        (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
                if (manager != null) {
                    int pid = android.os.Process.myPid();
                    for (ActivityManager.RunningAppProcessInfo processInfo
                            : manager.getRunningAppProcesses()) {
                        if (processInfo.pid == pid) {
                            current = processInfo.processName;
                            break;
                        }
                    }
                }
            }
            return current == null || expected.equals(current);
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static String normalize(String preset) {
        if (preset == null) return "default";
        String value = preset.trim().toLowerCase(Locale.ROOT);
        switch (value) {
            case "material_you":
            case "material_you_amoled":
            case "oled_black":
            case "liquid_glass":
            case "frosted_graphite":
            case "midnight_neon":
            case "rose_noir":
            case "arctic_blue":
            case "aurora_violet":
            case "sunset_ember":
            case "custom":
            case "default":
                return value;
            default:
                return "default";
        }
    }
}
