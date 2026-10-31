package app.hushmessenger.extension;

import android.app.Application;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.Person;
import android.content.Intent;
import android.view.View;
import android.widget.EditText;
import android.widget.Switch;
import java.time.Duration;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowSystemClock;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class QuietCallsTest {
    private Application app;

    @Before public void reset() {
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        QuietCalls.resetForTests();
    }

    private Notification.Builder call(String category) {
        return new Notification.Builder(app, "messenger_orca_749_voip_incoming@test")
            .setSmallIcon(android.R.drawable.sym_call_incoming)
            .setContentTitle("Incoming call")
            .setCategory(category);
    }

    /** An incoming call the way Messenger posts it: call category and a full-screen intent. */
    private Notification ringing() {
        return ringing("Incoming call");
    }

    private Notification ringing(String title) {
        PendingIntent screen = PendingIntent.getActivity(app, 0, new Intent(), PendingIntent.FLAG_IMMUTABLE);
        return call(Notification.CATEGORY_CALL).setContentTitle(title).setFullScreenIntent(screen, true).build();
    }

    /** True when the notification came back quieted. */
    private boolean quieted(String title) {
        return QuietCalls.GROUP.equals(QuietCalls.incomingNotification(ringing(title), app).getGroup());
    }

    private List<String> recentNames() {
        return QuietCalls.recent().stream().map(chat -> chat[1]).collect(Collectors.toList());
    }

    private static void later(long millis) {
        ShadowSystemClock.advanceBy(Duration.ofMillis(millis));
    }

    @Test public void onlyChosenChatsQuietsJustTheChatsTurnedOn() {
        Settings.preferences.edit().putBoolean("quiet_calls", true).putBoolean(QuietCalls.CHOSEN_ONLY, true).commit();
        // Nothing chosen yet, so every call rings.
        QuietCalls.incoming("1001", 2002);
        assertFalse(Settings.quietIncomingCalls());
        assertFalse(quieted("Ana"));
        assertEquals("A call that rang isn't a use", 0, Settings.lastActive("quiet_calls"));

        Settings.preferences.edit().putBoolean(QuietCalls.CHAT_PREFIX + "1001", true).commit();
        assertTrue(Settings.quietIncomingCalls());
        assertTrue(quieted("Ana"));
        assertTrue(Settings.lastActive("quiet_calls") > 0);

        // Another chat's call rings.
        QuietCalls.incoming("1003", 2004);
        assertFalse(Settings.quietIncomingCalls());
        assertFalse(quieted("Ben"));

        // A chat with no thread id is the person calling.
        Settings.preferences.edit().putBoolean(QuietCalls.CHAT_PREFIX + "2006", true).commit();
        QuietCalls.incoming("", 2006);
        assertTrue(Settings.quietIncomingCalls());
        QuietCalls.incoming(null, 0);
        assertFalse("A call nothing places rings", Settings.quietIncomingCalls());

        // A chat named long ago isn't the call ringing now.
        QuietCalls.incoming("1001", 2002);
        later(QuietCalls.PAIR_MILLIS + 1);
        assertFalse(Settings.quietIncomingCalls());

        // With Only chosen chats off, every call is quiet again.
        Settings.preferences.edit().putBoolean(QuietCalls.CHOSEN_ONLY, false).commit();
        assertTrue(Settings.quietIncomingCalls());
        QuietCalls.incoming("1003", 2004);
        assertTrue(quieted("Ben"));

        // And with the main switch off, no chosen chat is quiet.
        Settings.preferences.edit().putBoolean(QuietCalls.CHOSEN_ONLY, true).putBoolean("quiet_calls", false).commit();
        QuietCalls.incoming("1001", 2002);
        assertFalse(Settings.quietIncomingCalls());
    }

    @Test public void theChatKeyIsTheThreadElseTheCaller() {
        assertEquals("1001", QuietCalls.chatKey("1001", 2002));
        assertEquals("1001", QuietCalls.chatKey(" 1001 ", 2002));
        assertEquals("2002", QuietCalls.chatKey("", 2002));
        assertEquals("2002", QuietCalls.chatKey("  ", 2002));
        assertNull(QuietCalls.chatKey(null, 0));
        assertNull(QuietCalls.chatKey("", -1));
    }

    @Test public void callersAreListedByNameWhicheverComesFirst() {
        Settings.preferences.edit().putBoolean("quiet_calls", true).commit();
        // The decision first, then its notification.
        QuietCalls.incoming("1001", 2002);
        QuietCalls.incomingNotification(ringing("Ana"), app);
        assertEquals(List.of("Ana"), recentNames());
        assertEquals("1001", QuietCalls.recent().get(0)[0]);

        // The notification first, then its decision.
        later(QuietCalls.PAIR_MILLIS + 1);
        QuietCalls.incomingNotification(ringing("Ben"), app);
        assertEquals(List.of("Ana"), recentNames());
        QuietCalls.incoming("1003", 2004);
        assertEquals(List.of("Ben", "Ana"), recentNames());

        // A name that waited too long for its decision is dropped.
        later(QuietCalls.PAIR_MILLIS + 1);
        QuietCalls.incomingNotification(ringing("Old"), app);
        later(QuietCalls.PAIR_MILLIS + 1);
        QuietCalls.incoming("1005", 2006);
        assertEquals(List.of("Ben", "Ana"), recentNames());

        // A chat that calls again moves to the top under its newest name, once.
        later(QuietCalls.PAIR_MILLIS + 1);
        QuietCalls.incoming("1001", 2002);
        QuietCalls.incomingNotification(ringing("Ana B"), app);
        assertEquals(List.of("Ana B", "Ben"), recentNames());

        // The call style's person comes before the title, and a tab or line break can't split an entry.
        later(QuietCalls.PAIR_MILLIS + 1);
        Notification styled = ringing("Incoming call");
        styled.extras.putParcelable(QuietCalls.CALL_PERSON, new Person.Builder().setName("Cara\tC\nD").build());
        QuietCalls.incoming("1007", 2008);
        QuietCalls.incomingNotification(styled, app);
        assertEquals(List.of("Cara C D", "Ana B", "Ben"), recentNames());

        // The list keeps the newest few.
        for (int i = 0; i < QuietCalls.RECENT_LIMIT + 3; i++) {
            later(QuietCalls.PAIR_MILLIS + 1);
            QuietCalls.incoming("2" + i, 0);
            QuietCalls.incomingNotification(ringing("Caller " + i), app);
        }
        List<String> names = recentNames();
        assertEquals(QuietCalls.RECENT_LIMIT, names.size());
        assertEquals("Caller " + (QuietCalls.RECENT_LIMIT + 2), names.get(0));
        assertFalse(names.contains("Ana B"));
    }

    @Test public void nothingIsListedWhileTheSwitchIsOff() {
        QuietCalls.incoming("1001", 2002);
        QuietCalls.incomingNotification(ringing("Ana"), app);
        assertTrue(QuietCalls.recent().isEmpty());
        assertFalse(Settings.preferences.contains(QuietCalls.RECENT));
        Settings.preferences.edit().putBoolean("quiet_calls", true).putBoolean("paused", true).commit();
        QuietCalls.incoming("1001", 2002);
        QuietCalls.incomingNotification(ringing("Ana"), app);
        assertTrue(QuietCalls.recent().isEmpty());
    }

    @Test public void onlyChosenChatsSitsUnderTheSwitchWithAChatPerCaller() {
        assertEquals(QuietCalls.KEY, Settings.SUB_SWITCHES.get(QuietCalls.CHOSEN_ONLY));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Switch chosen = root.findViewWithTag(QuietCalls.CHOSEN_ONLY);
            assertNotNull(chosen);
            assertFalse(chosen.isChecked());
            View main = root.findViewWithTag(QuietCalls.KEY);
            View wrapper = (View) ((View) main.getParent()).getParent();
            assertSame("Inside the Quiet incoming calls block", wrapper, ((View) chosen.getParent()).getParent());
            assertNotNull("No calls yet says where they'll show", root.findViewWithTag("quiet_calls_recent_empty"));
            chosen.performClick();
            assertTrue(Settings.preferences.getBoolean(QuietCalls.CHOSEN_ONLY, false));
            assertFalse("Turning it on leaves the main switch alone", Settings.preferences.getBoolean(QuietCalls.KEY, false));
        }

        Settings.preferences.edit().putBoolean(QuietCalls.KEY, true).commit();
        QuietCalls.incoming("1001", 2002);
        QuietCalls.incomingNotification(ringing("Ana Lopez"), app);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertNull(root.findViewWithTag("quiet_calls_recent_empty"));
            Switch ana = root.findViewWithTag(QuietCalls.CHAT_PREFIX + "1001");
            assertNotNull(ana);
            assertFalse(ana.isChecked());
            ana.performClick();
            assertTrue(Settings.preferences.getBoolean(QuietCalls.CHAT_PREFIX + "1001", false));
            View main = root.findViewWithTag(QuietCalls.KEY);
            View wrapper = (View) ((View) main.getParent()).getParent();
            // A caller's name finds the block too.
            ((EditText) root.findViewWithTag("find_control")).setText("lopez");
            assertEquals(View.VISIBLE, wrapper.getVisibility());
            assertTrue(ana.isShown());
        }
    }

    @Test public void aBackupCarriesOnlyChosenChatsWithTheSwitch() {
        Settings.preferences.edit().putBoolean(QuietCalls.KEY, true).putBoolean(QuietCalls.CHOSEN_ONLY, true).commit();
        String backup = ChoiceCodec.encode(Settings.preferences, Set.of(QuietCalls.KEY));
        assertEquals(Map.of("paused", false, QuietCalls.KEY, true, QuietCalls.CHOSEN_ONLY, true), ChoiceCodec.parse(backup));
        assertFalse(ChoiceCodec.encode(Settings.preferences, Set.of("stories")).contains(QuietCalls.CHOSEN_ONLY));
    }

    /** A call notification with only its call type to go on. */
    private Notification typed(int callType) {
        Notification notification = call(Notification.CATEGORY_CALL).build();
        notification.extras.putInt(QuietCalls.CALL_TYPE, callType);
        return notification;
    }

    @Test public void anIncomingCallIsQuietedOnlyWhileTheSwitchIsOn() {
        Notification off = ringing();
        assertSame(off, QuietCalls.incomingNotification(off, app));
        assertNull(off.getGroup());
        assertEquals(0, Settings.lastActive("quiet_calls"));

        Settings.preferences.edit().putBoolean("quiet_calls", true).commit();
        Notification on = ringing();
        PendingIntent screen = on.fullScreenIntent;
        Notification quiet = QuietCalls.incomingNotification(on, app);
        // The same notification goes on to Messenger, in a group of its own that only its missing summary could sound.
        assertSame(on, quiet);
        assertEquals(QuietCalls.GROUP, quiet.getGroup());
        assertEquals(Notification.GROUP_ALERT_SUMMARY, quiet.getGroupAlertBehavior());
        // Android refuses a call notification with neither a full-screen intent nor a foreground service, so it stays.
        assertSame(screen, quiet.fullScreenIntent);
        assertEquals(Notification.CATEGORY_CALL, quiet.category);
        assertTrue(Settings.lastActive("quiet_calls") > 0);

        Settings.preferences.edit().putBoolean("quiet_calls", false).commit();
        Notification next = ringing();
        assertNull("The next call after switching off rings", QuietCalls.incomingNotification(next, app).getGroup());
    }

    @Test public void onlyIncomingCallsAreTouched() {
        Settings.preferences.edit().putBoolean("quiet_calls", true).commit();
        assertEquals("A call type of incoming is enough", QuietCalls.GROUP, QuietCalls.incomingNotification(typed(QuietCalls.INCOMING), app).getGroup());
        Settings.activeAt.clear();

        PendingIntent screen = PendingIntent.getActivity(app, 0, new Intent(), PendingIntent.FLAG_IMMUTABLE);
        Notification[] others = {
            typed(2),
            call(Notification.CATEGORY_CALL).build(),
            call(Notification.CATEGORY_MESSAGE).setFullScreenIntent(screen, true).build(),
            call(null).build(),
        };
        for (Notification other : others) {
            assertSame(other, QuietCalls.incomingNotification(other, app));
            assertNull(String.valueOf(other.category), other.getGroup());
        }
        // The switch only counts as used when a call actually came in.
        assertEquals(0, Settings.lastActive("quiet_calls"));
        assertNull(QuietCalls.incomingNotification(null, app));
        Notification noContext = ringing();
        assertSame(noContext, QuietCalls.incomingNotification(noContext, null));
        assertNull(noContext.getGroup());
    }

    @Test public void offPauseSafeModeAndAMissingControlLetCallsRing() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(app);
            Settings.preferences.edit().clear().putBoolean("quiet_calls", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(app);
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.quietIncomingCalls());
            Notification notification = ringing();
            assertSame(state, notification, QuietCalls.incomingNotification(notification, app));
            assertNull(state, notification.getGroup());
            assertEquals(state, 0, Settings.lastActive("quiet_calls"));
        }
    }

    @Test public void aSwitchThatCantBeReadLetsTheCallRing() {
        // A stored value of the wrong type makes reading the switch throw, which must never reach Messenger's call service.
        Settings.preferences.edit().putString("quiet_calls", "on").commit();
        Settings.hookErrors.clear();
        Notification notification = ringing();
        assertSame(notification, QuietCalls.incomingNotification(notification, app));
        assertNull(notification.getGroup());
        assertTrue(Settings.hookErrors.containsKey("quiet_calls"));
    }

    @Test public void theSwitchSitsUnderConversationsStartsOffIsExperimentalAndStaysOutOfTheQuickSetups() {
        assertTrue(Settings.installed.contains("quiet_calls"));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals("quiet_calls")).findFirst().orElseThrow();
        assertEquals("Quiet incoming calls", row[1]);
        assertEquals("conversations", row[3]);
        assertTrue(SettingsActivity.EXPERIMENTAL.contains("quiet_calls"));
        assertFalse(Settings.preferences.contains("quiet_calls"));
        assertFalse(Settings.wouldUse("quiet_calls"));
        // A call that doesn't ring is easy to miss, so no one-tap setup turns it on.
        assertFalse(QuickSetups.PRIVACY.contains("quiet_calls"));
        assertFalse(QuickSetups.QUIET.contains("quiet_calls"));
    }
}
