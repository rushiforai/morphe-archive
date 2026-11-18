package app.hushmessenger.extension;

import android.app.Activity;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
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
import org.robolectric.annotation.LooperMode;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class IosBarsTest {
    private static final int BAR = 60, COMPOSER = 90;

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
        activity.setContentView(chat);
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
