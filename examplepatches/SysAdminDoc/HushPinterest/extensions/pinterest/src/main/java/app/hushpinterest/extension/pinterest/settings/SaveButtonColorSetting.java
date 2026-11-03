/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.graphics.Color;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Locale;

import app.hushpinterest.extension.shared.settings.StringSetting;

/**
 * The color the red Save button on a pin you open is painted, saved as "#RRGGBB", or empty for
 * Pinterest's own red. Whatever reaches it is cleaned first ({@link #clean}), so what's saved is
 * always a color or nothing.
 *
 * <p>It isn't a switch or a list, so it lives here rather than in {@link Settings}. A settings
 * file carries it beside the muted words ({@link SettingsBackup#TEXTS}).
 */
public final class SaveButtonColorSetting extends StringSetting {
    public static final SaveButtonColorSetting SAVE_BUTTON_COLOR =
            new SaveButtonColorSetting("hushpinterest_save_button_color");

    SaveButtonColorSetting(String key) {
        super(key, "");
    }

    @NonNull
    @Override
    protected String coerce(@NonNull String newValue) {
        String cleaned = clean(newValue);
        return cleaned == null ? "" : cleaned;
    }

    /**
     * [typed] as "#RRGGBB" in capitals: six hex digits, or three that each stand for a pair, with
     * or without the #. Empty for blank, null for anything else.
     */
    @Nullable
    public static String clean(@NonNull String typed) {
        String hex = typed.trim();
        if (hex.startsWith("#")) hex = hex.substring(1).trim();
        if (hex.isEmpty()) return typed.trim().isEmpty() ? "" : null;
        if (!hex.matches("[0-9A-Fa-f]{3}|[0-9A-Fa-f]{6}")) return null;
        if (hex.length() == 3) {
            hex = new String(new char[]{hex.charAt(0), hex.charAt(0), hex.charAt(1), hex.charAt(1),
                    hex.charAt(2), hex.charAt(2)});
        }
        return "#" + hex.toUpperCase(Locale.ROOT);
    }

    /** The color [saved] names, or null for Pinterest's own. */
    @Nullable
    public static Integer color(@NonNull String saved) {
        String cleaned = clean(saved);
        return cleaned == null || cleaned.isEmpty() ? null : Color.parseColor(cleaned);
    }
}
