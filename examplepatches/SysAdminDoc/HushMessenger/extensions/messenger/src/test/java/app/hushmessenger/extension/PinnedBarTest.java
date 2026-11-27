package app.hushmessenger.extension;

import android.app.Activity;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.RecyclerView;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
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

/** #213: Hush's own pinned message bar, fed from the list See all opens, under the chat's name. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class PinnedBarTest {
    private static final int TITLE = 60, COMPOSER = 90;

    /** Pins as the patched build answers them, and the jumps asked for. */
    private static final class FakeSource implements PinnedBar.Source {
        List<PinnedBar.Pin> pins = new ArrayList<>();
        boolean encrypted = true, hold;
        final List<PinnedBar.Answer> held = new ArrayList<>();
        final List<String> jumps = new ArrayList<>();
        Object loadedFor, jumpedIn;
        int loads;

        @Override public boolean load(Object chat, PinnedBar.Answer answer) {
            loads++;
            loadedFor = chat;
            if (!encrypted) return false;
            if (hold) held.add(answer);
            else answer.pins(new ArrayList<>(pins));
            return true;
        }

        @Override public void jump(Object chat, String id) {
            jumpedIn = chat;
            jumps.add(id);
        }
    }

    private final Executor savedWorker = PinnedBar.worker;
    private final PinnedBar.Source savedSource = PinnedBar.source;
    private final FakeSource source = new FakeSource();
    private final Object fragment = new Object();
    private ActivityController<Activity> controller;
    private FrameLayout chat;
    private LinearLayout column, title, composer;
    private RecyclerView list;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        PinnedBar.worker = Runnable::run;
        PinnedBar.source = source;
    }

    @After public void close() {
        PinnedBar.worker = savedWorker;
        PinnedBar.source = savedSource;
        if (controller != null) controller.pause().stop().destroy();
        controller = null;
    }

    /** A chat like Messenger's: a column with the name on top, the messages, then the message box. */
    private void buildChat(boolean named) {
        if (controller != null) controller.pause().stop().destroy();
        controller = Robolectric.buildActivity(Activity.class).setup();
        Activity activity = controller.get();
        chat = new FrameLayout(activity);
        column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        title = new LinearLayout(activity);
        if (named) column.addView(title, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, TITLE));
        list = new RecyclerView(activity);
        column.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        composer = new LinearLayout(activity);
        if (named) column.addView(composer, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, COMPOSER));
        chat.addView(column);
        activity.setContentView(chat);
        idle();
    }

    private PinnedBar.Chat open() {
        buildChat(true);
        PinnedBar.Chat opened = PinnedBar.watch(fragment, chat);
        idle();
        return opened;
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1));
    }

    private static void on() {
        Settings.preferences.edit().putBoolean(PinnedBar.KEY, true).commit();
    }

    private static PinnedBar.Pin pin(String id, String text, long time) {
        return new PinnedBar.Pin(id, text, time);
    }

    private PinnedBar.Bar shown() {
        for (int i = 0; i < column.getChildCount(); i++)
            if (column.getChildAt(i) instanceof PinnedBar.Bar) return (PinnedBar.Bar) column.getChildAt(i);
        return null;
    }

    private void assertUntouched() {
        assertNull(shown());
        assertEquals(Arrays.asList(title, list, composer), Arrays.asList(column.getChildAt(0), column.getChildAt(1), column.getChildAt(2)));
        assertEquals(3, column.getChildCount());
    }

    @Test public void onShowsTheNewestPinRightUnderTheChatsName() {
        on();
        source.pins = Arrays.asList(pin("m1", "Older", 100), pin("m3", "Newest", 300), pin("m2", "Middle", 200));
        open();
        PinnedBar.Bar bar = shown();
        assertNotNull(bar);
        assertEquals(1, column.indexOfChild(bar));
        assertEquals(4, column.getChildCount());
        assertEquals("3 pinned messages", bar.title.getText().toString());
        assertEquals("Newest", bar.body.getText().toString());
        assertSame(fragment, source.loadedFor);
        assertTrue(Settings.activeAt.containsKey(PinnedBar.KEY));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void onePinReadsAsOneAndAnAttachmentSaysSo() {
        on();
        source.pins = Collections.singletonList(pin("m1", null, 100));
        open();
        assertEquals("Pinned message", shown().title.getText().toString());
        assertEquals("An attachment", shown().body.getText().toString());
    }

    @Test public void aTapJumpsToTheShownPin() {
        on();
        source.pins = Arrays.asList(pin("m1", "Older", 100), pin("m2", "Newest", 200));
        open();
        assertTrue(shown().performClick());
        assertEquals(Collections.singletonList("m2"), source.jumps);
        assertSame(fragment, source.jumpedIn);
    }

    @Test public void theChatsOwnViewSetupStartsItOnceAView() {
        on();
        source.pins = Collections.singletonList(pin("m1", "Hello", 100));
        buildChat(true);
        PinnedBar.chatShown(fragment, chat);
        PinnedBar.chatShown(fragment, chat);
        PinnedBar.chatShown(null, chat);
        PinnedBar.chatShown(fragment, null);
        idle();
        assertEquals(1, source.loads);
        assertNotNull(shown());
    }

    @Test public void offReadsNothingAndLeavesTheChatAlone() {
        source.pins = Collections.singletonList(pin("m1", "Hello", 100));
        PinnedBar.Chat opened = open();
        opened.onWindowFocusChanged(true);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(PinnedBar.AGAIN_MS + 100));
        assertEquals(0, source.loads);
        assertUntouched();
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void pauseAndSafeModeReadNothingAndLeaveTheChatAlone() {
        for (String state : new String[] {"paused", "safe"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(PinnedBar.KEY, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            Settings.activeAt.clear();
            source.loads = 0;
            source.pins = Collections.singletonList(pin("m1", "Hello", 100));
            open();
            assertEquals(state, 0, source.loads);
            assertUntouched();
            assertTrue(state, Settings.activeAt.isEmpty());
        }
    }

    @Test public void aChatWithNoPinsStaysAsItWas() {
        on();
        open();
        assertEquals(1, source.loads);
        assertUntouched();
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void aChatThatIsntEncryptedGetsNoBar() {
        on();
        source.encrypted = false;
        source.pins = Collections.singletonList(pin("m1", "Hello", 100));
        open();
        assertEquals(1, source.loads);
        assertUntouched();
    }

    @Test public void anUnreadableAnswerGetsNoBar() {
        on();
        source.hold = true;
        open();
        source.held.get(0).pins(null);
        idle();
        assertUntouched();
    }

    @Test public void turningTheSwitchOffTakesTheBarAwayWhenTheChatComesBack() {
        on();
        source.pins = Collections.singletonList(pin("m1", "Hello", 100));
        PinnedBar.Chat opened = open();
        assertNotNull(shown());
        Settings.preferences.edit().putBoolean(PinnedBar.KEY, false).commit();
        opened.onWindowFocusChanged(true);
        idle();
        assertUntouched();
        assertEquals(1, source.loads);
        assertTrue(shown() == null && opened.bar().getParent() == null);
    }

    @Test public void aPinMadeFromTheMenuShowsWhenTheChatComesBackAndAMomentLater() {
        on();
        PinnedBar.Chat opened = open();
        assertNull(shown());
        source.pins = Collections.singletonList(pin("m1", "First", 100));
        opened.onWindowFocusChanged(true);
        idle();
        assertEquals("First", shown().body.getText().toString());
        // The menu's pin lands in the list after the menu closes, so the bar reads it once more.
        source.pins = Arrays.asList(pin("m1", "First", 100), pin("m2", "Second", 200));
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(PinnedBar.AGAIN_MS + 100));
        assertEquals(3, source.loads);
        assertEquals("2 pinned messages", shown().title.getText().toString());
        assertEquals("Second", shown().body.getText().toString());
        assertEquals(1, column.indexOfChild(shown()));
        assertEquals(4, column.getChildCount());
    }

    @Test public void unpinningTheLastPinTakesTheBarAway() {
        on();
        source.pins = Collections.singletonList(pin("m1", "Hello", 100));
        PinnedBar.Chat opened = open();
        assertNotNull(shown());
        source.pins = new ArrayList<>();
        opened.onWindowFocusChanged(true);
        idle();
        assertUntouched();
    }

    @Test public void anAnswerToAnOlderReadIsDropped() {
        on();
        source.hold = true;
        PinnedBar.Chat opened = open();
        opened.onWindowFocusChanged(true);
        assertEquals(2, source.held.size());
        source.held.get(1).pins(Collections.singletonList(pin("m2", "Fresh", 200)));
        source.held.get(0).pins(Collections.singletonList(pin("m1", "Stale", 100)));
        idle();
        assertEquals("Fresh", shown().body.getText().toString());
    }

    @Test public void aChatThatGoesAwayDropsItsAnswer() {
        on();
        source.hold = true;
        open();
        ((ViewGroup) chat.getParent()).removeView(chat);
        source.held.get(0).pins(Collections.singletonList(pin("m1", "Hello", 100)));
        idle();
        assertNull(shown());
    }

    /** The chat's name stays the top bar for the see-through bars, with the pinned bar right under it. */
    @Test public void theNameStaysTheTopBar() {
        on();
        source.pins = Collections.singletonList(pin("m1", "Hello", 100));
        open();
        idle();
        assertNotNull(shown());
        assertTrue(shown().getHeight() > 0);
        IosBars.Bars bars = IosBars.barsIn(chat);
        assertNotNull(bars);
        assertSame(title, bars.top);
        assertSame(composer, bars.bottom);
    }

    @Test public void aChatWithNoNameGetsNoBarAndKeepsGoing() {
        on();
        source.pins = Collections.singletonList(pin("m1", "Hello", 100));
        buildChat(false);
        PinnedBar.watch(fragment, chat);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(PinnedBar.PLACE_MS * (PinnedBar.PLACE_TRIES + 1)));
        assertNull(shown());
        assertEquals(1, column.getChildCount());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Shipped, the stubs answer nothing, so an unpatched or changed build reads no list and shows no bar. */
    @Test public void theShippedStubsReadNoList() throws Exception {
        assertFalse(new PinnedBar.MessengerSource().load(fragment, pins -> fail("no answer from a stub")));
        assertNull(PinnedBar.MessengerSource.read(new Object()));
        assertNull(PinnedBar.MessengerSource.read(null));
    }

    @Test public void theSwitchSitsWithTheChatSwitchesAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals(PinnedBar.KEY)) spec = control;
        assertNotNull(spec);
        assertEquals("Show pinned messages", spec[1]);
        assertEquals("conversations", spec[3]);
        assertTrue(Settings.installed.contains(PinnedBar.KEY));
        assertFalse(Settings.preferences.getBoolean(PinnedBar.KEY, false));
    }
}
