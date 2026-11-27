package app.hushmessenger.extension;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.RecyclerView;
import com.facebook.litho.LithoView;
import java.time.Duration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.LooperMode;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class IosBarsTest {
    private static final int BAR = 60, COMPOSER = 90, STRIP = 24;

    private ActivityController<Activity> controller;
    private Activity activity;
    private FrameLayout chat;
    private LinearLayout bar, composer;
    private RecyclerView list;
    private Drawable barPaint, composerPaint;
    private ViewOutlineProvider barOutline;
    private float barZ;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        IosBars.resetForTests();
    }

    @After public void close() {
        IosBars.resetForTests();
        if (controller != null) controller.pause().stop().destroy();
    }

    /** A chat like Messenger's: the name and call buttons on top, the messages, then the message box. */
    private void openChat(boolean bars) {
        buildChat(bars);
        activity.setContentView(chat);
        showChat(bars);
    }

    private void buildChat(boolean bars) {
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
        chat = new FrameLayout(activity);
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        list = new RecyclerView(activity);
        if (bars) {
            bar = new LinearLayout(activity);
            bar.setBackgroundColor(0xFF102030);
            column.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, BAR));
        }
        column.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        if (bars) {
            composer = new LinearLayout(activity);
            composer.setBackgroundColor(0xFF203040);
            column.addView(composer, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, COMPOSER));
        }
        chat.addView(column);
    }

    private void showChat(boolean bars) {
        idle();
        if (bars) {
            barPaint = bar.getBackground();
            composerPaint = composer.getBackground();
            barOutline = bar.getOutlineProvider();
            barZ = bar.getZ();
        }
        IosBars.chatShown(new Object(), chat);
        idle();
    }

    private void on() {
        Settings.preferences.edit().putBoolean(IosBars.KEY, true).commit();
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1));
    }

    private LinearLayout.LayoutParams room() {
        return (LinearLayout.LayoutParams) list.getLayoutParams();
    }

    @Config(sdk = 36)
    @Test public void bothBarsGoSeeThroughAndTheMessagesGetTheirRoom() {
        on();
        openChat(true);
        assertTrue("The top bar has the messages behind it", bar.getBackground() instanceof LayerDrawable);
        LayerDrawable layers = (LayerDrawable) bar.getBackground();
        assertEquals(2, layers.getNumberOfLayers());
        assertTrue(layers.getDrawable(0) instanceof IosBars.Backdrop);
        assertTrue("The bar keeps its own colour over the blur", layers.getDrawable(1) instanceof ColorDrawable);
        assertEquals(0x102030, ((ColorDrawable) layers.getDrawable(1)).getColor() & 0xFFFFFF);
        assertEquals(IosBars.TINT, layers.getDrawable(1).getAlpha());
        assertEquals("The colour the bar had is never changed itself", 255, barPaint.getAlpha());
        assertSame(barPaint, ((IosBars.Frost) layers).own);
        assertTrue(composer.getBackground() instanceof LayerDrawable);

        assertEquals("The messages run under the top bar", BAR, list.getPaddingTop());
        assertEquals(COMPOSER, list.getPaddingBottom());
        assertEquals(-BAR, room().topMargin);
        assertEquals(-COMPOSER, room().bottomMargin);
        assertFalse(list.getClipToPadding());

        assertNull("No shadow under a raised bar", bar.getOutlineProvider());
        assertTrue("The bars draw over the messages", bar.getZ() > barZ);
        assertTrue(Settings.lastActive(IosBars.KEY) > 0);
        assertFalse(Settings.hookErrors.containsKey(IosBars.KEY));
    }

    /** [bar]'s blur drawn over red, standing in for the chat list a chat slides in over (#251). */
    private static Bitmap blurDrawnOverRed(View bar) {
        Drawable backdrop = ((IosBars.Frost) bar.getBackground()).getDrawable(0);
        Bitmap drawn = Bitmap.createBitmap(40, 20, Bitmap.Config.ARGB_8888);
        drawn.eraseColor(0xFFFF0000);
        backdrop.setBounds(0, 0, 40, 20);
        backdrop.draw(new Canvas(drawn));
        return drawn;
    }

    @Config(sdk = 36)
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Test public void theBlurSitsOnTheChatsOwnColourSoTheChatListNeverShowsThrough() {
        on();
        openChat(true);
        chat.setBackgroundColor(0x80FFFFFF);
        ((View) chat.getParent()).setBackgroundColor(0xFF0A0B0C);
        Bitmap drawn = blurDrawnOverRed(bar);
        assertEquals("A see-through colour is passed over for the solid one behind it", 0xFF0A0B0C, drawn.getPixel(20, 10));
        assertEquals(0xFF0A0B0C, drawn.getPixel(39, 19));
        assertEquals(0xFF0A0B0C, blurDrawnOverRed(composer).getPixel(0, 0));
    }

    @Config(sdk = 36)
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Test public void aChatWithNoSolidColourPutsTheBlurOnTheBarsOwnColour() {
        on();
        openChat(true);
        for (ViewParent at = list.getParent(); at instanceof View; at = at.getParent()) ((View) at).setBackground(null);
        assertEquals(0xFF102030, blurDrawnOverRed(bar).getPixel(20, 10));
        assertEquals(0xFF203040, blurDrawnOverRed(composer).getPixel(20, 10));
    }

    @Config(sdk = 36)
    @Test public void switchingItOffPutsTheChatBackAsItWas() {
        on();
        openChat(true);
        Settings.preferences.edit().putBoolean(IosBars.KEY, false).commit();
        IosBars.look(chat, true);

        assertSame(barPaint, bar.getBackground());
        assertEquals("The bar's colour is solid again", 255, bar.getBackground().getAlpha());
        assertSame(composerPaint, composer.getBackground());
        assertEquals(255, composer.getBackground().getAlpha());
        assertEquals(0, list.getPaddingTop());
        assertEquals(0, list.getPaddingBottom());
        assertEquals(0, room().topMargin);
        assertEquals(0, room().bottomMargin);
        assertTrue(list.getClipToPadding());
        assertSame(barOutline, bar.getOutlineProvider());
        assertEquals(barZ, bar.getZ(), 0f);
        assertFalse(Settings.hookErrors.containsKey(IosBars.KEY));
    }

    /** A chat lays itself out for every message, and each of those layouts has to leave the room exactly as it is. */
    @Config(sdk = 36)
    @Test public void theNextLayoutDoesntGiveTheMessagesTheSameRoomTwice() {
        on();
        openChat(true);
        Drawable frosted = bar.getBackground();
        IosBars.clock = () -> 1_000_000L;
        IosBars.look(chat, false);
        IosBars.look(chat, true);
        idle();

        assertSame(frosted, bar.getBackground());
        assertEquals(2, ((LayerDrawable) bar.getBackground()).getNumberOfLayers());
        assertEquals(BAR, list.getPaddingTop());
        assertEquals(COMPOSER, list.getPaddingBottom());
        assertEquals(-BAR, room().topMargin);
        assertEquals(-COMPOSER, room().bottomMargin);
        assertEquals(barZ + 1f, bar.getZ(), 0f);
    }

    @Test public void aPhoneWithoutTheBlurIsLeftAlone() {
        IosBars.blurs = () -> false;
        on();
        openChat(true);
        assertSame(barPaint, bar.getBackground());
        assertSame(composerPaint, composer.getBackground());
        assertEquals(0, list.getPaddingTop());
        assertEquals(0, room().topMargin);
        assertEquals(0, Settings.lastActive(IosBars.KEY));
    }

    @Test public void theSwitchOffLeavesEveryChatAlone() {
        IosBars.blurs = () -> true;
        openChat(true);
        assertSame(barPaint, bar.getBackground());
        assertSame(composerPaint, composer.getBackground());
        assertEquals(0, list.getPaddingTop());
        assertEquals(0, room().bottomMargin);
        assertEquals(0, Settings.lastActive(IosBars.KEY));
    }

    /** A screen with messages and nothing around them has no bars to find, and nothing is touched there. */
    @Test public void aChatWithNoBarsIsLeftAlone() {
        IosBars.blurs = () -> true;
        on();
        openChat(false);
        assertNull(IosBars.barsIn(chat));
        assertEquals(0, list.getPaddingTop());
        assertEquals(0, Settings.lastActive(IosBars.KEY));
        assertFalse(Settings.hookErrors.containsKey(IosBars.KEY));
    }

    @Test public void theBarsAreTheViewsAboveAndBelowTheMessages() {
        openChat(true);
        IosBars.Bars found = IosBars.barsIn(chat);
        assertNotNull(found);
        assertSame(list, found.list);
        assertSame(list, found.grown);
        assertSame(bar, found.top);
        assertSame(composer, found.bottom);
    }

    /**
     * Messenger 587's chat: the top bar sits two levels out from the messages and the message box one, both are Litho
     * views that Litho gives their colour as the view's background, and the list is drawn inside a Litho view of its
     * own that also holds the button back to the newest message. Only that view grows, so the banner over the messages
     * stays where it was and the button stays above the message box.
     */
    @Config(sdk = 36)
    @Test public void aLithoChatGrowsOnlyTheListsOwnViewAndKeepsItsBarsFrosted() {
        on();
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
        int match = ViewGroup.LayoutParams.MATCH_PARENT;
        chat = new FrameLayout(activity);
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        LithoView top = new LithoView(activity);
        ColorDrawable topPaint = new ColorDrawable(0xFF000000);
        top.setBackground(topPaint);
        root.addView(top, new LinearLayout.LayoutParams(match, BAR));
        FrameLayout body = new FrameLayout(activity);
        root.addView(body, new LinearLayout.LayoutParams(match, 0, 1));
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        body.addView(column, new FrameLayout.LayoutParams(match, match));
        FrameLayout coordinator = new FrameLayout(activity);
        column.addView(coordinator, new LinearLayout.LayoutParams(match, 0, 1));
        View banner = new View(activity);
        coordinator.addView(banner, new FrameLayout.LayoutParams(match, 40));
        FrameLayout frame = new FrameLayout(activity);
        coordinator.addView(frame, new FrameLayout.LayoutParams(match, match));
        LithoView listHost = new LithoView(activity);
        frame.addView(listHost, new FrameLayout.LayoutParams(match, match));
        list = new RecyclerView(activity);
        listHost.addView(list);
        View jump = new View(activity);
        listHost.addView(jump);
        LithoView composerHost = new LithoView(activity);
        ColorDrawable boxPaint = new ColorDrawable(0xFF202020);
        composerHost.setBackground(boxPaint);
        column.addView(composerHost, new LinearLayout.LayoutParams(match, COMPOSER));
        chat.addView(root);
        activity.setContentView(chat);
        idle();
        Rect bannerWas = screen(banner), jumpWas = screen(jump);

        IosBars.Bars found = IosBars.barsIn(chat);
        assertNotNull(found);
        assertSame(list, found.list);
        assertSame("The list's own Litho view is what grows", listHost, found.grown);
        assertSame("The top bar is found two levels out", top, found.top);
        assertSame(composerHost, found.bottom);

        IosBars.chatShown(new Object(), chat);
        idle();
        idle();
        FrameLayout.LayoutParams room = (FrameLayout.LayoutParams) listHost.getLayoutParams();
        assertEquals(-BAR, room.topMargin);
        assertEquals(-COMPOSER, room.bottomMargin);
        assertEquals(BAR, list.getPaddingTop());
        assertEquals(COMPOSER, list.getPaddingBottom());
        assertFalse(list.getClipToPadding());
        assertTrue("The views around the list still cut it off at the bars", frame.getClipChildren());
        assertTrue(coordinator.getClipChildren());
        assertTrue(column.getClipChildren());
        assertTrue(body.getClipChildren());
        assertEquals("The banner over the messages stays put", bannerWas, screen(banner));
        assertEquals("The button back to the newest message stays above the message box", -COMPOSER, jump.getTranslationY(), 0f);
        assertEquals(jumpWas, screen(jump));

        assertFrosted(top, topPaint);
        assertFrosted(composerHost, boxPaint);

        // Litho gives a bar its own colour back, and puts a button's translation back, whenever it mounts them again.
        ColorDrawable topAgain = new ColorDrawable(0xFF000000), boxAgain = new ColorDrawable(0xFF202020);
        top.setBackground(topAgain);
        composerHost.setBackground(boxAgain);
        jump.setTranslationY(0f);
        IosBars.upkeep(chat);
        Drawable frosted = top.getBackground();
        IosBars.upkeep(chat);
        assertFrosted(top, topAgain);
        assertFrosted(composerHost, boxAgain);
        assertSame("A bar that's still frosted is left as it is", frosted, top.getBackground());
        assertEquals(-COMPOSER, jump.getTranslationY(), 0f);
        assertFalse(Settings.hookErrors.containsKey(IosBars.KEY));

        Settings.preferences.edit().putBoolean(IosBars.KEY, false).commit();
        IosBars.look(chat, true);
        idle();
        assertEquals(0, room.topMargin);
        assertEquals(0, room.bottomMargin);
        assertEquals(0, list.getPaddingTop());
        assertTrue(list.getClipToPadding());
        assertSame("Each bar gets back the colour Litho gave it last", topAgain, top.getBackground());
        assertSame(boxAgain, composerHost.getBackground());
        assertEquals(255, topAgain.getAlpha());
        assertEquals(0f, jump.getTranslationY(), 0f);
        assertEquals(jumpWas, screen(jump));
    }

    /**
     * Messenger 588's chat screen: its own strip behind the status bar and the chat below it sit side by side in the
     * window's content, so the strip isn't in the chat. [gap] puts that much room between the strip and the chat.
     */
    private View openChatUnderStrip(int gap) {
        return openChatUnderStrip(gap, false);
    }

    /** With [counting], the strip counts how often it's asked to draw again. */
    private View openChatUnderStrip(int gap, boolean counting) {
        buildChat(true);
        FrameLayout content = new FrameLayout(activity);
        View strip = counting ? new CountingStrip(activity) : new View(activity);
        strip.setBackground(new ColorDrawable(0xFF000000));
        content.addView(strip, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, STRIP));
        FrameLayout.LayoutParams below = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT);
        below.topMargin = STRIP + gap;
        content.addView(chat, below);
        activity.setContentView(content);
        showChat(true);
        idle();
        return strip;
    }

    /**
     * #252: the top bar's blur stopped under the solid strip Messenger keeps behind the status bar. The strip is frosted
     * too, under the top bar's colour, and the messages get its room as well, so they show blurred all the way up.
     */
    @Config(sdk = 36)
    @Test public void theStripBehindTheStatusBarGoesSeeThroughWithTheTopBar() {
        on();
        View strip = openChatUnderStrip(0);
        Drawable stripPaint = ((IosBars.Frost) strip.getBackground()).own;
        assertEquals(0xFF000000, ((ColorDrawable) stripPaint).getColor());
        LayerDrawable layers = (LayerDrawable) strip.getBackground();
        assertEquals(2, layers.getNumberOfLayers());
        assertTrue(layers.getDrawable(0) instanceof IosBars.Backdrop);
        assertEquals("The strip takes the top bar's colour, so the two read as one bar",
            0x102030, ((ColorDrawable) layers.getDrawable(1)).getColor() & 0xFFFFFF);
        assertEquals(IosBars.TINT, layers.getDrawable(1).getAlpha());
        assertEquals(255, stripPaint.getAlpha());
        assertFrosted(bar, (ColorDrawable) barPaint);

        assertEquals("The messages reach up under the strip too", BAR + STRIP, list.getPaddingTop());
        assertEquals(-(BAR + STRIP), room().topMargin);
        assertEquals(COMPOSER, list.getPaddingBottom());
        assertEquals(0, screen(list).top - screen(strip).top);
        assertTrue("The chat still cuts the messages off at its top", chat.getClipChildren());

        // A layout later changes nothing, and Messenger painting the strip again gets the blur put back.
        Drawable frosted = strip.getBackground();
        IosBars.look(chat, true);
        IosBars.upkeep(chat);
        assertSame(frosted, strip.getBackground());
        assertEquals(BAR + STRIP, list.getPaddingTop());
        ColorDrawable again = new ColorDrawable(0xFF000000);
        strip.setBackground(again);
        IosBars.upkeep(chat);
        assertSame(again, ((IosBars.Frost) strip.getBackground()).own);

        Settings.preferences.edit().putBoolean(IosBars.KEY, false).commit();
        IosBars.look(chat, true);
        assertSame("The strip gets back the colour it had last", again, strip.getBackground());
        assertEquals(0, list.getPaddingTop());
        assertEquals(0, room().topMargin);
        assertFalse(Settings.hookErrors.containsKey(IosBars.KEY));
    }

    static final class CountingStrip extends View {
        int redraws;

        CountingStrip(android.content.Context context) {
            super(context);
        }

        @Override public void invalidate() {
            redraws++;
            super.invalidate();
        }
    }

    /**
     * #252: the strip sits outside the chat, so moving the messages never drew it again and it kept the frame from
     * before the list grew under it, solid black on the phone. Each move draws it again along with both bars.
     */
    @Config(sdk = 36)
    @Test public void theStripIsDrawnAgainAsTheMessagesMove() {
        on();
        CountingStrip strip = (CountingStrip) openChatUnderStrip(0, true);
        assertTrue(strip.getBackground() instanceof IosBars.StripFrost);
        strip.redraws = 0;
        IosBars.redraw(chat);
        assertEquals("The strip draws the messages now behind it", 1, strip.redraws);
        IosBars.redraw(chat);
        assertEquals(2, strip.redraws);

        Settings.preferences.edit().putBoolean(IosBars.KEY, false).commit();
        IosBars.look(chat, true);
        strip.redraws = 0;
        IosBars.redraw(chat);
        assertEquals("Switched off, nothing is drawn again for it", 0, strip.redraws);
        assertFalse(Settings.hookErrors.containsKey(IosBars.KEY));
    }

    /**
     * A chat opened from the chat list has no strip over it, only the window, so the parent at the top of the window
     * paints the frost in a band as high as the room over the top bar, and only while the top bar shows (#252).
     */
    @Config(sdk = 36)
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Test public void aChatWithNothingOverItGetsTheFrostInTheWindowsTopBand() {
        on();
        buildChat(true);
        activity.getWindow().requestFeature(android.view.Window.FEATURE_NO_TITLE);
        FrameLayout content = new FrameLayout(activity);
        ColorDrawable contentPaint = new ColorDrawable(0xFF000000);
        content.setBackground(contentPaint);
        FrameLayout.LayoutParams below = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT);
        below.topMargin = STRIP;
        content.addView(chat, below);
        activity.setContentView(content);
        showChat(true);
        idle();

        assertTrue(content.getBackground() instanceof IosBars.Frost);
        assertSame(contentPaint, ((IosBars.Frost) content.getBackground()).own);
        assertEquals(BAR + STRIP, list.getPaddingTop());
        assertEquals(-(BAR + STRIP), room().topMargin);
        Drawable band = content.getBackground();
        // The window's own colour would be the blur's base, so the base is the top bar's colour here.
        for (ViewParent at = content.getParent(); at instanceof View; at = at.getParent()) ((View) at).setBackground(null);
        band.setBounds(0, 0, content.getWidth(), content.getHeight());
        assertEquals("Only the band over the top bar is frosted", STRIP, ((LayerDrawable) band).getDrawable(0).getBounds().height());
        Bitmap drawn = Bitmap.createBitmap(content.getWidth(), content.getHeight(), Bitmap.Config.ARGB_8888);
        band.draw(new Canvas(drawn));
        assertEquals("The band takes the top bar's colour", 0xFF102030, drawn.getPixel(10, STRIP / 2));
        assertEquals("Under the band the parent keeps its own colour", 0xFF000000, drawn.getPixel(10, STRIP + BAR + 10));

        bar.setVisibility(View.GONE);
        drawn.eraseColor(0);
        band.draw(new Canvas(drawn));
        assertEquals("With the top bar gone (back on the chat list) the band is the parent's own colour again",
            0xFF000000, drawn.getPixel(10, STRIP / 2));
        bar.setVisibility(View.VISIBLE);

        Settings.preferences.edit().putBoolean(IosBars.KEY, false).commit();
        IosBars.look(chat, true);
        assertSame(contentPaint, content.getBackground());
        assertEquals(0, list.getPaddingTop());
        assertFalse(Settings.hookErrors.containsKey(IosBars.KEY));
    }

    /** A view at the top that doesn't touch the chat's top bar isn't the status bar's strip, and stays as it is. */
    @Config(sdk = 36)
    @Test public void aStripThatDoesntTouchTheTopBarIsLeftAlone() {
        on();
        View strip = openChatUnderStrip(20);
        assertTrue(strip.getBackground() instanceof ColorDrawable);
        assertFrosted(bar, (ColorDrawable) barPaint);
        assertEquals(BAR, list.getPaddingTop());
        assertEquals(-BAR, room().topMargin);
    }

    /** [bar] shows the blur under a see-through copy of [own], and [own] itself is untouched. */
    private static void assertFrosted(View bar, ColorDrawable own) {
        assertTrue(bar.getBackground() instanceof IosBars.Frost);
        IosBars.Frost frost = (IosBars.Frost) bar.getBackground();
        assertSame(own, frost.own);
        assertEquals(2, frost.getNumberOfLayers());
        assertTrue(frost.getDrawable(0) instanceof IosBars.Backdrop);
        assertNotSame(own, frost.getDrawable(1));
        assertEquals(IosBars.TINT, frost.getDrawable(1).getAlpha());
        assertEquals(255, own.getAlpha());
    }

    /** A colour with no copy to make is drawn through a see-through layer as it is, and is never changed itself. */
    @Config(sdk = 36)
    @Test public void aColourThatCantBeCopiedIsDrawnSeeThroughAsItIs() {
        on();
        int[] alphaSets = {0};
        Drawable plain = new Drawable() {
            @Override public void draw(android.graphics.Canvas canvas) { }
            @Override public void setAlpha(int alpha) { alphaSets[0]++; }
            @Override public void setColorFilter(android.graphics.ColorFilter filter) { }
            @Override public int getOpacity() { return android.graphics.PixelFormat.OPAQUE; }
        };
        openChat(true);
        Settings.preferences.edit().putBoolean(IosBars.KEY, false).commit();
        IosBars.look(chat, true);
        idle();
        bar.setBackground(plain);
        on();
        IosBars.look(chat, true);
        idle();

        IosBars.Frost frost = (IosBars.Frost) bar.getBackground();
        assertTrue(frost.getDrawable(1) instanceof IosBars.Faded);
        assertSame(plain, ((IosBars.Faded) frost.getDrawable(1)).own);
        Settings.preferences.edit().putBoolean(IosBars.KEY, false).commit();
        IosBars.look(chat, true);
        assertSame(plain, bar.getBackground());
        assertEquals("The colour is never made see-through itself", 0, alphaSets[0]);
        assertFalse(Settings.hookErrors.containsKey(IosBars.KEY));
    }

    private static Rect screen(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return new Rect(at[0], at[1], at[0] + view.getWidth(), at[1] + view.getHeight());
    }

    @Test public void theSwitchSitsUnderThemeAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals(IosBars.KEY)) spec = control;
        assertNotNull(spec);
        assertEquals("Translucent chat bars", spec[1]);
        assertEquals("theme", spec[3]);
        assertTrue(Settings.installed.contains(IosBars.KEY));
        assertFalse(Settings.preferences.getBoolean(IosBars.KEY, false));
    }
}
