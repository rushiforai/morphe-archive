/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.font;

import android.graphics.Typeface;
import android.os.Build;

import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * Swaps TikTok's own text font for the device's system font (issue #7).
 *
 * <p>TikTok draws its interface text in a bundled family, TikTok Sans, built by one font engine
 * (its two implementations on 46.2.3 are {@code LX/0Wa3} and {@code LX/0Wa4}). Every text
 * typeface the app asks for is produced by that engine's two methods, the variable-font builder
 * and the static asset loader, and this stands at their exit. The engine handles only the
 * TikTok text and display fonts, so the icon glyph fonts, the gift combo font and the
 * mention/hashtag font, which load through other paths, are left alone.
 *
 * <p>The device font is returned at the same weight and slant the engine built, so bold stays
 * bold. The weight is read back from the typeface the engine produced rather than trusted from a
 * parameter, so a build that reshuffles the engine cannot feed a stale register in.
 */
public final class SystemFont {
    private static final String HOOK_FAMILY = "system font";

    private SystemFont() {}

    /**
     * The device font at {@code original}'s weight and slant when the switch is on, otherwise
     * {@code original} unchanged. Null passes through, which is the engine's own "no typeface"
     * answer.
     */
    public static Typeface systemize(Typeface original) {
        boolean on = Settings.SYSTEM_FONT.get();
        // Reported whichever way the switch is set, so an export separates "patch not present"
        // from "present and off" from "present and swapping".
        HookStatus.bound(HOOK_FAMILY, on ? "system" : "tiktok");
        if (!on || original == null) return original;
        try {
            if (Build.VERSION.SDK_INT >= 28) {
                return Typeface.create(Typeface.DEFAULT, original.getWeight(), original.isItalic());
            }
            return Typeface.create(Typeface.DEFAULT, original.getStyle());
        } catch (Throwable failure) {
            HookStatus.threw(HOOK_FAMILY, "systemize", failure);
            return original;
        }
    }
}
