/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.util.TypedValue;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Locale;
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
 * <p>A blog's page and a tag's page don't read a theme for their background at all: each paints the
 * color its owner chose, and the gaps between posts are that color showing through. So the two places
 * those colors are read call in here as well, {@link #pageColor} for a blog and {@link #hubColor} for
 * a tag, and get the picked color while the switch is on and the Dark palette is the one showing. The
 * screens where a person edits their own blog's colors keep the real ones, or they'd be editing a
 * color they can't see. A blog's title and link colors were chosen for its own background, so they
 * call in as well, {@link #pageTextColor}, and change only when they wouldn't show on the picked one.
 *
 * <p>On Android 12 and newer, Match my wallpaper swaps {@link #STYLE} for {@link #WALLPAPER_STYLE},
 * which sets the same surfaces to two of the dark tones Android makes from the wallpaper. That style
 * brings its own lighter tone, so a panel reads it in place of a step up from the page.
 *
 * <p>A theme a screen already drew with keeps its colors, and the design system's set is built once
 * for as long as Tumblr runs, so the summary says a restart shows it.
 */
public final class DarkBackground {
    private DarkBackground() {}

    /** The style the patch adds. Its name is the patch's to choose, so it's looked up by name. */
    static final String STYLE = "HushTumblrDarkBackground";

    /** The patch's other style, the same surfaces in the wallpaper's dark tones. */
    static final String WALLPAPER_STYLE = "HushTumblrDarkBackgroundWallpaper";

    /** The attribute the wallpaper's style gives its lighter tone. */
    static final String RAISED_ATTRIBUTE = "themeHighlightedContentBackgroundColor";

    /** The theme attribute for the screen color, and the Dark palette's color resource behind it. */
    static final String SCREEN_ATTRIBUTE = "themePrimaryColor";
    static final String DARK_SCREEN_COLOR = "dark_theme_primary_color";

    /** What the report counts: a theme painted, a theme of another palette, and the design system's colors. */
    static final String THEME_PAINTED = "dark theme painted";
    static final String OTHER_PALETTE = "other palette left alone";
    static final String DESIGN_PAINTED = "design colors painted";
    static final String DESIGN_EARLY = "design colors read early";
    static final String PAGE_PAINTED = "blog or tag page painted";
    static final String TEXT_CHANGED = "blog text made readable";

    /** The contrast a blog's title or link color needs on the picked color to stay, the WCAG line for body text. */
    static final double READABLE_CONTRAST = 4.5;

    /** What a blog's title or link color turns into when it wouldn't show, the same two Tumblr falls back on. */
    static final int LIGHT_TEXT = 0xFFFFFFFF;
    static final int DARK_TEXT = 0xFF040404;

    /** Parts of the class names of the screens where a person edits their own blog's colors. */
    private static final String[] CUSTOMIZING_SCREENS = {"CustomizeOptica", "BlogPagesPreview"};

    /**
     * How much lighter than the page a bar, a row or a dialog is, on each of red, green and blue. The
     * patch raises the style's highlighted surfaces by the same step, and its fixture test holds the
     * two together.
     */
    static final int RAISE_STEP = 0x0D;

    /** The test app has no {@link #RAISED_ATTRIBUTE}, so tests hand in another. */
    @Nullable
    static volatile Integer raisedForTests;

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

    /**
     * Whether the last activity to set its theme got the style. Only an activity's theme decides this:
     * Tumblr's Compose colors read a theme of their own, which can be another palette's.
     */
    static volatile boolean darkPalette;

    /** Whether a screen where a person edits their own blog's colors is the one in front. */
    static volatile boolean customizing;

    /** The picked color for a page, null until it's first needed. A test clears it to look again. */
    @Nullable
    static volatile Integer pagePick;

    /** The Application whose activities are being watched. */
    @Nullable
    private static volatile Application watched;

    /** Stand in for the resource lookups in a test. Null in the app. */
    @Nullable
    static volatile Integer styleForTests;
    @Nullable
    static volatile Predicate<Resources.Theme> darkForTests;

    /** Placed right after Tumblr sets an activity's theme. Never throws. */
    public static void onActivityTheme(@Nullable Activity activity) {
        if (activity == null || !Utils.settingsReady()) return;
        try {
            watchScreens(activity);
            customizing = customizes(activity);
            darkPalette = paint(activity.getTheme(), activity.getResources(), activity.getPackageName());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DARK_BACKGROUND, "activity theme", failure);
        }
    }

    /**
     * Follows which screen is in front. Going back from a customizing screen sets no theme, so the
     * theme hook alone would leave {@link #customizing} on for the screen underneath.
     */
    private static void watchScreens(Activity activity) {
        Application application = activity.getApplication();
        if (application == null || application == watched) return;
        watched = application;
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(@NonNull Activity resumed) {
                customizing = customizes(resumed);
            }

            @Override
            public void onActivityCreated(@NonNull Activity created, @Nullable Bundle state) {
                customizing = customizes(created);
            }

            @Override
            public void onActivityStarted(@NonNull Activity started) {}

            @Override
            public void onActivityPaused(@NonNull Activity paused) {}

            @Override
            public void onActivityStopped(@NonNull Activity stopped) {}

            @Override
            public void onActivitySaveInstanceState(@NonNull Activity activity, @NonNull Bundle state) {}

            @Override
            public void onActivityDestroyed(@NonNull Activity destroyed) {}
        });
    }

    /** Whether [activity] is a screen where a person edits their own blog's colors. */
    static boolean customizes(Activity activity) {
        String name = activity.getClass().getName();
        for (String screen : CUSTOMIZING_SCREENS) if (name.contains(screen)) return true;
        return false;
    }

    /**
     * Placed where a blog's background color has been worked out. Answers the picked color while the
     * pages are being painted, and [tumblrs] otherwise. Never throws.
     */
    public static int pageColor(int tumblrs) {
        try {
            Integer picked = pick();
            return picked == null ? tumblrs : picked;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DARK_BACKGROUND, "page color", failure);
            return tumblrs;
        }
    }

    /**
     * Placed where a blog's title color and its link color have been worked out. Tumblr uses those two
     * as they are, and their owner chose them for the blog's own background, so a dark title would
     * vanish on a black page. While the pages are being painted this answers [tumblrs] if it reads on
     * the picked color and white or near black if it doesn't, and [tumblrs] otherwise. Never throws.
     */
    public static int pageTextColor(int tumblrs) {
        try {
            Integer page = picked();
            if (page == null) return tumblrs;
            int readable = readableOn(page, tumblrs);
            if (readable != tumblrs) HookStatus.counted(FamilyNames.DARK_BACKGROUND, TEXT_CHANGED);
            return readable;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DARK_BACKGROUND, "page text color", failure);
            return tumblrs;
        }
    }

    /** [text] if it reads on [page], or else whichever of Tumblr's two fallback colors reads better there. */
    static int readableOn(int page, int text) {
        double background = Color.luminance(page);
        if (contrast(Color.luminance(text), background) >= READABLE_CONTRAST) return text;
        return contrast(Color.luminance(LIGHT_TEXT), background) >= contrast(Color.luminance(DARK_TEXT), background)
                ? LIGHT_TEXT : DARK_TEXT;
    }

    /** The WCAG contrast ratio of two luminances, from 1 for the same to 21 for black on white. */
    private static double contrast(double first, double second) {
        return (Math.max(first, second) + 0.05) / (Math.min(first, second) + 0.05);
    }

    /**
     * Placed where a tag page has read its header's background color, which it parses. Answers the
     * picked color as #RRGGBB while the pages are being painted, and [tumblrs] otherwise, null
     * included. Never throws.
     */
    @Nullable
    public static String hubColor(@Nullable String tumblrs) {
        try {
            Integer picked = pick();
            return picked == null ? tumblrs : String.format(Locale.ROOT, "#%06X", picked & 0xFFFFFF);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DARK_BACKGROUND, "tag page color", failure);
            return tumblrs;
        }
    }

    /** {@link #picked} for painting a page, which the report counts. */
    @Nullable
    private static Integer pick() {
        Integer picked = picked();
        if (picked != null) HookStatus.counted(FamilyNames.DARK_BACKGROUND, PAGE_PAINTED);
        return picked;
    }

    /** The picked color when blog and tag pages get painted right now, or null when they keep their own. */
    @Nullable
    private static Integer picked() {
        if (!Utils.settingsReady() || !PatchFamily.Capability.THEME_BACKGROUND.installed()) return null;
        HookStatus.invoked(FamilyNames.DARK_BACKGROUND);
        if (!Settings.DARK_BACKGROUND.get() || !darkPalette || customizing) return null;
        Integer known = pagePick;
        if (known == null) {
            Context context = Utils.getContext();
            if (context == null) return null;
            Resources resources = context.getResources();
            int[] found = ids(resources, context.getPackageName());
            known = styleColor(resources, found[0], found[1]);
            if (known == null) return null;
            pagePick = known;
        }
        return known;
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
        Integer panel = wallpaperPanel(resources, found[0], context.getPackageName());
        return new long[] {packed(page), packed(panel != null ? panel : raised(page))};
    }

    /** The lighter tone the wallpaper's style sets, or null when the style in use is the picked color's. */
    // The attribute's name is kept, so it has no R field here.
    @SuppressWarnings("DiscouragedApi")
    @Nullable
    private static Integer wallpaperPanel(Resources resources, int style, String packageName) {
        if (!followsWallpaper()) return null;
        Integer forced = raisedForTests;
        int attribute = forced != null ? forced : resources.getIdentifier(RAISED_ATTRIBUTE, "attr", packageName);
        return styleColor(resources, style, attribute);
    }

    /** Whether Match my wallpaper reads on, on any Android version. */
    static boolean wallpaperChosen() {
        return Utils.settingsReady() && PatchFamily.Capability.THEME_BACKGROUND.installed()
                && Settings.DARK_BACKGROUND_WALLPAPER.get();
    }

    /** Whether the wallpaper's style is the one to use. Android 11 and older make no colors from a wallpaper. */
    static boolean followsWallpaper() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && wallpaperChosen();
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
        String styleName = followsWallpaper() ? WALLPAPER_STYLE : STYLE;
        int style = resources.getIdentifier(styleName, "style", packageName);
        int attribute = resources.getIdentifier(SCREEN_ATTRIBUTE, "attr", packageName);
        int color = resources.getIdentifier(DARK_SCREEN_COLOR, "color", packageName);
        if (style == 0) HookStatus.missingMember(FamilyNames.DARK_BACKGROUND, "style", "resources", styleName);
        if (attribute == 0) HookStatus.missingMember(FamilyNames.DARK_BACKGROUND, "attr", "resources", SCREEN_ATTRIBUTE);
        if (color == 0) HookStatus.missingMember(FamilyNames.DARK_BACKGROUND, "color", "resources", DARK_SCREEN_COLOR);
        known = new int[] {style, attribute, color};
        ids = known;
        return known;
    }
}
