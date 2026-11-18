package app.hushmessenger.extension;

import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Looper;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.RecyclerView;
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
        assertSame("The bar keeps its own colour over the blur", barPaint, layers.getDrawable(1));
        assertEquals(IosBars.TINT, layers.getDrawable(1).getAlpha());
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
