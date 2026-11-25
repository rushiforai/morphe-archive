package app.hushmessenger.extension;

import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;

/**
 * The message log's colors, taken from Messenger's own chats rather than the settings page's: its softer dark greys
 * (#1C1C1D behind, #333334 under bubbles, the search field and chips) or its white light mode, light or dark with
 * Messenger. With Material You on, the greys and blues take the palette's at the same lightness, the way the theme
 * recolors Messenger itself, and its pure black switch makes the log's background black. Every text color is checked
 * against what it sits on and moved toward white or black until it reads at 4.5:1.
 */
final class MessageLogLook {
    static final int DARK_GROUND = 0xFF1C1C1D, DARK_RAISED = 0xFF333334, DARK_TEXT = 0xFFE4E6EB, DARK_MUTED = 0xFFB0B3B8;
    static final int DARK_LINK = 0xFF5AA7FF, DARK_ERROR = 0xFFFFB4AB, DARK_FACE = 0xFF4E4F50, DARK_FIGURE = 0xFF8A8D91;
    static final int LIGHT_GROUND = 0xFFFFFFFF, LIGHT_RAISED = 0xFFF0F0F0, LIGHT_TEXT = 0xFF050505, LIGHT_MUTED = 0xFF65676B;
    static final int LIGHT_LINK = 0xFF0064E0, LIGHT_ERROR = 0xFFB3261E, LIGHT_FACE = 0xFFC9CCD1, LIGHT_FIGURE = 0xFFFFFFFF;
    /** Messenger's blue, behind white text on its own buttons. */
    static final int BLUE = 0xFF0866FF;
    /** Text contrast every color here keeps on what it sits on. */
    static final double READABLE = 4.5;

    final boolean light;
    /** The sheet's background. */
    final int ground;
    /** Bubbles, the search field, chips and the buttons: Messenger's raised grey. */
    final int raised;
    /** A picked chip: Messenger's blue washed into the background. */
    final int picked;
    final int text, muted, link, pickedText, fill, onFill, error;
    /** Messenger's blank profile picture: its circle and the figure on it. */
    final int face, figure;

    /** The log's look right now: light or dark with Messenger's chats, in Material You's palette when that's on. */
    static MessageLogLook current() {
        boolean light = MaterialYouTheme.chatIsLight();
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null || !Settings.wouldUse(MaterialYouTheme.KEY)) return new MessageLogLook(light, null, false, false, false);
        return new MessageLogLook(light, MaterialYouTheme.palette(), prefs.getBoolean(MaterialYouTheme.BLACK_KEY, false),
            prefs.getBoolean(MaterialYouTheme.LIGHT_KEY, false), prefs.getBoolean(MaterialYouTheme.LIGHT_GRAYS_KEY, false));
    }

    /**
     * Messenger's look, light or dark, in [palette] when Material You is on (null when it's off). Dark mode takes the
     * palette's greys and blues, and [black] makes its background pure black. Light mode takes its blues only with
     * [lightBlues] and its greys only with [lightGreys], as Material You does with Messenger's light mode.
     */
    MessageLogLook(boolean light, TonePalette palette, boolean black, boolean lightBlues, boolean lightGreys) {
        this.light = light;
        TonePalette greys = palette != null && (!light || lightGreys) ? palette : null;
        TonePalette blues = palette != null && (!light || lightBlues) ? palette : null;
        ground = !light && palette != null && black ? 0xFF000000 : grey(greys, light ? LIGHT_GROUND : DARK_GROUND);
        raised = grey(greys, light ? LIGHT_RAISED : DARK_RAISED);
        // White text on the blue reads at 4.8 with Messenger's own; a palette's blue is darkened until it does too.
        fill = readable(blue(blues, BLUE), READABLE, 0xFFFFFFFF);
        onFill = 0xFFFFFFFF;
        picked = mix(fill, ground, light ? 0.14 : 0.32);
        text = readable(grey(greys, light ? LIGHT_TEXT : DARK_TEXT), READABLE, ground, raised, picked);
        muted = readable(grey(greys, light ? LIGHT_MUTED : DARK_MUTED), READABLE, ground, raised);
        link = readable(blue(blues, light ? LIGHT_LINK : DARK_LINK), READABLE, ground, raised);
        pickedText = readable(link, READABLE, picked);
        error = readable(light ? LIGHT_ERROR : DARK_ERROR, READABLE, ground, raised);
        face = grey(greys, light ? LIGHT_FACE : DARK_FACE);
        figure = grey(greys, light ? LIGHT_FIGURE : DARK_FIGURE);
    }

    private static int grey(TonePalette palette, int color) {
        return palette == null ? color : palette.sameLightness(TonePalette.NEUTRAL, color);
    }

    private static int blue(TonePalette palette, int color) {
        return palette == null ? color : palette.sameLightness(TonePalette.ACCENT, color);
    }

    /** WCAG contrast between two opaque colors. */
    static double contrast(int first, int second) {
        double one = TonePalette.luminance(first), two = TonePalette.luminance(second);
        return (Math.max(one, two) + 0.05) / (Math.min(one, two) + 0.05);
    }

    /**
     * [color], moved toward white on dark grounds or black on light ones, just far enough to read at [target] on every
     * one of [grounds]. The first ground decides the way.
     */
    static int readable(int color, double target, int... grounds) {
        int toward = TonePalette.luminance(grounds[0]) < 0.18 ? 0xFFFFFFFF : 0xFF000000;
        for (int step = 0; step <= 40; step++) {
            int moved = mix(toward, color, step / 40.0);
            boolean reads = true;
            for (int ground : grounds) reads &= contrast(moved, ground) >= target;
            if (reads) return moved;
        }
        return toward;
    }

    /** [over] laid on [under] at [amount], opaque. */
    static int mix(int over, int under, double amount) {
        int r = (int) Math.round(((over >> 16) & 0xFF) * amount + ((under >> 16) & 0xFF) * (1 - amount));
        int g = (int) Math.round(((over >> 8) & 0xFF) * amount + ((under >> 8) & 0xFF) * (1 - amount));
        int b = (int) Math.round((over & 0xFF) * amount + (under & 0xFF) * (1 - amount));
        return 0xFF000000 | (r << 16) | (g << 8) | b;
    }

    /**
     * A round-ended field or chip in [fill], drawn [inset] dp short of its view top and bottom so a 48 dp touch target
     * keeps Messenger's slimmer shape. Focus rings it in the link color, and a press ripples it.
     */
    Drawable pill(SettingsUi ui, int fill, int inset) {
        int radius = ui.dp(24);
        GradientDrawable plain = new GradientDrawable();
        plain.setColor(fill);
        plain.setCornerRadius(radius);
        GradientDrawable ring = new GradientDrawable();
        ring.setColor(fill);
        ring.setCornerRadius(radius);
        ring.setStroke(ui.dp(2), link);
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[] {android.R.attr.state_focused}, ring);
        states.addState(new int[] {}, plain);
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(0xFFFFFFFF);
        mask.setCornerRadius(radius);
        RippleDrawable ripple = new RippleDrawable(ColorStateList.valueOf((link & 0x00FFFFFF) | 0x33000000), states, mask);
        return new InsetDrawable(ripple, 0, ui.dp(inset), 0, ui.dp(inset));
    }

    /** A message's bubble: Messenger's raised grey with its rounded corners. */
    Drawable bubble(SettingsUi ui) {
        GradientDrawable bubble = new GradientDrawable();
        bubble.setColor(raised);
        bubble.setCornerRadius(ui.dp(18));
        return bubble;
    }

    /** A face [group] or not, for a row of this look. */
    MessageLogFace face(boolean group) {
        return new MessageLogFace(face, figure, ground, group);
    }
}
