/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.utils;

import app.morphe.extension.crimera.sharedPreference.SharedPref;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsStatus;

/**
 * The extension's preferences. This bundle has no settings screen, so each reads its default
 * unless a previous piko install stored something else; the patches themselves are what users
 * choose between.
 */
public class Pref {
    public static boolean saveDeletedMessages() {
        return SharedPref.getBooleanPref(Settings.SAVE_DELETED_MESSAGES);
    }

    public static boolean makeEphemeralMediaPermanent() {
        return SharedPref.getBooleanPref(Settings.UNLIMITED_REPLAYS) && SettingsStatus.unlimitedReplaysOnEphemeralMedia;
    }

    public static boolean enableDownload() {
        return SharedPref.getBooleanPref(Settings.ENABLE_DOWNLOAD) && SettingsStatus.downloadMedia;
    }

    public static boolean enableDirectDownload() {
        return SharedPref.getBooleanPref(Settings.ENABLE_DIRECT_DOWNLOAD);
    }

    public static boolean downloadUsernameFolder() {
        return SharedPref.getBooleanPref(Settings.DOWNLOAD_USERNAME_FOLDER);
    }
}
