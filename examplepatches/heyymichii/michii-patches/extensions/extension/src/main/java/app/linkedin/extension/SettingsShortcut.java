package app.linkedin.extension;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.util.Log;

import java.util.Collections;

/**
 * LinkedIn's own settings screen is server driven, so the Michii Patches settings are reached through a
 * launcher shortcut: long press the LinkedIn icon, then "Michii Patches".
 */
final class SettingsShortcut {
    private static final String ID = "michii_settings";
    private static boolean registered;

    private SettingsShortcut() {
    }

    static void ensureRegistered() {
        if (registered) return;
        registered = true;
        try {
            Context context = Settings.app();
            if (context == null) return;
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            for (ShortcutInfo existing : manager.getDynamicShortcuts()) {
                if (ID.equals(existing.getId())) return;
            }

            Intent intent = new Intent(Intent.ACTION_VIEW)
                    .setClassName(context.getPackageName(), SettingsActivity.class.getName())
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            ShortcutInfo shortcut = new ShortcutInfo.Builder(context, ID)
                    .setShortLabel("Michii Patches")
                    .setLongLabel("Michii Patches")
                    .setIcon(Icon.createWithResource(context, context.getApplicationInfo().icon))
                    .setIntent(intent)
                    .build();
            manager.addDynamicShortcuts(Collections.singletonList(shortcut));
        } catch (Throwable t) {
            Log.e(Settings.TAG, "Shortcut registration failed", t);
        }
    }
}
