/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.graphics.Typeface;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram draws its regular text in the phone's font but loads bundled Roboto files for medium,
 * italic, extra bold, condensed and monospace text. Each of those loads goes through one method,
 * which asks here first. Digits, Instant View and rich-text faces keep Telegram's own files.
 *
 * <p>Telegram keeps the medium face it loaded first for the rest of the process, so a change shows
 * everywhere only after a restart.
 */
public final class SystemFont {
    private SystemFont() {}

    /**
     * Asked before Telegram loads a font from its assets.
     *
     * @param asset the asset path Telegram asked for, such as fonts/rmedium.ttf
     * @return the phone's own face for it, or null for Telegram's file
     */
    public static Typeface typeface(String asset) {
        if (asset == null) return null;
        HookStatus.invoked(FamilyNames.USE_SYSTEM_FONT);
        try {
            if (!Utils.settingsReady() || !Settings.USE_SYSTEM_FONT.get()) return null;
            Typeface typeface = forAsset(asset);
            if (typeface != null) HookStatus.counted(FamilyNames.USE_SYSTEM_FONT, "system font used");
            return typeface;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.USE_SYSTEM_FONT, "system font", failure);
            return null;
        }
    }

    /** The phone's face matching a bundled file's weight and style, or null for one this leaves alone. */
    static Typeface forAsset(String asset) {
        switch (asset) {
            case "fonts/rmedium.ttf":
                return Typeface.create(null, 500, false);
            case "fonts/rmediumitalic.ttf":
                return Typeface.create(null, 500, true);
            case "fonts/ritalic.ttf":
                return Typeface.create(null, 400, true);
            case "fonts/rextrabold.ttf":
                return Typeface.create(null, 800, false);
            case "fonts/rcondensedbold.ttf":
                return Typeface.create(Typeface.create("sans-serif-condensed", Typeface.NORMAL), 700, false);
            case "fonts/rmono.ttf":
                return Typeface.MONOSPACE;
            default:
                return null;
        }
    }
}
