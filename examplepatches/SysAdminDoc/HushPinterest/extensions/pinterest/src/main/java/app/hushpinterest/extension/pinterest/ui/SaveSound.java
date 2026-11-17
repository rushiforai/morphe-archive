/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.net.Uri;

import androidx.annotation.Nullable;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.StringSetting;

/**
 * The sound Custom save sound plays (#41): a file picked in Android's file picker, kept by its
 * address along with the lasting read grant the picker hands over.
 *
 * <p>Both stay out of settings files. The address of a file picked on one phone means nothing on
 * another, and the grant to read it can't travel with it.
 */
public final class SaveSound {
    private SaveSound() {}

    /** The picked file's address, or empty for none. */
    public static final StringSetting PICKED = new StringSetting("hushpinterest_save_sound", "", false, false);

    /** The picked file's name as the picker showed it, for the settings row. */
    public static final StringSetting NAME = new StringSetting("hushpinterest_save_sound_name", "", false, false);

    /** The picked file, or null when there's none or the saved address can't be read. */
    @Nullable
    public static Uri picked() {
        try {
            String saved = PICKED.get();
            return saved == null || saved.isEmpty() ? null : Uri.parse(saved);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CUSTOM_SAVE_SOUND, "picked sound read", failure);
            return null;
        }
    }

    /** The picked file's name, or null when nothing is picked. */
    @Nullable
    public static String name() {
        if (picked() == null) return null;
        try {
            String saved = NAME.get();
            return saved == null || saved.isEmpty() ? null : saved;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CUSTOM_SAVE_SOUND, "picked sound name read", failure);
            return null;
        }
    }
}
