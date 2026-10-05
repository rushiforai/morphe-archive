/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */
package app.morphe.extension.instagram.settings;

import android.app.Activity;

import app.morphe.extension.crimera.settings.SettingsHost;
import app.morphe.extension.crimera.theme.PikoTheme;
import app.morphe.extension.crimera.theme.SchemeSettingsTheme;
import app.morphe.extension.instagram.utils.InstagramLogger;

/** Binds the shared settings system to Instagram: its logger, string prefix and theme. */
public final class InstagramSettingsHost {
    private static final String STRING_PREFIX = "piko_ig_";
    private static final String BACKUP_FILE_PREFIX = "piko_ig_settings_";

    private static final SchemeSettingsTheme THEME = SchemeSettingsTheme.builder()
            .hostTheme(InstagramSettingsHost::applyHostTheme)
            .build();

    private InstagramSettingsHost() {
    }

    /**
     * Injection point: the patch calls this from the application init hook, before
     * {@code SettingsRegistry.load()}. Safe to call more than once.
     */
    public static void install() {
        SettingsHost.install(SettingsHost.builder(InstagramLogger.logger(), STRING_PREFIX)
                .backupFilePrefix(BACKUP_FILE_PREFIX)
                .build());
    }

    /**
     * The settings screen has its own palette, but the download sheet installs Instagram's theme
     * globally, so the settings activity claims the shared theme each time it opens.
     */
    static void installTheme() {
        PikoTheme.install(THEME);
    }

    /** Instagram's own themes cannot style a plain activity, so follow the system dark mode. */
    private static void applyHostTheme(Activity activity) {
        activity.setTheme(SchemeSettingsTheme.isSystemDark(activity)
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar);
    }
}
