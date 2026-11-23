package dev.jason.gboardpatches.extension.hiddenflags;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.lang.reflect.Method;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

/**
 * Applies the hidden-flag preferences through Gboard's own override path.
 *
 * <p>Gboard resolves a flag by name with {@code adfk.o(String)}, and writes a value for a
 * priority layer with {@code adfk.h(adiu.OVERRIDE)} (an {@code adgd} writer, method
 * {@code e(adfh, Object)}). Both are obfuscated but stable within one build; the patch bundle is
 * version-pinned, and every step fails closed.
 */
public final class GboardFlagOverrideRuntime {
    private static final String TAG = "GboardPatches";
    private static final String FLAG_ACCESS = "adfk";
    private static final String FLAG_OBJECT = "adfh";
    private static final String FLAG_PRIORITY = "adiu";
    private static final String PRIORITY_OVERRIDE = "OVERRIDE";

    private GboardFlagOverrideRuntime() {
    }

    /** Called once when the keyboard service starts. */
    public static void applyAtStartup(Context context) {
        if (context == null) {
            return;
        }
        try {
            SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(context);
            if (preferences == null) {
                return;
            }
            // The curated overrides start on. Reapply explicit Off choices after a restart.
            for (GboardHiddenFlagCatalog.Entry entry : GboardHiddenFlagCatalog.entries()) {
                applyOverride(entry.flagName,
                        Boolean.valueOf(GboardHiddenFlagSettings.readEnabled(
                                preferences, entry.flagName)));
            }
        } catch (Throwable failure) {
            log("Hidden flag override bootstrap failed", failure);
        }
    }

    /** Used by the settings screen so a toggle takes effect immediately. */
    public static boolean applyOne(Context context, String flagName, boolean enabled) {
        return applyOverride(flagName, Boolean.valueOf(enabled));
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static boolean applyOverride(String flagName, Object value) {
        if (flagName == null || !(value instanceof Boolean)) {
            return false;
        }
        try {
            ClassLoader loader = GboardFlagOverrideRuntime.class.getClassLoader();
            Class<?> flagAccess = Class.forName(FLAG_ACCESS, false, loader);
            Class<?> priority = Class.forName(FLAG_PRIORITY, false, loader);

            // The OVERRIDE writer (`adge`) stores values by flag name (`g(String, boolean)`);
            // resolving a bare name through `adfk.o` does not work because that parser only
            // accepts `name=value` expressions or $true/$false.
            Object override = Enum.valueOf((Class<Enum>) priority, PRIORITY_OVERRIDE);
            Method writerFactory = flagAccess.getDeclaredMethod("h", priority);
            writerFactory.setAccessible(true);
            Object writer = writerFactory.invoke(null, override);
            if (writer == null) {
                return false;
            }
            Method setBoolean = writer.getClass().getMethod("g", String.class, boolean.class);
            setBoolean.setAccessible(true);
            setBoolean.invoke(writer, flagName, ((Boolean) value).booleanValue());
            try {
                Log.i(TAG, "Hidden flag override applied: " + flagName + "=" + value);
            } catch (Throwable ignored) {
                // Logging cannot affect the keyboard.
            }
            return true;
        } catch (Throwable failure) {
            log("Hidden flag override failed for " + flagName, failure);
            return false;
        }
    }

    private static void log(String message, Throwable failure) {
        try {
            Log.w(TAG, message, failure);
        } catch (Throwable ignored) {
            // Logging cannot affect the keyboard.
        }
    }
}
