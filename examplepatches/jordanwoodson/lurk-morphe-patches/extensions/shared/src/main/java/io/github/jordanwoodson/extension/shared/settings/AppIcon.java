package io.github.jordanwoodson.extension.shared.settings;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;

import java.util.concurrent.Executor;

import io.github.jordanwoodson.extension.shared.Logger;

/**
 * The App icon choice of the Lurk icon patch. The patch moves the app's launcher entry (its MAIN/LAUNCHER intent
 * filter) from the launcher activity to two activity-aliases of it: {@link #LURK} with Lurk's icon, enabled in the
 * manifest, and {@link #ORIGINAL} with the app's own icon, disabled. Whenever the choice changes this enables the
 * chosen alias first and disables the other second, so the app is never left without a launcher entry; on every
 * start it does the same, which also repairs a state with both or neither enabled.
 *
 * <p>A root mount install keeps the original app's manifest, which has neither alias: the choice then does
 * nothing, and says so in the log. The choice isn't a switch, so Pause Lurk leaves it alone.
 */
public final class AppIcon {
    /** The choice's key, registered only when Lurk icon is included. Never renamed. */
    static final String KEY = "app_icon";
    /** The Original choice; Lurk's icon is "0", the default. */
    static final int ORIGINAL_CHOICE = 1;
    /** The aliases as the patch names them, outside the app's package so a clone has the same names. */
    static final String LURK = "io.github.jordanwoodson.extension.shared.settings.LurkIcon";
    static final String ORIGINAL = "io.github.jordanwoodson.extension.shared.settings.OriginalIcon";

    /** Where changes are applied: PackageManager calls are binder calls, kept off the main thread. */
    static Executor background = task -> new Thread(task, "lurk-app-icon").start();
    private static volatile boolean missingLogged;

    private AppIcon() {
    }

    /** A Lurk setting changed ({@code key} null: all of them, as after Reset to defaults). */
    static void changed(String key) {
        if (key != null && !KEY.equals(key)) return;
        Context context = Settings.appContext();
        if (context == null || !Settings.isRegistered(KEY)) return;
        background.execute(() -> {
            // Android drops the settings shortcut with the launcher entry it belonged to: publish it again.
            if (apply(context)) Settings.publishShortcut();
        });
    }

    /**
     * Makes the chosen alias the app's one launcher entry: enables it if it isn't, then disables the other if it
     * isn't. Called at every start and after the choice changes, never on the main thread. Whether it changed
     * anything.
     */
    static synchronized boolean apply(Context context) {
        if (context == null || !Settings.isRegistered(KEY)) return false;
        boolean original = Settings.getInt(KEY) == ORIGINAL_CHOICE;
        String packageName = context.getPackageName();
        ComponentName chosen = new ComponentName(packageName, original ? ORIGINAL : LURK);
        ComponentName other = new ComponentName(packageName, original ? LURK : ORIGINAL);
        try {
            PackageManager manager = context.getPackageManager();
            Boolean chosenState = enabled(manager, chosen);
            Boolean otherState = enabled(manager, other);
            if (chosenState == null || otherState == null) {
                // Once per process: it is the same at every start.
                if (!missingLogged) {
                    missingLogged = true;
                    Logger.w("app icon: the installed app has no Lurk launcher entries (a root mount install keeps "
                            + "the original manifest), so App icon does nothing");
                }
                return false;
            }
            boolean chosenOn = chosenState, otherOn = otherState;
            if (chosenOn && !otherOn) return false;
            if (!chosenOn) {
                manager.setComponentEnabledSetting(chosen, PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                        PackageManager.DONT_KILL_APP);
            }
            if (otherOn) {
                manager.setComponentEnabledSetting(other, PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                        PackageManager.DONT_KILL_APP);
            }
            Logger.i("app icon: the launcher shows " + (original ? "the app's own icon" : "Lurk's icon")
                    + (chosenOn == otherOn ? " (both entries were " + (chosenOn ? "enabled" : "disabled") + ")" : ""));
            return true;
        } catch (RuntimeException e) {
            Logger.w("app icon: couldn't change the launcher entry", e);
            return false;
        }
    }

    /**
     * Whether {@code component} is enabled: as last set at runtime, else as the manifest declares it. Null when
     * the installed manifest doesn't declare it.
     */
    private static Boolean enabled(PackageManager manager, ComponentName component) {
        ActivityInfo info;
        try {
            info = manager.getActivityInfo(component, PackageManager.MATCH_DISABLED_COMPONENTS);
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
        switch (manager.getComponentEnabledSetting(component)) {
            case PackageManager.COMPONENT_ENABLED_STATE_ENABLED:
                return true;
            case PackageManager.COMPONENT_ENABLED_STATE_DEFAULT:
                return info.enabled;
            default:
                return false;
        }
    }
}
