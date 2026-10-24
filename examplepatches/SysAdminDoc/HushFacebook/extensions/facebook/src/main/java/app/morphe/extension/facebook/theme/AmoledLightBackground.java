/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import androidx.annotation.Nullable;

import java.util.Locale;

import app.morphe.extension.shared.L10n;

/**
 * The rule for the Light background color row on Hushfacebook's Appearance page (issue #214): the
 * colour Facebook's light mode backgrounds take in place of its white, with AMOLED in the build. A
 * white background takes the colour, and a light grey one sits as far below it as the grey sits
 * below white, no lower than a grey button ({@link #fill}), so cards, comments and the composer keep
 * their steps. Facebook's light text and icons come back darkened toward black where they'd fall
 * under {@link AmoledTheme#TEXT_CONTRAST} on that button ({@link #held}). AmoledLightBackgroundTest
 * holds the rule to its numbers.
 *
 * <p>A blank row leaves Facebook's own light colours.
 */
public final class AmoledLightBackground {

    private AmoledLightBackground() {}

    private static final int WHITE = 0xFFFFFFFF;

    /** Facebook's text in light mode, its PRIMARY_TEXT token on 584. */
    private static final int LIGHT_MODE_TEXT = 0xFF080809;

    /** Facebook's secondary text in light mode, its SECONDARY_TEXT token on 584. */
    private static final int LIGHT_MODE_SECONDARY_TEXT = 0xFF65686C;

    /**
     * The darkest light grey Facebook puts text on: a grey button (SECONDARY_BUTTON_BACKGROUND),
     * below a comment's bubble and the composer's bar. Text keeps its contrast on this grey as the
     * row's colour moves it ({@link #textSurface}), and no grey the row moves goes below it
     * ({@link #fill}), so text keeps it on every one.
     */
    static final int TEXT_SURFACE_GREY = 0xFFE2E5E9;

    /**
     * The darkest the grey text sits on may go: there, secondary text darkened to
     * {@link AmoledTheme#TEXT_CONTRAST} could still stand {@link AmoledBackground#TEXT_HIERARCHY}
     * apart from Facebook's primary text, as the dark row keeps them apart. Darkening goes in whole
     * steps, so {@link #admitted} checks the step it lands on as well.
     */
    static final double FLOOR = AmoledBackground.TEXT_HIERARCHY * AmoledTheme.TEXT_CONTRAST
            * (TonePalette.luminance(LIGHT_MODE_TEXT) + 0.05) - 0.05;

    /** The darkest grey the rule takes, for {@link #problem}'s advice. */
    public static final String DARKEST_ADMITTED_GREY = "#A6A6A6";

    /**
     * The colour {@code text} asks for: the {@code #RRGGBB} given, {@code #FFRRGGBB} too, or white
     * when it's blank. Null for anything else: a colour that isn't opaque, or one too dark for
     * Facebook's light text to stay readable on what it makes ({@link #FLOOR}).
     */
    @Nullable
    public static Integer colour(@Nullable String text) {
        if (AmoledBackground.hex(text).isEmpty()) return WHITE;
        Integer colour = AmoledBackground.parsed(text);
        return colour != null && admitted(colour) ? colour : null;
    }

    /**
     * {@code text} as the row keeps it: blank, or the colour as {@code #RRGGBB} in capitals. Null
     * when {@link #colour} refuses it.
     */
    @Nullable
    public static String stored(@Nullable String text) {
        if (AmoledBackground.hex(text).isEmpty()) return "";
        Integer colour = colour(text);
        return colour == null ? null : String.format(Locale.ROOT, "#%06X", colour & 0xFFFFFF);
    }

    /**
     * Why the row refuses {@code text}, in words the person typing can act on, or null when it's
     * taken. A blank row is taken.
     */
    @Nullable
    public static String problem(@Nullable String text) {
        String hex = AmoledBackground.hex(text);
        if (hex.isEmpty()) return null;
        String shown = L10n.isolate(text.trim());
        if (!AmoledBackground.looksLikeAColour(hex)) {
            return L10n.f("\"%1$s\" isn't a color. Type a six-digit color code (#RRGGBB), like #FFF8E7, or leave it blank "
                    + "for Facebook's own white.", shown);
        }
        if (AmoledBackground.parsed(text) == null) {
            return L10n.f("%1$s is see-through. Type a solid six-digit color code (#RRGGBB), like #FFF8E7.", shown);
        }
        if (colour(text) == null) {
            return L10n.f("%1$s is too dark for Facebook's light mode text to stay readable. Pick a lighter color. Grays "
                    + "down to about %2$s work.", shown, DARKEST_ADMITTED_GREY);
        }
        return null;
    }

    /**
     * Whether the grey text sits on, moved by {@code colour}, keeps {@link #FLOOR}, and Facebook's
     * secondary text darkened for it ({@link #held}) still stands
     * {@link AmoledBackground#TEXT_HIERARCHY} apart from its primary text.
     */
    static boolean admitted(int colour) {
        double surface = textSurface(colour);
        return surface >= FLOOR && AmoledBackground.contrast(held(LIGHT_MODE_SECONDARY_TEXT, surface),
                LIGHT_MODE_TEXT) >= AmoledBackground.TEXT_HIERARCHY;
    }

    /** The luminance of {@link #TEXT_SURFACE_GREY} as {@code colour} moves it. */
    static double textSurface(int colour) {
        return TonePalette.luminance(surface(colour, TEXT_SURFACE_GREY));
    }

    /**
     * Facebook's light {@code grey} on the row's {@code colour}: each channel as far below the
     * colour's as the grey's is below white, stopping at 0. White comes back as the colour itself.
     */
    static int surface(int colour, int grey) {
        int surface = 0xFF000000;
        for (int shift = 16; shift >= 0; shift -= 8) {
            int below = 0xFF - ((grey >> shift) & 0xFF);
            surface |= Math.max(0, ((colour >> shift) & 0xFF) - below) << shift;
        }
        return surface;
    }

    /**
     * Facebook's light {@code grey} as the row fills it: {@link #surface}, with each channel held
     * no lower than {@link #TEXT_SURFACE_GREY}'s, so the wash under the feed is no darker than a grey
     * button and the text {@link #held} for that button reads on it too.
     */
    static int fill(int colour, int grey) {
        int lighter = 0xFF000000;
        for (int shift = 16; shift >= 0; shift -= 8) {
            lighter |= Math.max((grey >> shift) & 0xFF, (TEXT_SURFACE_GREY >> shift) & 0xFF) << shift;
        }
        return surface(colour, lighter);
    }

    /**
     * Facebook's light text {@code color} darkened toward black, just enough for
     * {@link AmoledTheme#TEXT_CONTRAST} on a grey of luminance {@code surface}, so a blue link stays
     * blue. Text that already has it, and text lighter than the grey (on a filled button), keeps
     * its colour.
     */
    static int held(int color, double surface) {
        double needs = (surface + 0.05) / AmoledTheme.TEXT_CONTRAST - 0.05;
        double luminance = TonePalette.luminance(color);
        if (luminance <= needs || luminance >= surface) return color;
        // Black passes on every grey the row lets through, and each step toward it is at least as
        // dark as the one before, so the lightest passing step is the first.
        int low = 0;
        int high = 0xFF;
        while (high - low > 1) {
            int middle = (low + high) >>> 1;
            if (TonePalette.luminance(towardBlack(color, middle)) <= needs) high = middle;
            else low = middle;
        }
        return towardBlack(color, high);
    }

    /** {@code color} moved {@code amount}/255 of the way to black in each channel. */
    private static int towardBlack(int color, int amount) {
        int red = (color >> 16) & 0xFF;
        int green = (color >> 8) & 0xFF;
        int blue = color & 0xFF;
        red -= (red * amount + 0x7F) / 0xFF;
        green -= (green * amount + 0x7F) / 0xFF;
        blue -= (blue * amount + 0x7F) / 0xFF;
        return (color & 0xFF000000) | red << 16 | green << 8 | blue;
    }
}
