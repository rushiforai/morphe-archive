/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/** The one colour rule the resolver hooks and the parseColor reroute share. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AmoledThemeTest {
    /** Stands in for Facebook's colour token enums: only the constant names matter. */
    enum Token { CARD_BACKGROUND, COMMENT_BACKGROUND, POPOVER_BACKGROUND, WASH, DIVIDER, PRIMARY_TEXT,
        PRIMARY_UI, BACKGROUND_PRIMARY_UI }

    private static final int BLACK = 0xFF000000;

    @Test
    public void aDarkGreyBackgroundTurnsBlack() {
        assertEquals(BLACK, AmoledTheme.apply(0xFF252728, Token.CARD_BACKGROUND));
        assertEquals(BLACK, AmoledTheme.apply(0xFF101011, Token.WASH));
    }

    /** The mutation controls: a divider, a lighter grey, a tinted banner and text keep theirs. */
    @Test
    public void everythingElseKeepsItsColour() {
        assertEquals("a divider token", 0xFF252728, AmoledTheme.apply(0xFF252728, Token.DIVIDER));
        assertEquals("above the raised band", 0xFF46484B, AmoledTheme.apply(0xFF46484B, Token.CARD_BACKGROUND));
        assertEquals("a dark colour with a hue", 0xFF1A2A10, AmoledTheme.apply(0xFF1A2A10, Token.CARD_BACKGROUND));
        assertEquals("light mode's white card", 0xFFFFFFFF, AmoledTheme.apply(0xFFFFFFFF, Token.CARD_BACKGROUND));
        assertEquals("no token to go on", 0xFF252728, AmoledTheme.apply(0xFF252728, "CARD_BACKGROUND"));
    }

    /**
     * Issue #27: Facebook's dark cards are #333334 on the black page AMOLED leaves (a Page card, a
     * post, the profile's composer bar), its popovers #3B3C3E, or #3E4042 on the Video tab. They
     * turn near black, apart from the page and each still a step above the surface under it.
     */
    @Test
    public void aDarkCardTurnsNearBlack() {
        assertEquals("a card", 0xFF121213, AmoledTheme.apply(0xFF333334, Token.CARD_BACKGROUND));
        assertEquals("a comment", 0xFF121213, AmoledTheme.apply(0xFF333334, Token.COMMENT_BACKGROUND));
        assertEquals("a popover", 0xFF1A1B1D, AmoledTheme.apply(0xFF3B3C3E, Token.POPOVER_BACKGROUND));
        assertEquals("the Video tab's popover", 0xFF1D1F21, AmoledTheme.apply(0xFF3E4042, Token.POPOVER_BACKGROUND));
        assertEquals("the older palette's card", 0xFF191A1B, AmoledTheme.apply(0xFF3A3B3C, Token.CARD_BACKGROUND));
        assertEquals("just above the black band, still not black", 0xFF0A0A0A,
                AmoledTheme.apply(0xFF2B2B2B, Token.CARD_BACKGROUND));
    }

    /**
     * PRIMARY_UI is Mig's fill for an input or a pill, such as a search field, not a card: it shows
     * only through this fill, so a card's near black would leave it at about 1.1:1 against the black
     * page. It goes down less than a card, to about #262627, near 1.5:1. BACKGROUND_PRIMARY_UI is
     * FDS's counterpart. A card stays at the near black #27 already gives it.
     */
    @Test
    public void anInputOrPillFillStaysVisibleOnTheBlackPage() {
        assertEquals("PRIMARY_UI", 0xFF262627, AmoledTheme.apply(0xFF333334, Token.PRIMARY_UI));
        assertEquals("BACKGROUND_PRIMARY_UI", 0xFF262627, AmoledTheme.apply(0xFF333334, Token.BACKGROUND_PRIMARY_UI));
        assertEquals("a card still goes near black", 0xFF121213, AmoledTheme.apply(0xFF333334, Token.CARD_BACKGROUND));
    }

    /** The mutation controls for #27: light mode, other tokens, lighter greys, a hue and no token. */
    @Test
    public void aCardOutsideTheRaisedBandKeepsItsColour() {
        assertEquals("a divider", 0xFF3A3B3C, AmoledTheme.apply(0xFF3A3B3C, Token.DIVIDER));
        assertEquals("text", 0xFF333334, AmoledTheme.apply(0xFF333334, Token.PRIMARY_TEXT));
        assertEquals("a button's grey, above the band", 0xFF46484B, AmoledTheme.apply(0xFF46484B, Token.POPOVER_BACKGROUND));
        assertEquals("a translucent card", 0x99333334, AmoledTheme.apply(0x99333334, Token.COMMENT_BACKGROUND));
        assertEquals("a card with a hue", 0xFF2E3A44, AmoledTheme.apply(0xFF2E3A44, Token.CARD_BACKGROUND));
        assertEquals("no token to go on", 0xFF333334, AmoledTheme.apply(0xFF333334, "CARD_BACKGROUND"));

        DarkMode.answer(false);
        assertEquals("light mode, the Video tab's dark card", 0xFF333334, AmoledTheme.apply(0xFF333334, Token.CARD_BACKGROUND));
        assertEquals("light mode, its popover", 0xFF3E4042, AmoledTheme.apply(0xFF3E4042, Token.POPOVER_BACKGROUND));
    }

    @Test
    public void aServerColourStringIsJudgedByItsValue() {
        assertEquals(BLACK, AmoledTheme.parseColor("#FF252728"));
        assertEquals(0xFF3A3B3C, AmoledTheme.parseColor("#3A3B3C"));
        assertEquals("a translucent scrim stays", 0x80252728, AmoledTheme.parseColor("#80252728"));
    }

    /**
     * Issue #27, the Page card in search results: Facebook builds its search results from server
     * templates, so the card's dark grey comes as text, #333334 on a phone and #333333 in the report,
     * through the parser route four sends here. No token says it's a card, so the grey does, and it
     * goes to the near black route one gives a card.
     */
    @Test
    public void aServerCardTurnsNearBlack() {
        assertEquals("the Page card", 0xFF121213, AmoledTheme.parseColor("#FF333334"));
        assertEquals("the reporter's card", 0xFF121212, AmoledTheme.parseColor("#333333"));
        assertEquals("the top of the card band", 0xFF151515, AmoledTheme.parseColor("#363636"));
        assertEquals("just above the black band, still not black", 0xFF0A0A0A, AmoledTheme.parseColor("#2B2B2B"));
    }

    /**
     * The card's "Write a message" input measured (71,71,72) on the #333334 card: Facebook's 10%
     * white over it. That fill stays translucent, so on the near black card the input still comes
     * out lighter than the #262627 an input's own fill keeps under route one.
     */
    @Test
    public void theServerCardsInputStaysVisible() {
        int input = AmoledTheme.parseColor("#19FFFFFF");
        assertEquals("the input's fill stays translucent", 0x19FFFFFF, input);
        int card = AmoledTheme.parseColor("#FF333334");
        assertEquals("before, on Facebook's card", 0xFF474748, over(input, 0xFF333334));
        int onCard = over(input, card);
        assertEquals("on the near black card", 0xFF29292A, onCard);
        for (int shift : new int[]{16, 8, 0}) {
            assertTrue("each channel at least route one's input fill", ((onCard >> shift) & 0xFF) >= 0x26);
        }
    }

    /**
     * The controls: the next greys up a server sends (a button's, a popover's, a divider's) show
     * only through their own fill and keep it, and so does a translucent grey, one with a hue, and
     * every grey in light mode.
     */
    @Test
    public void aServerGreyAboveTheCardBandKeepsItsColour() {
        assertEquals("the older palette's button", 0xFF3A3B3C, AmoledTheme.parseColor("#3A3B3C"));
        assertEquals("a popover", 0xFF3B3C3E, AmoledTheme.parseColor("#3B3C3E"));
        assertEquals("a divider", 0xFF3E4042, AmoledTheme.parseColor("#3E4042"));
        assertEquals("just above the card band", 0xFF373737, AmoledTheme.parseColor("#373737"));
        assertEquals("a translucent card", 0x99333334, AmoledTheme.parseColor("#99333334"));
        assertEquals("a dark brown", 0xFF34302A, AmoledTheme.parseColor("#34302A"));

        DarkMode.answer(false);
        assertEquals("light mode, a server card", 0xFF333334, AmoledTheme.parseColor("#FF333334"));
        assertEquals("light mode, a server background", 0xFF252728, AmoledTheme.parseColor("#FF252728"));
    }

    /**
     * Marketplace home, a React Native screen, sets its backgrounds from its JavaScript with no token
     * (ReactColours): the strip behind its chips is #252728, which goes black like a server
     * background. The selected chip's see-through blue, a scrim and light mode keep theirs.
     */
    @Test
    public void aReactBackgroundIsJudgedByItsValue() {
        assertEquals("the strip behind Marketplace's chips", BLACK, AmoledTheme.react(0xFF252728));
        assertEquals("a card", 0xFF121213, AmoledTheme.react(0xFF333334));
        assertEquals("the selected chip", 0x331D85FC, AmoledTheme.react(0x331D85FC));
        assertEquals("a translucent scrim stays", 0x80252728, AmoledTheme.react(0x80252728));
        assertEquals("white", 0xFFFFFFFF, AmoledTheme.react(0xFFFFFFFF));

        DarkMode.answer(false);
        assertEquals("light mode", 0xFF252728, AmoledTheme.react(0xFF252728));
    }

    /** {@code top}, a colour with alpha, drawn over the opaque {@code under}, rounded as a screen does. */
    private static int over(int top, int under) {
        int alpha = top >>> 24;
        int out = 0xFF000000;
        for (int shift : new int[]{16, 8, 0}) {
            int blended = (((top >> shift) & 0xFF) * alpha + ((under >> shift) & 0xFF) * (255 - alpha) + 127) / 255;
            out |= blended << shift;
        }
        return out;
    }

    @Test(expected = IllegalArgumentException.class)
    public void aStringThatIsNoColourThrowsAsBefore() {
        AmoledTheme.parseColor("not a colour");
    }

    /**
     * Issue #22: back from Recent Apps, the Video tab's bar is painted #333334, the colour its
     * CARD_BACKGROUND_DARK token resolves to, and Facebook's home bar #252728.
     */
    @Test
    public void aDarkThemeStatusBarTurnsBlack() {
        assertEquals("the Video tab's bar", BLACK, AmoledTheme.statusBar(0xFF333334, true));
        assertEquals("the home bar", BLACK, AmoledTheme.statusBar(0xFF252728, true));
        assertEquals("the lightest chrome grey", BLACK, AmoledTheme.statusBar(0xFF3A3B3C, true));
    }

    /** Light mode asks the same token for the same #333334, and its bars keep Facebook's colours. */
    @Test
    public void aLightThemeStatusBarKeepsItsColour() {
        assertEquals("the Video tab's bar", 0xFF333334, AmoledTheme.statusBar(0xFF333334, false));
        assertEquals("a white bar", 0xFFFFFFFF, AmoledTheme.statusBar(0xFFFFFFFF, false));
    }

    /** The mutation controls for the dark theme: only an opaque dark grey turns black. */
    @Test
    public void aDarkThemeStatusBarThatIsNoDarkGreyKeepsItsColour() {
        assertEquals("edge to edge", 0x00000000, AmoledTheme.statusBar(0x00000000, true));
        assertEquals("a translucent scrim", 0x80333334, AmoledTheme.statusBar(0x80333334, true));
        assertEquals("above the bar threshold", 0xFF4B4C4F, AmoledTheme.statusBar(0xFF4B4C4F, true));
        assertEquals("a dark colour with a hue", 0xFF1A2A10, AmoledTheme.statusBar(0xFF1A2A10, true));
        assertEquals("a white bar", 0xFFFFFFFF, AmoledTheme.statusBar(0xFFFFFFFF, true));
    }

    /**
     * The Video tab keeps a dark surface in light mode and writes its bars' #252728 into code for
     * both themes. Route three leaves that colour for the bar hooks, which keep it in light mode.
     */
    @Test
    public void lightModeKeepsTheVideoTabsWrittenBarColour() {
        assertEquals("status bar", 0xFF252728, AmoledTheme.statusBar(0xFF252728, false));
        assertEquals("navigation bar", 0xFF252728, AmoledTheme.navigationBar(0xFF252728, false));
        assertEquals("navigation bar, dark", BLACK, AmoledTheme.navigationBar(0xFF252728, true));
    }

    /** The navigation bar keeps route three's band: the lighter grey under a sheet keeps its colour. */
    @Test
    public void aDarkThemeNavigationBarThatIsNoDarkGreyKeepsItsColour() {
        assertEquals("a sheet's grey", 0xFF333334, AmoledTheme.navigationBar(0xFF333334, true));
        assertEquals("translucent", 0x26C9CCD1, AmoledTheme.navigationBar(0x26C9CCD1, true));
        assertEquals("a dark colour with a hue", 0xFF1A2A10, AmoledTheme.navigationBar(0xFF1A2A10, true));
        assertEquals("a white bar", 0xFFFFFFFF, AmoledTheme.navigationBar(0xFFFFFFFF, true));
    }

    /**
     * The bar's black stays the bar's: a resolver's #333334 card gets a card's near black, and so
     * does a server's (#27), neither the bar's black.
     */
    @Test
    public void theBarThresholdDoesNotReachTheOtherRoutes() {
        assertEquals(0xFF121213, AmoledTheme.apply(0xFF333334, Token.CARD_BACKGROUND));
        assertEquals(0xFF121213, AmoledTheme.parseColor("#FF333334"));
    }

    @After
    public void darkModeAsBefore() {
        DarkMode.answer(true);
        AmoledTheme.useRouteTwo(null);
        AmoledTheme.useBackground(BLACK);
    }

    /** Route two's black over the Video tab's #252728, as the patched resource table gives it. */
    private static Context routeTwo() {
        AmoledTheme.useRouteTwo(Integer.toHexString(ColourResources.VIDEO_BAR) + "=ff252728");
        return ColourResources.context(Collections.singletonMap(ColourResources.VIDEO_BAR, BLACK));
    }

    private static TypedArray blackAttribute(Context context) {
        AttributeSet set = Robolectric.buildAttributeSet()
                .addAttribute(android.R.attr.textColor, "@android:color/black").build();
        return context.obtainStyledAttributes(set, new int[]{android.R.attr.textColor});
    }

    /**
     * Light mode on the Video tab. The tab stays dark there: its bottom bar is Context.getColor of
     * the #252728 Facebook's dark style also uses, and its themed context asks that dark style. Route
     * two writes that resource black and route one sees the same grey as in dark mode, so with
     * Facebook's own dark mode off a colour from the forced-dark Video context keeps its value.
     */
    @Test
    public void lightModeKeepsAColourFromTheForcedDarkVideoContext() {
        Context context = routeTwo();
        DarkMode.answer(false);

        assertEquals("the bottom bar, Context.getColor", 0xFF252728, AmoledTheme.getColor(context, ColourResources.VIDEO_BAR));
        assertEquals("Resources.getColor", 0xFF252728,
                AmoledTheme.getColor(context.getResources(), ColourResources.VIDEO_BAR));
        assertEquals("Resources.getColor with a theme", 0xFF252728,
                AmoledTheme.getColor(context.getResources(), ColourResources.VIDEO_BAR, context.getTheme()));
        assertEquals("a resolver's colour", 0xFF252728, AmoledTheme.apply(0xFF252728, Token.CARD_BACKGROUND));
        assertEquals("a server colour", 0xFF252728, AmoledTheme.parseColor("#FF252728"));

        AmoledTheme.useRouteTwo(Integer.toHexString(android.R.color.black) + "=ff252728");
        TypedArray attribute = blackAttribute(context);
        assertEquals("a theme attribute, TypedArray.getColor", 0xFF252728, AmoledTheme.getColor(attribute, 0, 0));
        attribute.recycle();
    }

    /** Dark mode keeps route two's black on the Video tab, and every other route's. */
    @Test
    public void darkModeKeepsTheVideoTabBlack() {
        Context context = routeTwo();
        DarkMode.answer(true);

        assertEquals("the bottom bar", BLACK, AmoledTheme.getColor(context, ColourResources.VIDEO_BAR));
        assertEquals("Resources.getColor", BLACK, AmoledTheme.getColor(context.getResources(), ColourResources.VIDEO_BAR));
        assertEquals("a resolver's colour", BLACK, AmoledTheme.apply(0xFF252728, Token.CARD_BACKGROUND));
        assertEquals("a server colour", BLACK, AmoledTheme.parseColor("#FF252728"));

        AmoledTheme.useRouteTwo(Integer.toHexString(android.R.color.black) + "=ff252728");
        TypedArray attribute = blackAttribute(context);
        assertEquals("a theme attribute", BLACK, AmoledTheme.getColor(attribute, 0, 0));
        attribute.recycle();
    }

    /** The controls: in light mode only a black route two wrote goes back, and only to its own colour. */
    @Test
    public void lightModeRestoresOnlyWhatRouteTwoWrote() {
        AmoledTheme.useRouteTwo("7f0601f4=ff252728;7f060149=ff080809");
        DarkMode.answer(false);
        Map<Integer, Integer> colours = new HashMap<>();
        colours.put(0x7f0601f4, BLACK);
        colours.put(0x7f060149, BLACK);
        colours.put(0x7f060150, BLACK);
        colours.put(0x7f060151, 0xFF333334);
        Context context = ColourResources.context(colours);

        assertEquals("its own colour", 0xFF080809, AmoledTheme.getColor(context, 0x7f060149));
        assertEquals("a black route two didn't write", BLACK, AmoledTheme.getColor(context, 0x7f060150));
        assertEquals("a colour that isn't black", 0xFF333334, AmoledTheme.getColor(context, 0x7f060151));
        assertEquals("Facebook's own black", BLACK, AmoledTheme.getColor(context, android.R.color.black));

        AmoledTheme.useRouteTwo(null);
        assertEquals("no table from the patch", BLACK, AmoledTheme.getColor(context, 0x7f0601f4));
    }

    /** A dark navy with a hue, as the patch's Background colour option can ask for (issue #34). */
    private static final int NAVY = 0xFF0D1117;

    /**
     * Issue #34: every background AMOLED turned black takes the Background colour, on each route and
     * both bars, and a card, a popover and an input's fill sit the same step above it that they sat
     * above black.
     */
    @Test
    public void aBackgroundColourTakesBlacksPlace() {
        AmoledTheme.useBackground(NAVY);

        assertEquals("a page", NAVY, AmoledTheme.apply(0xFF101011, Token.WASH));
        assertEquals("a surface", NAVY, AmoledTheme.apply(0xFF252728, Token.CARD_BACKGROUND));
        assertEquals("a card, #121213 above it", 0xFF1F232A, AmoledTheme.apply(0xFF333334, Token.CARD_BACKGROUND));
        assertEquals("a popover, #1A1B1D above it", 0xFF272C34, AmoledTheme.apply(0xFF3B3C3E, Token.POPOVER_BACKGROUND));
        assertEquals("an input's fill, #262627 above it", 0xFF33373E, AmoledTheme.apply(0xFF333334, Token.PRIMARY_UI));
        assertEquals("a server background", NAVY, AmoledTheme.parseColor("#FF252728"));
        assertEquals("a server card", 0xFF1F232A, AmoledTheme.parseColor("#FF333334"));
        assertEquals("the status bar", NAVY, AmoledTheme.statusBar(0xFF333334, true));
        assertEquals("the navigation bar", NAVY, AmoledTheme.navigationBar(0xFF252728, true));
    }

    /** The mutation controls for #34: Facebook's black, light mode and what AMOLED never touched keep theirs. */
    @Test
    public void aBackgroundColourLeavesTheRestAlone() {
        AmoledTheme.useBackground(NAVY);

        assertEquals("a resolver's black", BLACK, AmoledTheme.apply(BLACK, Token.WASH));
        assertEquals("a server's black", BLACK, AmoledTheme.parseColor("#FF000000"));
        assertEquals("a black status bar", BLACK, AmoledTheme.statusBar(BLACK, true));
        assertEquals("a black navigation bar", BLACK, AmoledTheme.navigationBar(BLACK, true));
        assertEquals("a divider token", 0xFF252728, AmoledTheme.apply(0xFF252728, Token.DIVIDER));
        assertEquals("above the raised band", 0xFF46484B, AmoledTheme.apply(0xFF46484B, Token.CARD_BACKGROUND));
        assertEquals("a light status bar", 0xFF333334, AmoledTheme.statusBar(0xFF333334, false));

        DarkMode.answer(false);
        assertEquals("light mode", 0xFF252728, AmoledTheme.apply(0xFF252728, Token.CARD_BACKGROUND));
        assertEquals("light mode's server colour", 0xFF252728, AmoledTheme.parseColor("#FF252728"));
    }

    /**
     * Route two writes the Background colour into Facebook's resources, and a resolver or a server
     * can hand it back. It comes back as it is: a grey in the raised band isn't raised a second time,
     * while a card still steps up from it.
     */
    @Test
    public void theBackgroundColourComesBackAsItIs() {
        int grey = 0xFF303030;
        AmoledTheme.useBackground(grey);

        assertEquals("a resolver", grey, AmoledTheme.apply(grey, Token.CARD_BACKGROUND));
        assertEquals("a server", grey, AmoledTheme.parseColor("#FF303030"));
        assertEquals("the status bar", grey, AmoledTheme.statusBar(grey, true));
        assertEquals("a card still steps up", 0xFF424243, AmoledTheme.apply(0xFF333334, Token.CARD_BACKGROUND));
    }

    /** Light mode reads the Background colour route two wrote as Facebook's colour, as it reads black. */
    @Test
    public void lightModeRestoresTheBackgroundColourRouteTwoWrote() {
        AmoledTheme.useBackground(NAVY);
        AmoledTheme.useRouteTwo(Integer.toHexString(ColourResources.VIDEO_BAR) + "=ff252728");
        Map<Integer, Integer> colours = new HashMap<>();
        colours.put(ColourResources.VIDEO_BAR, NAVY);
        colours.put(0x7f060150, BLACK);
        Context context = ColourResources.context(colours);

        DarkMode.answer(false);
        assertEquals("Facebook's colour", 0xFF252728, AmoledTheme.getColor(context, ColourResources.VIDEO_BAR));
        assertEquals("a black route two didn't write", BLACK, AmoledTheme.getColor(context, 0x7f060150));

        DarkMode.answer(true);
        assertEquals("dark mode keeps it", NAVY, AmoledTheme.getColor(context, ColourResources.VIDEO_BAR));
    }

    /** Black is the default, until the patch fills the option's colour in. */
    @Test
    public void theBackgroundIsBlackByDefault() {
        assertEquals(BLACK, AmoledTheme.backgroundColour());
        assertEquals(BLACK, AmoledTheme.apply(0xFF252728, Token.CARD_BACKGROUND));
        assertEquals("the step above black", 0xFF121213, AmoledTheme.raise(BLACK, 0xFF121213));
        assertEquals("as far as white", 0xFFFFFFFF, AmoledTheme.raise(0xFFF0F0F0, 0xFF353535));
    }
}
