/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings;

import app.morphe.extension.crimera.settings.BooleanSetting;

/** The stored preferences the extension reads. piko sets them from its settings screen. */
public class Settings {
    public static final BooleanSetting SAVE_DELETED_MESSAGES = new BooleanSetting("save_deleted_messages", true);
    public static final BooleanSetting UNLIMITED_REPLAYS = new BooleanSetting("unlimited_replays", true);
    public static final BooleanSetting ENABLE_DOWNLOAD = new BooleanSetting("enable_download", true);
    public static final BooleanSetting ENABLE_DIRECT_DOWNLOAD = new BooleanSetting("enable_direct_download", false);
    public static final BooleanSetting DOWNLOAD_USERNAME_FOLDER = new BooleanSetting("download_username_folder", false);
}
