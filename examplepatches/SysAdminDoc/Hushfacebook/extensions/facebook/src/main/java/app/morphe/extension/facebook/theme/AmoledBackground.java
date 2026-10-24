/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import androidx.annotation.Nullable;

import java.util.Locale;

import app.morphe.extension.shared.L10n;

/**
 * The rule for the Background color row on Hushfacebook's Appearance page (issue #214): which dark
 * colours AMOLED's backgrounds can take once Facebook is running, in place of the one the patch's
 * Background colour option wrote. It's the option's own rule, AmoledThemePatch.kt's
 * backgroundColour, lightestStep and backgroundProblem, so the row takes the colours the option
 * takes and gives each the same surfaces. AmoledBackgroundTest holds it to the option's colours.
 *
 * <p>A blank row isn't black here: it leaves the colour the patch wrote.
 */
public final class AmoledBackground {

    private AmoledBackground() {}

    /** What {@link #lightestStep} answers for a colour too light for Facebook's text. */
    static final int NONE = -1;

    private static final int BLACK = 0xFF000000;

    /** Facebook's text in dark mode, its PRIMARY_TEXT token on 577 and 580. */
    private static final int DARK_MODE_TEXT = 0xFFF2F4F7;

    /**
     * How far apart a lighter background keeps Facebook's primary text and the secondary text
     * {@link AmoledTheme#foreground} lifts, a little under Material 3's dark scheme. It sets how
     * light the surfaces may go.
     */
    static final double TEXT_HIERARCHY = 1.3;

    /** The fewest steps above a lighter background its lightest surface may take. */
    static final int MIN_LIGHTEST_STEP = 8;

    /** Facebook's dark cards (#333334), popovers (#3B3C3E) and an input's fill (#333334), as route one steps them. */
    private static final int[] SURFACE_STEPS = {0x333334 - 0x212121, 0x3B3C3E - 0x212121, 0x333334 - 0x0D0D0D};

    /** The lightest grey the rule takes, for {@link #problem}'s advice. */
    public static final String LIGHTEST_ADMITTED_GREY = "#535353";

    /**
     * The colour {@code text} asks for: the {@code #RRGGBB} given, {@code #FFRRGGBB} too, or black
     * when it's blank. Null for anything else: a colour that isn't opaque, or one too light for any
     * {@link #lightestStep} to keep Facebook's text readable on it.
     */
    @Nullable
    public static Integer colour(@Nullable String text) {
        Integer colour = parsed(text);
        return colour != null && lightestStep(colour) != NONE ? colour : null;
    }

    /**
     * {@code text} as the row keeps it: blank, or the colour as {@code #RRGGBB} in capitals. Null
     * when {@link #colour} refuses it.
     */
    @Nullable
    public static String stored(@Nullable String text) {
        if (hex(text).isEmpty()) return "";
        Integer colour = colour(text);
        return colour == null ? null : String.format(Locale.ROOT, "#%06X", colour & 0xFFFFFF);
    }

    /**
     * The opaque colour {@code text} gives, black when it's blank, before its contrast is judged.
     * {@link AmoledLightBackground} reads a typed colour this way too.
     */
    @Nullable
    static Integer parsed(@Nullable String text) {
        String hex = hex(text);
        if (hex.isEmpty()) return BLACK;
        if (!looksLikeAColour(hex)) return null;
        if (hex.length() == 8 && !hex.regionMatches(true, 0, "ff", 0, 2)) return null;
        return (int) (0xFF000000L | Long.parseLong(hex.substring(hex.length() - 6), 16));
    }

    static String hex(@Nullable String text) {
        String hex = text == null ? "" : text.trim();
        return hex.startsWith("#") ? hex.substring(1) : hex;
    }

    /** Six or eight hex digits, ASCII only. */
    static boolean looksLikeAColour(String hex) {
        if (hex.length() != 6 && hex.length() != 8) return false;
        for (int i = 0; i < hex.length(); i++) {
            char c = hex.charAt(i);
            boolean digit = (c >= '0' && c <= '9') || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F');
            if (!digit) return false;
        }
        return true;
    }

    /**
     * Why the row refuses {@code text}, in words the person typing can act on, or null when it's
     * taken. A blank row is taken.
     */
    @Nullable
    public static String problem(@Nullable String text) {
        String hex = hex(text);
        if (hex.isEmpty()) return null;
        String shown = L10n.isolate(text.trim());
        if (!looksLikeAColour(hex)) {
            return L10n.f("\"%1$s\" isn't a color. Type a six-digit color code (#RRGGBB), like #0D1117, or leave it blank "
                    + "for the color Hushfacebook was patched with.", shown);
        }
        if (parsed(text) == null) {
            return L10n.f("%1$s is see-through. Type a solid six-digit color code (#RRGGBB), like #0D1117.", shown);
        }
        if (colour(text) == null) {
            return L10n.f("%1$s is too light for Facebook's text to stay readable. Pick a darker color. Grays up to "
                    + "about %2$s work.", shown, LIGHTEST_ADMITTED_GREY);
        }
        return null;
    }

    /**
     * How far above {@code colour} the lightest surface AMOLED makes sits, as {@link
     * AmoledTheme#lightestStep} takes it: {@link AmoledTheme#LIGHTEST_STEP} when Facebook's
     * dark-mode text keeps 4.5:1 on every surface, otherwise the largest smaller step that leaves
     * room for lifted secondary text and keeps the card, popover and input fill in order and apart.
     * {@link #NONE} when no step does: the colour is too light.
     */
    static int lightestStep(int colour) {
        if (contrast(DARK_MODE_TEXT, AmoledTheme.raise(colour, AmoledTheme.LIGHTEST_STEP * 0x010101))
                >= AmoledTheme.TEXT_CONTRAST) {
            return AmoledTheme.LIGHTEST_STEP;
        }
        double ceiling = (TonePalette.luminance(DARK_MODE_TEXT) + 0.05) / (TEXT_HIERARCHY * AmoledTheme.TEXT_CONTRAST) - 0.05;
        for (int step = AmoledTheme.LIGHTEST_STEP - 1; step >= MIN_LIGHTEST_STEP; step--) {
            if (AmoledTheme.textSurface(colour, step) > ceiling) continue;
            int[] surfaces = surfaces(colour, step);
            for (int i = 1; i < surfaces.length; i++) {
                if (TonePalette.luminance(surfaces[i - 1]) >= TonePalette.luminance(surfaces[i])) return NONE;
            }
            return step;
        }
        return NONE;
    }

    /**
     * The page and the surfaces route one makes on it with {@code lightest} as the lightest step,
     * darkest first: page, card, popover and input fill, each step scaled as {@link
     * AmoledTheme#scaled} does it.
     */
    static int[] surfaces(int colour, int lightest) {
        int[] surfaces = new int[SURFACE_STEPS.length + 1];
        surfaces[0] = colour;
        for (int i = 0; i < SURFACE_STEPS.length; i++) {
            int step = SURFACE_STEPS[i];
            int scaled = scaled((step >> 16) & 0xFF, lightest) << 16 | scaled((step >> 8) & 0xFF, lightest) << 8
                    | scaled(step & 0xFF, lightest);
            surfaces[i + 1] = AmoledTheme.raise(colour, scaled);
        }
        return surfaces;
    }

    private static int scaled(int channel, int lightest) {
        return (channel * lightest + AmoledTheme.LIGHTEST_STEP / 2) / AmoledTheme.LIGHTEST_STEP;
    }

    /** WCAG 2.2's contrast ratio between two opaque colours. */
    static double contrast(int first, int second) {
        double one = TonePalette.luminance(first);
        double other = TonePalette.luminance(second);
        return (Math.max(one, other) + 0.05) / (Math.min(one, other) + 0.05);
    }
}
