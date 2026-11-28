/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

/** Colors available for the icon tint shown while Ghost mode is on. */
public enum GhostIndicatorColor {
    INSTAGRAM(0),
    YELLOW(0xFFFFD51A),
    BLUE(0xFF4D9FFF),
    PINK(0xFFFF66B3),
    ORANGE(0xFFFF8A32),
    CYAN(0xFF45D7E8),
    PURPLE(0xFFB17CFF);

    public final int color;

    GhostIndicatorColor(int color) {
        this.color = color;
    }
}
