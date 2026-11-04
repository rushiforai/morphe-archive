package app.linkedin.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.view.View;

import java.util.Collections;

/**
 * LinkedIn's own settings screen is server driven, so the Loki Patches settings are reached through a
 * launcher shortcut: long press the LinkedIn icon, then "Loki Patches".
 */
@SuppressWarnings("unused")
public final class SettingsShortcut {
    private static final String ID = "michii_settings";
    private static boolean registered;

    private SettingsShortcut() {
    }

    /**
     * Called from LinkedIn's MainActivity.onCreate, which every launcher icon opens. This works on any
     * LinkedIn version, unlike the "Me" panel item, so the settings can always be reached.
     */
    public static void onMainActivityCreated(Activity activity) {
        registered = true;
        publish();
        try {
            View decor = activity.getWindow().getDecorView();
            // Wait until the screen is shown before opening the "What's new" dialog.
            decor.post(() -> {
                if (!activity.isFinishing()) WhatsNew.maybeShow(activity);
            });
            // LinkedIn publishes its own shortcuts during start up; publish again afterwards to stay on top.
            decor.postDelayed(SettingsShortcut::publish, 5000);
        } catch (Throwable t) {
            Diagnostics.error("onMainActivityCreated failed", t);
        }
    }

    /** Publishes the shortcut once per app start. */
    static void ensureRegistered() {
        if (registered) return;
        registered = true;
        publish();
    }

    /**
     * Adds or updates the shortcut as the first one. LinkedIn publishes four shortcuts of its own, and most
     * launchers show only four, so a shortcut added after them would be cut off.
     */
    static void publish() {
        try {
            Context context = Settings.app();
            if (context == null) return;
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return;

            Intent intent = new Intent(Intent.ACTION_VIEW)
                    .setClassName(context.getPackageName(), SettingsActivity.class.getName())
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            ShortcutInfo shortcut = new ShortcutInfo.Builder(context, ID)
                    .setShortLabel("Loki Patches")
                    .setLongLabel("Loki Patches")
                    .setIcon(Icon.createWithResource(context, context.getApplicationInfo().icon))
                    .setIntent(intent)
                    .setRank(0)
                    .build();
            // Updates the existing shortcut, which moves it back to the top if LinkedIn reordered its own.
            manager.addDynamicShortcuts(Collections.singletonList(shortcut));
            Diagnostics.debug("settings shortcut published");
        } catch (Throwable t) {
            Diagnostics.error("Shortcut registration failed", t);
        }
    }
}
