/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25
 */
package app.morphe.extension.music.patches.utils;

public final class MusicLightShareGlyphs {
    private static final String ASSETS = "https://www.gstatic.com/youtube/img/messaging/192x192/";

    private MusicLightShareGlyphs() {
    }

    /** The first-party action PNGs carry their own paint; app target artwork does not use these sources. */
    public static String selectSource(String stock) {
        if (!MusicLightTheme.isEnabled() || stock == null) return stock;

        return switch (stock) {
            case ASSETS + "copy_paste_delhi_dark.png" -> ASSETS + "copy_paste_delhi_light.png";
            case ASSETS + "quick_share_delhi_dark.png" -> ASSETS + "quick_share_delhi_light.png";
            case ASSETS + "more_android_delhi_dark.png" -> ASSETS + "more_android_delhi_light.png";
            default -> stock;
        };
    }
}
