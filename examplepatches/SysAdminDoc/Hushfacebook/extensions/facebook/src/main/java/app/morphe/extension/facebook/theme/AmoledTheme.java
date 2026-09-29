/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/extensions/extension/src/main/java/app/andrewliang/extension/AmoledTheme.java
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.extension.facebook.theme;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Color;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "[General] AMOLED black theme" patch. It holds the rule for route one and route
 * four, the read back of route two in light mode, and the rules for the two system bars. The four
 * routes are described with the patch, in
 * patches/src/main/kotlin/app/morphe/patches/facebook/layout/theme/AmoledThemePatch.kt.
 *
 * <p>The decision needs the token, because a colour alone cannot show the difference between a card
 * and a dark divider. The names of the tokens carry that difference, and R8 cannot rename an enum
 * constant.
 *
 * <p>The decision also needs the colour, because the same tokens serve light mode, where a card is
 * white. It needs Facebook's own answer for dark mode as well ({@link DarkMode}): the Video tab stays
 * dark in light mode, from the same dark style and the same colour resources as dark mode, and in
 * light mode every route leaves Facebook's colour. The system bars ask the window's theme instead,
 * see {@link #statusBar}.
 *
 * <p>{@link #apply} runs for each colour on each layout pass. Thus it makes no object and writes no
 * log. The one thing it adds is a count in Hook status, a hash lookup and an increment once the
 * first call has made the family's entry, which is what shows a report that the theme ran at all.
 * The colour resource reads ({@link #getColor(Context, int)} and the rest) run as often and add no
 * count: in dark mode they cost one compare and a volatile read.
 */
public final class AmoledTheme {

    private AmoledTheme() {}

    /**
     * The largest value that a channel can have and still count as a background. Measured on a
     * device: a card is {@code #252728}, but a divider is {@code #3A3B3C}.
     */
    static final int MAX_CHANNEL = 0x2A;

    /**
     * The largest difference between the channels of a background. A grey has almost none. A dark
     * green or dark brown banner has much more, and it keeps its colour.
     */
    private static final int MAX_SPREAD = 8;

    /**
     * The largest value that a channel of a status bar colour can have and still turn black. The
     * bar is chrome, so it goes further than {@link #MAX_CHANNEL}: the Video tab asks for
     * {@code #333334}, and Facebook's lightest dark chrome grey is {@code #3A3B3C}. The Material
     * You theme's status bar takes the same band.
     */
    static final int MAX_BAR_CHANNEL = 0x40;

    /**
     * The tokens that name a background area. The short names come from Mig and the long names
     * from FDS. One set holds both, because only the Mig surface enum declares the short names.
     */
    private static final Set<String> BACKGROUND_TOKENS = Collections.unmodifiableSet(
            new HashSet<>(Arrays.asList(
                    // Mig.
                    "WASH",
                    "SURFACE",
                    "CARD",
                    "ELEVATION",
                    "BANNER",
                    "PRIMARY_UI",
                    // FDS: the page.
                    "WEB_WASH",
                    "FBLITE_WASH",
                    "SURFACE_BACKGROUND",
                    "BACKGROUND_SURFACE",
                    "DEVICE_BACKGROUND",
                    "BACKGROUND_DEEMPHASIZED",
                    // FDS: panels on the page.
                    "CARD_BACKGROUND",
                    "CARD_BACKGROUND_FLAT",
                    "CARD_BACKGROUND_LEGACY_WEB",
                    "BACKGROUND_CARD",
                    "BACKGROUND_ELEVATION",
                    "LIST_CELL_BACKGROUND",
                    "ATTACHMENT_FOOTER_BACKGROUND",
                    "ENTITY_HEADER_BACKGROUND",
                    // FDS: comments.
                    "COMMENT_BACKGROUND",
                    "COMMENT_BACKGROUND_DEEMPHASIZED",
                    // FDS: sheets and popovers.
                    "BOTTOM_SHEET_BACKGROUND_DEEMPHASIZED",
                    "BOTTOM_SHEET_INSET_BACKGROUND",
                    "POPOVER_BACKGROUND",
                    "FADED_POPOVER_BACKGROUND",
                    // FDS: chrome.
                    "NAV_BAR_BACKGROUND",
                    "TAB_BAR_BACKGROUND",
                    "BACKGROUND_BANNER",
                    "BACKGROUND_PRIMARY_UI")));

    /** Opaque black, what route two writes over a dark grey. */
    private static final int BLACK = 0xFF000000;

    /**
     * Route two's rewrites, sorted by resource id, and the colour Facebook had at each:
     * {@link #routeTwoColours} as the patch filled it in.
     */
    private static int[] rewrittenIds;
    private static int[] facebookColours;

    static {
        useRouteTwo(routeTwoColours());
    }

    /**
     * Route one: a colour that a resolver returns.
     *
     * @param token an enum constant. Only its name is used.
     * @return black if this is a background that is already dark in Facebook's dark mode, or
     * {@code color} unchanged.
     */
    public static int apply(int color, Object token) {
        HookStatus.invoked(FamilyNames.AMOLED_THEME);
        if (!isDarkNeutral(color, MAX_CHANNEL)) return color;
        if (!(token instanceof Enum) || !DarkMode.on()) return color;

        return BACKGROUND_TOKENS.contains(((Enum<?>) token).name()) ? 0xFF000000 : color;
    }

    /**
     * Route four: a colour that the server sends as text.
     *
     * <p>The patch replaces each call to {@link Color#parseColor} in the app with a call to this
     * method. A server-driven screen, such as Settings, gets its colours as strings like
     * {@code "#FF252728"}. No token comes with a string, so the colour alone decides, as in route
     * two and route three.
     *
     * <p>A text that is not a colour throws the same exception as before, so the callers see no
     * change. In light mode the colour is left as parsed.
     */
    public static int parseColor(String text) {
        HookStatus.invoked(FamilyNames.AMOLED_THEME);
        int color = Color.parseColor(text);
        return isDarkNeutral(color, MAX_CHANNEL) && DarkMode.on() ? BLACK : color;
    }

    /**
     * Route two, read back: Facebook reading a colour resource with {@code Context.getColor}. The
     * patch sends every such call here, and the three below get the other ways to read one.
     *
     * <p>Route two writes black over Facebook's dark greys in its colour resources, and Facebook reads
     * some of those in light mode too. Its dark palette, #252728 and the rest, is in the default
     * configuration and only its dark style uses it, except that the Video tab stays dark in light
     * mode: its bottom bar is {@code getColor} of the #252728 resource the dark style uses (580
     * {@code LX/4KA}, 577 {@code LX/4Bb}), and its themed context asks that dark style. So in
     * light mode, a black that route two wrote reads as the colour Facebook had there. In dark mode
     * the black stands.
     */
    public static int getColor(Context context, int id) {
        return lightMode(context.getColor(id), id);
    }

    /** The same for {@code Resources.getColor(int)}. */
    @SuppressWarnings("deprecation")
    public static int getColor(Resources resources, int id) {
        return lightMode(resources.getColor(id), id);
    }

    /** The same for {@code Resources.getColor(int, Theme)}. */
    public static int getColor(Resources resources, int id, @Nullable Resources.Theme theme) {
        return lightMode(resources.getColor(id, theme), id);
    }

    /**
     * The same for {@code TypedArray.getColor}, how FDS's theme resolver reads a token's colour from
     * the Video tab's dark style: the attribute points at the colour resource route two rewrote.
     */
    public static int getColor(TypedArray array, int index, int fallback) {
        int color = array.getColor(index, fallback);
        return color == BLACK && !DarkMode.on() ? lightMode(color, array.getResourceId(index, 0)) : color;
    }

    /** Facebook's own colour for resource {@code id} when route two wrote {@code color} there in light mode. */
    static int lightMode(int color, int id) {
        if (color != BLACK || DarkMode.on()) return color;
        int at = Arrays.binarySearch(rewrittenIds, id);
        return at >= 0 ? facebookColours[at] : color;
    }

    /**
     * Filled in by the patch: the colour resources route two wrote black over, as
     * {@code "id=colour;..."} in hex, with Facebook's colour for each. Only those
     * whose night value route two left alone, so the colour a black stands for is always this one.
     */
    @Nullable
    public static String routeTwoColours() {
        return null;
    }

    /** Package-visible for tests: puts a table of {@link #routeTwoColours}'s form in use. */
    static void useRouteTwo(@Nullable String table) {
        String[] entries = table == null || table.isEmpty() ? new String[0] : table.split(";");
        // An app's resource ids are positive, so the id in the high half sorts the pairs by id.
        long[] pairs = new long[entries.length];
        for (int i = 0; i < entries.length; i++) {
            int equals = entries[i].indexOf('=');
            pairs[i] = Long.parseLong(entries[i].substring(0, equals), 16) << 32
                    | Long.parseLong(entries[i].substring(equals + 1), 16);
        }
        Arrays.sort(pairs);
        int[] ids = new int[pairs.length];
        int[] colours = new int[pairs.length];
        for (int i = 0; i < pairs.length; i++) {
            ids[i] = (int) (pairs[i] >>> 32);
            colours[i] = (int) pairs[i];
        }
        facebookColours = colours;
        rewrittenIds = ids;
    }

    /**
     * The status bar: the colour Facebook is about to paint it, and whether Facebook's theme is dark.
     *
     * <p>On Android 15 and newer Facebook paints the bar itself, through one method that also
     * remembers the last colour per window and skips a colour it already painted. The patch calls
     * this first thing in that method, so the colour painted and the colour remembered are the same.
     * A tab's bar colour often comes from a token resolver that route one doesn't reach. Back from
     * Recent Apps, the Video tab's {@code #333334} (its CARD_BACKGROUND_DARK token) was painted over
     * the black it had at a fresh launch, issue #22.
     *
     * <p>Light mode asks the same token for the same {@code #333334}, so here the colour can't tell
     * the themes apart, and the patch passes Facebook's own answer for the window.
     *
     * @return black for an opaque dark grey in the dark theme, or {@code color} unchanged.
     */
    public static int statusBar(int color, boolean dark) {
        HookStatus.invoked(FamilyNames.AMOLED_THEME);
        return dark && isDarkNeutral(color, MAX_BAR_CHANNEL) ? 0xFF000000 : color;
    }

    /**
     * The navigation bar: the colour Facebook is about to paint it, and whether Facebook's theme is
     * dark. The patch calls this first thing in the method that paints it.
     *
     * <p>The Video tab keeps a dark surface in light mode too, and writes its bars' {@code #252728}
     * into code for both themes. Route three leaves a colour a method hands to a system bar alone,
     * so light mode keeps it, and this hook turns it black in the dark theme. The band is route
     * three's own: the lighter greys Facebook gives the bar under a sheet keep theirs.
     *
     * @return black for an opaque dark grey in the dark theme, or {@code color} unchanged.
     */
    public static int navigationBar(int color, boolean dark) {
        HookStatus.invoked(FamilyNames.AMOLED_THEME);
        return dark && isDarkNeutral(color, MAX_CHANNEL) ? 0xFF000000 : color;
    }

    /** True for an opaque grey with each channel at or below {@code maxChannel}. */
    static boolean isDarkNeutral(int color, int maxChannel) {
        if ((color >>> 24) != 0xFF) return false;

        int red = (color >> 16) & 0xFF;
        int green = (color >> 8) & 0xFF;
        int blue = color & 0xFF;
        int high = Math.max(red, Math.max(green, blue));
        int low = Math.min(red, Math.min(green, blue));
        return high <= maxChannel && high - low <= MAX_SPREAD;
    }
}
