package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

import app.onlynazril.extension.tiktok.internal.Debug;

/**
 * Puts every switch back to its default.
 *
 * All the settings of this bundle live in one private prefs file, so a reset is a clear of that
 * file. The install-prompt marker is carried across: it only says that the setup prompt was shown,
 * and clearing it would ask for the same restart again without anything having changed.
 */
public final class SettingsReset {
    private static final String PREFS = "tiktokHandle_prefs";
    /** Mirrors RestartPrompt's key; it stays private there, so the name is repeated here. */
    private static final String KEY_INSTALL = "restart_prompt_install";

    private SettingsReset() {}

    public static void reset(Context ctx) {
        if (ctx == null) return;
        SharedPreferences prefs = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        boolean asked = prefs.contains(KEY_INSTALL);
        long installed = prefs.getLong(KEY_INSTALL, 0L);

        // commit, not apply: a restart follows this call and must not race the write.
        prefs.edit().clear().commit();
        if (asked) prefs.edit().putLong(KEY_INSTALL, installed).commit();
        Debug.print("settings: reset to defaults");
    }
}
