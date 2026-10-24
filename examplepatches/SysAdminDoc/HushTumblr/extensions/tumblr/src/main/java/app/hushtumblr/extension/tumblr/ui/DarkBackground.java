/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.util.TypedValue;

import androidx.annotation.Nullable;

import java.util.function.Predicate;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Paints the background of Tumblr's Dark palette in the color picked when patching, black unless
 * another was chosen.
 *
 * <p>The patch adds a style, {@link #STYLE}, that sets the palette's background attributes to that
 * color. Tumblr's screens drawn with Views take their colors from the activity's theme, which
 * Tumblr sets in one place; its Compose screens build their colors from a theme of their own. Both
 * call in here right after, and while the switch is on the style goes over the theme, so every
 * color read from it afterwards is the new one. Only the Dark palette is touched, the one whose
 * screen color is Tumblr's {@code dark_theme_primary_color}, which is also what the System palette
 * picks at night. Every other palette, light ones included, stays as Tumblr made it.
 *
 * <p>Tumblr's newer screens, its settings among them, are drawn with its design system, whose
 * Compose colors aren't read from a theme at all. Each palette has its own set, built once from
 * fixed grays, so the Dark palette's set calls in here for its two surface grays:
 * {@link #designPage} for the gray behind a screen and {@link #designPanel} for the lighter one of
 * a bar, a row or a dialog. They answer the style's color and a step up from it. Only the Dark
 * palette's set asks, which is the one the System palette uses at night too. The footer under a
 * post paints itself with that lighter gray, so {@link #designFooter} hands it the card's color.
 *
 * <p>A theme a screen already drew with keeps its colors, and the design system's set is built once
 * for as long as Tumblr runs, so the summary says a restart shows it.
 */
public final class DarkBackground {
    private DarkBackground() {}

    /** The style the patch adds. Its name is the patch's to choose, so it's looked up by name. */
    static final String STYLE = "HushTumblrDarkBackground";

    /** The theme attribute for the screen color, and the Dark palette's color resource behind it. */
    static final String SCREEN_ATTRIBUTE = "themePrimaryColor";
    static final String DARK_SCREEN_COLOR = "dark_theme_primary_color";

    /** What the report counts: a theme painted, a theme of another palette, and the design system's colors. */
    static final String THEME_PAINTED = "dark theme painted";
    static final String OTHER_PALETTE = "other palette left alone";
    static final String DESIGN_PAINTED = "design colors painted";
    static final String DESIGN_EARLY = "design colors read early";

    /**
     * How much lighter than the page a bar, a row or a dialog is, on each of red, green and blue. The
     * patch raises the style's highlighted surfaces by the same step, and its fixture test holds the
     * two together.
     */
    static final int RAISE_STEP = 0x0D;

    /** The design system's colors left as Tumblr made them. */
    private static final long[] TUMBLRS_OWN = new long[0];

    /**
     * What the design system's two surface grays turn into, the page then the panel, each packed the
     * way Compose keeps a color. {@link #TUMBLRS_OWN} when they stay Tumblr's, null until the first
     * one is asked for. Decided once, since Tumblr reads them all in one go and keeps what it built.
     * A test clears it to decide again.
     */
    @Nullable
    static volatile long[] designColors;

    /**
     * Resource ids looked up once: the style, the attribute and the color. Zero for a missing one.
     * Null until the first lookup; a test clears it to look again.
     */
    @Nullable
    static volatile int[] ids;

    /** Stand in for the resource lookups in a test. Null in the app. */
    @Nullable
    static volatile Integer styleForTests;
    @Nullable
    static volatile Predicate<Resources.Theme> darkForTests;

    /** Placed right after Tumblr sets an activity's theme. Never throws. */
    public static void onActivityTheme(@Nullable Activity activity) {
        if (activity == null || !Utils.settingsReady()) return;
        try {
            paint(activity.getTheme(), activity.getResources(), activity.getPackageName());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DARK_BACKGROUND, "activity theme", failure);
        }
    }

    /** Placed right after Tumblr's Compose colors make the theme they read from. Never throws. */
    public static void onComposeTheme(@Nullable Resources.Theme theme) {
        if (theme == null || !Utils.settingsReady()) return;
        try {
            paint(theme, theme.getResources(), Utils.getContext().getPackageName());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DARK_BACKGROUND, "Compose theme", failure);
        }
    }

    /**
     * Puts the style over [theme] when the switch is on and [theme] is the Dark palette's. True when
     * it did. Off, paused, before the settings are ready, on another palette, or without the style,
     * the theme is left alone. The readiness check is here, where the switch is read, so an entry
     * added later can't reach the switch without it.
     */
    static boolean paint(Resources.Theme theme, Resources resources, String packageName) {
        if (!Utils.settingsReady()) return false;
        if (!PatchFamily.Capability.THEME_BACKGROUND.installed()) return false;
        HookStatus.invoked(FamilyNames.DARK_BACKGROUND);
        if (!Settings.DARK_BACKGROUND.get()) return false;
        Integer forcedStyle = styleForTests;
        int[] found = forcedStyle == null ? ids(resources, packageName) : new int[] {forcedStyle, 0, 0};
        if (found[0] == 0) return false;
        Predicate<Resources.Theme> forcedDark = darkForTests;
        boolean dark = forcedDark != null ? forcedDark.test(theme) : isDark(theme, found[1], found[2]);
        if (!dark) {
            // Tumblr draws some Compose pieces with its default palette whatever the person picked,
            // so a run that paints nothing still shows in the report.
            HookStatus.counted(FamilyNames.DARK_BACKGROUND, OTHER_PALETTE);
            return false;
        }
        theme.applyStyle(found[0], true);
        HookStatus.counted(FamilyNames.DARK_BACKGROUND, THEME_PAINTED);
        return true;
    }

    /**
     * Placed where the Dark palette's design colors have read the gray behind a screen. Answers the
     * color picked when patching while the switch is on, and [tumblrs] otherwise. Never throws.
     */
    public static long designPage(long tumblrs) {
        return designColor(tumblrs, 0);
    }

    /**
     * Placed where the Dark palette's design colors have read the gray of a bar, a row or a dialog.
     * Answers a step up from the color picked when patching while the switch is on, and [tumblrs]
     * otherwise. Never throws.
     */
    public static long designPanel(long tumblrs) {
        return designColor(tumblrs, 1);
    }

    /**
     * Placed where the footer under a post has read the color it paints itself with, the design
     * system's panel gray. The footer is the bottom of the post card, which the style gives the
     * picked color itself, so while that gray is the step up {@link #designPanel} answered, this
     * answers the card's color. Any other color, another palette's included, comes back as it was,
     * and so does every color before the Dark palette's set is built or while the switch reads off.
     * Never throws.
     */
    public static long designFooter(long tumblrs) {
        long[] decided = designColors;
        return decided != null && decided.length == 2 && tumblrs == decided[1] && Settings.DARK_BACKGROUND.get()
                ? decided[0] : tumblrs;
    }

    private static long designColor(long tumblrs, int which) {
        try {
            long[] decided = designColors;
            if (decided == null) {
                // Kept before the answer is worked out, so a failure there leaves every gray Tumblr's.
                designColors = TUMBLRS_OWN;
                decided = decideDesignColors();
                designColors = decided;
            }
            // Anything but a solid color packed the plain way isn't a gray this knows how to replace.
            return decided.length == 0 || !isSolidColor(tumblrs) ? tumblrs : decided[which];
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DARK_BACKGROUND, "design colors", failure);
            return tumblrs;
        }
    }

    /**
     * The design system's page and panel colors for this run, or {@link #TUMBLRS_OWN}: off, paused,
     * without the hook or the style, or read before the settings are ready. One answer covers every
     * gray, so a set is never half painted.
     */
    private static long[] decideDesignColors() {
        if (!Utils.settingsReady()) {
            HookStatus.counted(FamilyNames.DARK_BACKGROUND, DESIGN_EARLY);
            return TUMBLRS_OWN;
        }
        if (!PatchFamily.Capability.THEME_BACKGROUND.installed()) return TUMBLRS_OWN;
        HookStatus.invoked(FamilyNames.DARK_BACKGROUND);
        if (!Settings.DARK_BACKGROUND.get()) return TUMBLRS_OWN;
        Context context = Utils.getContext();
        if (context == null) return TUMBLRS_OWN;
        Resources resources = context.getResources();
        int[] found = ids(resources, context.getPackageName());
        Integer page = styleColor(resources, found[0], found[1]);
        if (page == null) return TUMBLRS_OWN;
        HookStatus.counted(FamilyNames.DARK_BACKGROUND, DESIGN_PAINTED);
        return new long[] {packed(page), packed(raised(page))};
    }

    /** The solid color [style] gives [attribute], or null when either is missing or it isn't a color. */
    @Nullable
    static Integer styleColor(Resources resources, int style, int attribute) {
        if (style == 0 || attribute == 0) return null;
        Resources.Theme styled = resources.newTheme();
        styled.applyStyle(style, true);
        TypedValue value = new TypedValue();
        if (!styled.resolveAttribute(attribute, value, true)) return null;
        if (value.type < TypedValue.TYPE_FIRST_COLOR_INT || value.type > TypedValue.TYPE_LAST_COLOR_INT) return null;
        return value.data | 0xFF000000;
    }

    /** [color] with {@link #RAISE_STEP} added to each of red, green and blue, as far as white. */
    static int raised(int color) {
        int red = Math.min(0xFF, (color >> 16 & 0xFF) + RAISE_STEP);
        int green = Math.min(0xFF, (color >> 8 & 0xFF) + RAISE_STEP);
        int blue = Math.min(0xFF, (color & 0xFF) + RAISE_STEP);
        return 0xFF000000 | red << 16 | green << 8 | blue;
    }

    /** An ARGB color the way Compose keeps one in a long: in the upper half, the lower half zero for sRGB. */
    static long packed(int color) {
        return (color & 0xFFFFFFFFL) << 32;
    }

    /** Whether [color] is a solid sRGB color as {@link #packed} writes one. */
    static boolean isSolidColor(long color) {
        return (color & 0xFFFFFFFFL) == 0L && color >>> 56 == 0xFFL;
    }

    /** Whether [theme]'s screen color is the Dark palette's own. */
    static boolean isDark(Resources.Theme theme, int attribute, int darkColor) {
        if (attribute == 0 || darkColor == 0) return false;
        TypedValue value = new TypedValue();
        return theme.resolveAttribute(attribute, value, true) && value.resourceId == darkColor;
    }

    // The style is the patch's, and the palette's names are kept, so neither has an R field here.
    @SuppressWarnings("DiscouragedApi")
    private static int[] ids(Resources resources, String packageName) {
        int[] known = ids;
        if (known != null) return known;
        int style = resources.getIdentifier(STYLE, "style", packageName);
        int attribute = resources.getIdentifier(SCREEN_ATTRIBUTE, "attr", packageName);
        int color = resources.getIdentifier(DARK_SCREEN_COLOR, "color", packageName);
        if (style == 0) HookStatus.missingMember(FamilyNames.DARK_BACKGROUND, "style", "resources", STYLE);
        if (attribute == 0) HookStatus.missingMember(FamilyNames.DARK_BACKGROUND, "attr", "resources", SCREEN_ATTRIBUTE);
        if (color == 0) HookStatus.missingMember(FamilyNames.DARK_BACKGROUND, "color", "resources", DARK_SCREEN_COLOR);
        known = new int[] {style, attribute, color};
        ids = known;
        return known;
    }
}
