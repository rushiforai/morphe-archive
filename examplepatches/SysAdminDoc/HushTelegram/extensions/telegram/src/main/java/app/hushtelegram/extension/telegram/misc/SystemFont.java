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
 * which asks here first. Telegram 13.0's Wallet also builds a variable Roboto Mono itself, at the
 * weight it wants, and hands the result here. Digits, Instant View and rich-text faces keep
 * Telegram's own files, and so does Wallet's Gram face: it carries the Gram currency sign, which
 * no phone font has.
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
            // A font file of your own takes the medium, italic and bold files first (#79).
            Typeface own = CustomFont.forAsset(asset);
            if (own != null) {
                HookStatus.counted(FamilyNames.USE_SYSTEM_FONT, "font file used");
                return own;
            }
            Typeface typeface = forAsset(asset);
            if (typeface != null) HookStatus.counted(FamilyNames.USE_SYSTEM_FONT, "system font used");
            return typeface;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.USE_SYSTEM_FONT, "system font", failure);
            return null;
        }
    }

    /**
     * Asked after Telegram builds a face from one of its asset files itself rather than through
     * the loader above. Wallet does that for card numbers and amounts, with a weight it sets.
     *
     * @param asset the asset path the face was built from, such as fonts/rmono_var.ttf
     * @param built the face Telegram built
     * @return the phone's face for that file at the same weight and slant, or Telegram's own
     */
    public static Typeface built(String asset, Typeface built) {
        if (asset == null || built == null) return built;
        HookStatus.invoked(FamilyNames.USE_SYSTEM_FONT);
        try {
            if (!Utils.settingsReady() || !Settings.USE_SYSTEM_FONT.get()) return built;
            Typeface family = forAsset(asset);
            if (family == null) return built;
            Typeface typeface = Typeface.create(family, built.getWeight(), built.isItalic());
            HookStatus.counted(FamilyNames.USE_SYSTEM_FONT, "system font used");
            return typeface;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.USE_SYSTEM_FONT, "system font", failure);
            return built;
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
            // Wallet's variable Roboto Mono. The phone's monospace keeps the fixed-width columns
            // its card numbers rely on; the weight Wallet asked for comes from built().
            case "fonts/rmono_var.ttf":
                return Typeface.MONOSPACE;
            default:
                return null;
        }
    }
}
