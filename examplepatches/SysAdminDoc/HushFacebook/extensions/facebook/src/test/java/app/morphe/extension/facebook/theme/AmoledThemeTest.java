/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertEquals;

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
    enum Token { CARD_BACKGROUND, WASH, DIVIDER, PRIMARY_TEXT }

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
        assertEquals("above the dark threshold", 0xFF3A3B3C, AmoledTheme.apply(0xFF3A3B3C, Token.CARD_BACKGROUND));
        assertEquals("a dark colour with a hue", 0xFF1A2A10, AmoledTheme.apply(0xFF1A2A10, Token.CARD_BACKGROUND));
        assertEquals("light mode's white card", 0xFFFFFFFF, AmoledTheme.apply(0xFFFFFFFF, Token.CARD_BACKGROUND));
        assertEquals("no token to go on", 0xFF252728, AmoledTheme.apply(0xFF252728, "CARD_BACKGROUND"));
    }

    @Test
    public void aServerColourStringIsJudgedByItsValue() {
        assertEquals(BLACK, AmoledTheme.parseColor("#FF252728"));
        assertEquals(0xFF3A3B3C, AmoledTheme.parseColor("#3A3B3C"));
        assertEquals("a translucent scrim stays", 0x80252728, AmoledTheme.parseColor("#80252728"));
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

    /** The bar's higher threshold stays the bar's: a resolver's #333334 card keeps its colour. */
    @Test
    public void theBarThresholdDoesNotReachTheOtherRoutes() {
        assertEquals(0xFF333334, AmoledTheme.apply(0xFF333334, Token.CARD_BACKGROUND));
        assertEquals(0xFF333334, AmoledTheme.parseColor("#FF333334"));
    }

    @After
    public void darkModeAsBefore() {
        DarkMode.answer(true);
        AmoledTheme.useRouteTwo(null);
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
}
