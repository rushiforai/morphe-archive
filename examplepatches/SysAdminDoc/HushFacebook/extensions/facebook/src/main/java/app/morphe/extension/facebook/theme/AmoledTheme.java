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
 * <p>Black is the default. The patch's Background colour option can ask for another dark colour
 * (issue #34), which {@link #backgroundColour} then answers: every route and both bars put it where
 * they put black, and a raised surface sits the same step above it that it sits above black.
 * Facebook's own black stays black on every route.
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
     * device: a surface is {@code #252728}, but a divider is {@code #3A3B3C}.
     */
    static final int MAX_CHANNEL = 0x2A;

    /**
     * The largest value that a channel of a raised surface can have: a card, a comment or a popover
     * that sits on a background. FDS's dark styles in 577 and 580 give a card {@code #333334}, a
     * popover {@code #3B3C3E}, and the Video tab's popover {@code #3E4042}, the lightest of them.
     * Route one takes a background token in this band to near black ({@link #RAISED_SHIFT}), issue
     * #27.
     */
    static final int MAX_RAISED_CHANNEL = 0x42;

    /**
     * How far each channel of a raised surface goes down. A card's {@code #333334} becomes
     * {@code #121213}, near black but still apart from the black page under it, and a popover keeps
     * its step above the card. The darkest grey in the band ends at {@code #0A0A0A}, not black.
     *
     * <p>{@code CARD_BORDER} isn't a background token, so route one leaves it at Facebook's own
     * {@code #333334} rather than shifting it too. Most cards draw no border stroke at all in dark
     * mode, which is why the near black rather than pure black matters here in the first place; on
     * the few that do, the unshifted border now reads as a visible, lighter edge against the card's
     * own near black, which is the same edge this shift exists to preserve, not a fault to fix.
     */
    private static final int RAISED_SHIFT = 0x21;

    /**
     * The largest value that a channel of a card's grey sent as text can have (route four). Facebook
     * builds its search results from server templates, and a Page's card there comes as
     * {@code #333334} ({@code #333333} in the report), issue #27. A string comes with no token, and
     * the next greys up that a server sends, {@code #3A3B3C}, {@code #3B3C3E} and {@code #3E4042},
     * are a button's, a popover's or a divider's own fill, so they keep Facebook's grey.
     */
    static final int MAX_SERVER_CARD_CHANNEL = 0x36;

    /**
     * How far each channel of an input or a pill's fill goes down: less than {@link #RAISED_SHIFT}.
     * {@link #FILL_TOKENS} shows its shape only through this fill, not a border or the text on it,
     * so shifting it as far as a card would leave it at about 1.1:1 against the black page, close
     * enough to disappear. This keeps a fill at about {@code #262627} from {@code #333334}, near
     * 1.5:1, while a card still goes to the near black {@link #RAISED_SHIFT} gives it.
     */
    private static final int FILL_SHIFT = 0x0D;

    /**
     * Names of the tokens for an input or a pill's fill, rather than a card, comment or popover:
     * Mig's {@code PRIMARY_UI} (a search field, a pill) and its FDS counterpart. Both read
     * {@code #333334} in dark mode ({@code LX/Dol;->AP6}), the same as a card, but a card is a panel
     * with its own edge while these show only through the fill itself.
     */
    private static final Set<String> FILL_TOKENS = Collections.unmodifiableSet(
            new HashSet<>(Arrays.asList("PRIMARY_UI", "BACKGROUND_PRIMARY_UI")));

    /**
     * FDS's token for the row of an unread notification. Facebook's dark theme gives it a 10% blue,
     * {@code #192D88FF}, which reads as a blue row over Facebook's grey page and as almost black over
     * AMOLED's black one ({@code #050E1A}), issue #72. The Notifications tab's row asks for it
     * ({@code NotificationsTetraComponent}, 581 {@code LX/9BT;->A1A}).
     */
    private static final String NEW_NOTIFICATION = "NEW_NOTIFICATION_BACKGROUND";

    /**
     * The alpha an unread notification's tint gets in dark mode: 25% where Facebook gives 10%. Over
     * black, Facebook's blue then shows as {@code #0B2240}, a row that stands out the way it does
     * on Facebook's grey page, with its text and blue dot still above 4:1.
     */
    static final int NEW_NOTIFICATION_ALPHA = 0x40;

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

    /** Opaque black, what route two writes over a dark grey unless the patch asks for another colour. */
    private static final int BLACK = 0xFF000000;

    /** What a background turns into: {@link #backgroundColour} as the patch filled it in. */
    private static int background = backgroundColour();

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
     * <p>A background in Facebook's dark mode turns black. A raised surface on it, a card for one,
     * turns near black instead: FDS's dark card is {@code #333334}, and on AMOLED's black page it
     * stayed a grey slab (issue #27), while a black card would lose its edge, since FDS draws no
     * border round one in dark mode. The grey's steps between surfaces are kept, so what Facebook
     * draws on a card (a translucent input, a chip) still shows against it.
     *
     * @param token an enum constant. Only its name is used.
     * @return the background colour (black by default) for a background up to {@link #MAX_CHANNEL},
     * the near black of {@link #RAISED_SHIFT} for one up to {@link #MAX_RAISED_CHANNEL},
     * {@link #FILL_SHIFT} for an input or a pill's fill ({@link #FILL_TOKENS}), each that far above
     * the background colour, in Facebook's dark mode, or {@code color} unchanged. The background
     * colour itself comes back as it is, from route two's resources. An unread notification's tint
     * comes back stronger ({@link #unreadRow}).
     */
    public static int apply(int color, Object token) {
        HookStatus.invoked(FamilyNames.AMOLED_THEME);
        if (!isDarkNeutral(color, MAX_RAISED_CHANNEL)) {
            return (color >>> 24) < NEW_NOTIFICATION_ALPHA && token instanceof Enum && DarkMode.on()
                    ? unreadRow(color, ((Enum<?>) token).name())
                    : color;
        }
        if (!(token instanceof Enum) || !DarkMode.on()) return color;
        String name = ((Enum<?>) token).name();
        if (!BACKGROUND_TOKENS.contains(name)) return color;
        if (color == BLACK || color == background) return color;

        if (isDarkNeutral(color, MAX_CHANNEL)) return background;
        // Every channel of a grey above the black band is at least MAX_CHANNEL + 1 - MAX_SPREAD,
        // above either shift, so no channel borrows from the next.
        int shift = FILL_TOKENS.contains(name) ? FILL_SHIFT : RAISED_SHIFT;
        return raise(background, color - shift * 0x010101);
    }

    /**
     * The colour route one gives an unread notification's row in dark mode, issue #72: a
     * translucent tint for {@link #NEW_NOTIFICATION} keeps its colour at
     * {@link #NEW_NOTIFICATION_ALPHA}. A clear colour, one already that strong, and any other token's
     * colour come back as they are. Material You asks the same, to know AMOLED's tint as
     * Facebook's.
     */
    static int unreadRow(int color, String token) {
        int alpha = color >>> 24;
        if (alpha == 0 || alpha >= NEW_NOTIFICATION_ALPHA || !NEW_NOTIFICATION.equals(token)) return color;
        return (NEW_NOTIFICATION_ALPHA << 24) | (color & 0x00FFFFFF);
    }

    /**
     * Route four: a colour that the server sends as text.
     *
     * <p>The patch replaces each call to {@link Color#parseColor} in the app with a call to this
     * method. A server-driven screen, such as Settings or the search results, gets its colours as
     * strings like {@code "#FF252728"}. No token comes with a string, so the colour alone decides,
     * as in route two and route three.
     *
     * <p>In Facebook's dark mode a background grey turns black, and a card's grey up to
     * {@link #MAX_SERVER_CARD_CHANNEL} goes to the near black route one gives a card: the Page
     * card in search results, issue #27. A translucent colour, such as the 10% white of the card's
     * message box, is left as it is and stays a step above the card.
     *
     * <p>A text that is not a colour throws the same exception as before, so the callers see no
     * change. In light mode the colour is left as parsed.
     */
    public static int parseColor(String text) {
        HookStatus.invoked(FamilyNames.AMOLED_THEME);
        return withoutToken(Color.parseColor(text));
    }

    /**
     * A background a React Native screen sets on a view (ReactColours), such as the strip behind
     * Marketplace home's chips. It comes from the screen's JavaScript with no token, so it takes
     * route four's rule.
     */
    static int react(int color) {
        HookStatus.invoked(FamilyNames.AMOLED_THEME);
        return withoutToken(color);
    }

    /**
     * Whether route four's rule takes [color] as one of AMOLED's, black and the Background colour
     * included, even where it gives the colour back as it came. With a Background colour of
     * #212121 a card's #333334 comes back as #333334, so only this says AMOLED decided it.
     */
    static boolean ownsWithoutToken(int color) {
        return isDarkNeutral(color, MAX_SERVER_CARD_CHANNEL) && DarkMode.on();
    }

    /** Route four's rule for a colour that comes with no token. */
    private static int withoutToken(int color) {
        if (!ownsWithoutToken(color)) return color;
        if (color == BLACK || color == background) return color;
        return isDarkNeutral(color, MAX_CHANNEL) ? background : raise(background, color - RAISED_SHIFT * 0x010101);
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
        return color == background && !DarkMode.on() ? lightMode(color, array.getResourceId(index, 0)) : color;
    }

    /** Facebook's own colour for resource {@code id} when route two wrote {@code color} there in light mode. */
    static int lightMode(int color, int id) {
        if (color != background || DarkMode.on()) return color;
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

    /** Filled in by the patch: the Background colour option's colour, black when it's blank. */
    public static int backgroundColour() {
        return BLACK;
    }

    /** Package-visible for tests: puts a background colour of {@link #backgroundColour}'s kind in use. */
    static void useBackground(int colour) {
        background = colour;
    }

    /** {@code base} with each channel of {@code step} added, as far as white. Both are opaque. */
    static int raise(int base, int step) {
        int red = Math.min(0xFF, ((base >> 16) & 0xFF) + ((step >> 16) & 0xFF));
        int green = Math.min(0xFF, ((base >> 8) & 0xFF) + ((step >> 8) & 0xFF));
        int blue = Math.min(0xFF, (base & 0xFF) + (step & 0xFF));
        return BLACK | red << 16 | green << 8 | blue;
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
     * @return the background colour (black by default) for an opaque dark grey in the dark theme,
     * or {@code color} unchanged.
     */
    public static int statusBar(int color, boolean dark) {
        HookStatus.invoked(FamilyNames.AMOLED_THEME);
        return dark && color != BLACK && isDarkNeutral(color, MAX_BAR_CHANNEL) ? background : color;
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
     * @return the background colour (black by default) for an opaque dark grey in the dark theme,
     * or {@code color} unchanged.
     */
    public static int navigationBar(int color, boolean dark) {
        HookStatus.invoked(FamilyNames.AMOLED_THEME);
        return dark && color != BLACK && isDarkNeutral(color, MAX_CHANNEL) ? background : color;
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
