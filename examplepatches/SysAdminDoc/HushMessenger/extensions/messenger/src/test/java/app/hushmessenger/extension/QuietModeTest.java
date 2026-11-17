package app.hushmessenger.extension;

import android.app.Application;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Person;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcelable;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.Switch;
import app.hushmessenger.extension.ChatHidingTest.Menu;
import app.hushmessenger.extension.ChatHidingTest.Participant;
import app.hushmessenger.extension.ChatHidingTest.Summary;
import java.io.File;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

/** Quiet mode (#190): what a break and the nightly window do to a message notification, and the rows that drive them. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class QuietModeTest {
    private Application app;
    /** Half past eleven at night, the kind of hour the default window covers. */
    private long now;

    @Before public void reset() {
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        QuietCalls.resetForTests();
        QuietMode.resetForTests();
        SpecialContacts.resetForTests();
        now = at(23, 30);
        QuietMode.clock = () -> now;
        SpecialContacts.clock = () -> now;
    }

    /** A fixed day at this hour and minute, in whatever zone the phone is set to. */
    private static long at(int hour, int minute) {
        return at(16, hour, minute);
    }

    /** A day in November at this hour and minute. A clock only ever goes forward, so the days do the same. */
    private static long at(int day, int hour, int minute) {
        Calendar when = Calendar.getInstance();
        when.set(2026, Calendar.NOVEMBER, day, hour, minute, 0);
        when.set(Calendar.MILLISECOND, 0);
        return when.getTimeInMillis();
    }

    private void on() {
        Settings.preferences.edit().putBoolean(QuietMode.KEY, true).commit();
    }

    /** A message notification from [from], the way Messenger's messaging style carries its writer. */
    private Notification message(String from) {
        Notification notification = new Notification.Builder(app, "messenger_orca_749_messages@test")
            .setSmallIcon(android.R.drawable.sym_action_chat)
            .setContentTitle(from)
            .setContentText("hey")
            .build();
        Bundle one = new Bundle();
        one.putCharSequence(QuietMode.SENDER, from);
        notification.extras.putParcelableArray(Notification.EXTRA_MESSAGES, new Parcelable[] {one});
        return notification;
    }

    /** True when the notification came back on HushMessenger's own quiet channel. */
    private boolean quieted(String from) {
        Notification before = message(from);
        String messengers = before.getChannelId();
        Notification after = QuietMode.message(before);
        if (after == before) {
            assertFalse("Left alone, so it keeps Messenger's channel", QuietMode.CHANNEL.equals(after.getChannelId()));
            return false;
        }
        assertEquals(QuietMode.CHANNEL, after.getChannelId());
        // Messenger's own notification stays as Messenger built it, so posting it again after the break has run out
        // sounds the way it should.
        assertEquals(messengers, before.getChannelId());
        assertEquals("The message itself is untouched", from, after.extras.getCharSequence(Notification.EXTRA_TITLE));
        return true;
    }

    private NotificationChannel quietChannel() {
        NotificationManager manager = (NotificationManager) app.getSystemService(android.content.Context.NOTIFICATION_SERVICE);
        return manager.getNotificationChannel(QuietMode.CHANNEL);
    }

    @Test public void aBreakQuietsMessagesUntilItRunsOut() {
        on();
        QuietMode.startBreak(60);
        assertTrue(QuietMode.onBreak());
        assertTrue(quieted("Ana"));
        assertTrue(Settings.lastActive(QuietMode.KEY) > 0);

        // The channel it goes up on is the one Android neither sounds nor vibrates.
        NotificationChannel channel = quietChannel();
        assertEquals(NotificationManager.IMPORTANCE_LOW, channel.getImportance());
        assertNull(channel.getSound());
        assertFalse(channel.shouldVibrate());
        assertEquals("Quiet mode", channel.getName().toString());

        now += 59 * 60_000L;
        assertTrue(quieted("Ana"));
        now += 2 * 60_000L;
        assertFalse("The break ran out", quieted("Ana"));
        assertFalse(QuietMode.onBreak());
    }

    @Test public void theSwitchOnItsOwnIsABreakWithNoEndAndEndingOneLetsMessagesSoundAgain() {
        on();
        assertEquals("No end of its own", 0, QuietMode.until());
        assertTrue(quieted("Ana"));
        QuietMode.endBreak();
        assertFalse(quieted("Ana"));

        // A break with no end, picked from the sheet, is quiet again until it's ended.
        QuietMode.startBreak(0);
        assertTrue(quieted("Ana"));
        now += 12 * 60 * 60_000L;
        assertTrue("A break with no end doesn't run out", quieted("Ana"));
    }

    @Test public void theNightlyWindowQuietsBetweenItsTwoTimesAndRunsPastMidnight() {
        on();
        QuietMode.endBreak();
        Settings.preferences.edit().putBoolean(QuietMode.DAILY, true).commit();
        assertEquals(QuietMode.DEFAULT_FROM, QuietMode.from());
        assertEquals(QuietMode.DEFAULT_TO, QuietMode.to());

        // 10 at night until 7 in the morning, so it covers both sides of midnight.
        assertTrue(quieted("Ana"));
        now = at(17, 2, 15);
        assertTrue(quieted("Ana"));
        now = at(17, 6, 59);
        assertTrue(quieted("Ana"));
        now = at(17, 7, 0);
        assertFalse(quieted("Ana"));
        now = at(17, 14, 0);
        assertFalse(quieted("Ana"));

        // A window inside one day is just as plain, and the afternoon it's already in is quiet from the moment it's set.
        QuietMode.setWindow(9 * 60, 17 * 60);
        assertTrue(quieted("Ana"));
        now = at(18, 8, 59);
        assertFalse(quieted("Ana"));
        now = at(18, 17, 0);
        assertFalse(quieted("Ana"));

        // Two times the same are no window at all, and a time outside the day is ignored.
        QuietMode.setWindow(9 * 60, 9 * 60);
        now = at(19, 9, 30);
        assertFalse(quieted("Ana"));
        QuietMode.setWindow(-1, QuietMode.DAY);
        assertEquals(9 * 60, QuietMode.from());
        assertEquals(9 * 60, QuietMode.to());

        // With the window off, the hour means nothing on its own.
        Settings.preferences.edit().putBoolean(QuietMode.DAILY, false).commit();
        QuietMode.setWindow(QuietMode.DEFAULT_FROM, QuietMode.DEFAULT_TO);
        now = at(19, 23, 30);
        QuietMode.endBreak();
        assertFalse(quieted("Ana"));
    }

    @Test public void theWindowStillHasItsSayAfterABreakEnds() {
        on();
        Settings.preferences.edit().putBoolean(QuietMode.DAILY, true).commit();
        QuietMode.startBreak(15);
        assertTrue(quieted("Ana"));
        now = at(17, 14, 0);
        assertFalse("The break ran out and the afternoon is outside the window", quieted("Ana"));
        now = at(17, 23, 0);
        assertTrue(quieted("Ana"));
    }

    @Test public void aMessageFromASpecialContactComesThroughABreak() throws Exception {
        track("7", "Ana");
        on();
        QuietMode.startBreak(60);
        assertFalse("Tracked under Special contacts", quieted("Ana"));
        assertFalse("However they're written", quieted("ANA"));
        assertTrue(quieted("Ben"));
    }

    @Test public void aCallGoesQuietOnlyWhileAQuietTimeIsRunningAndNeverForASpecialContact() {
        assertFalse(QuietMode.call());
        on();
        QuietMode.startBreak(60);
        assertTrue(QuietMode.call());
        assertTrue("Quiet mode quiets calls with Quiet incoming calls off", Settings.quietIncomingCalls());

        // The chat ringing now is tracked, so it rings.
        QuietCalls.incoming("1001", 2002);
        SpecialContacts.tracked = Collections.singleton("1001");
        assertFalse(QuietMode.call());
        assertFalse(Settings.quietIncomingCalls());
        SpecialContacts.tracked = Collections.emptySet();
        assertTrue(QuietMode.call());

        now += 61 * 60_000L;
        assertFalse("The break ran out", QuietMode.call());
    }

    @Test public void theSenderIsWhoeverWroteLastElseTheTitle() {
        Notification two = message("Ana");
        Bundle newer = new Bundle();
        newer.putParcelable(QuietMode.SENDER_PERSON, new Person.Builder().setName("Ben").build());
        two.extras.putParcelableArray(Notification.EXTRA_MESSAGES,
            new Parcelable[] {bundle(QuietMode.SENDER, "Ana"), newer});
        assertEquals("Ben", QuietMode.senderName(two));

        // A bundle with nothing to go on falls back to the one before it, then to the title.
        two.extras.putParcelableArray(Notification.EXTRA_MESSAGES,
            new Parcelable[] {bundle(QuietMode.SENDER, "Ana"), new Bundle()});
        assertEquals("Ana", QuietMode.senderName(two));
        two.extras.putParcelableArray(Notification.EXTRA_MESSAGES, new Parcelable[] {bundle(QuietMode.SENDER, "  ")});
        assertEquals("Ana", QuietMode.senderName(two));
        two.extras.remove(Notification.EXTRA_MESSAGES);
        assertEquals("Ana", QuietMode.senderName(two));

        // Anything unexpected in the array, and a notification with no title, read as no one.
        two.extras.putParcelableArray(Notification.EXTRA_MESSAGES, new Parcelable[] {null, new Person.Builder().build()});
        assertEquals("Ana", QuietMode.senderName(two));
        two.extras.remove(Notification.EXTRA_TITLE);
        assertNull(QuietMode.senderName(two));
        assertEquals("A name with a tab in it is still a name", "Cara\tC",
            QuietMode.senderName(titled("  Cara\tC  ")));
        assertFalse(QuietMode.isSpecial(null));
    }

    private static Bundle bundle(String key, String name) {
        Bundle one = new Bundle();
        one.putCharSequence(key, name);
        return one;
    }

    private Notification titled(String title) {
        return new Notification.Builder(app, "messenger_orca_749_messages@test")
            .setSmallIcon(android.R.drawable.sym_action_chat).setContentTitle(title).build();
    }

    @Test public void offPauseSafeModeAndAMissingControlLeaveTheNotificationAlone() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(app);
            Settings.preferences.edit().clear().putBoolean(QuietMode.KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(app);
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, QuietMode.quietNow());
            assertFalse(state, quieted("Ana"));
            assertFalse(state, QuietMode.call());
            assertEquals(state, 0, Settings.lastActive(QuietMode.KEY));
            assertNull(state, quietChannel());
        }
    }

    @Test public void aSwitchThatCantBeReadLeavesTheNotificationAlone() {
        // A stored value of the wrong type makes reading the switch throw, which must never reach Messenger's shade.
        Settings.preferences.edit().putString(QuietMode.KEY, "on").commit();
        Notification notification = message("Ana");
        assertSame(notification, QuietMode.message(notification));
        assertTrue(Settings.hookErrors.containsKey(QuietMode.KEY));
        Settings.hookErrors.clear();
        assertFalse(QuietMode.call());
        assertTrue(Settings.hookErrors.containsKey(QuietMode.KEY));
    }

    @Test public void aNotificationAlreadyQuietedOrMissingIsLeftAsItIs() {
        on();
        assertNull(QuietMode.message(null));
        Notification already = new Notification.Builder(app, QuietMode.CHANNEL)
            .setSmallIcon(android.R.drawable.sym_action_chat).setContentTitle("Ana").build();
        assertSame(already, QuietMode.message(already));
    }

    @Test public void theBreakButtonReadsTheBreakRunningAndTheChoicesReadTheirLengths() {
        SettingsText text = new SettingsText(app);
        assertEquals("Take a break", QuietMode.breakLabel(app, text));
        on();
        assertEquals("On a break until you end it", QuietMode.breakLabel(app, text));
        QuietMode.startBreak(15);
        assertEquals("On a break until " + QuietMode.time(app, QuietMode.until()), QuietMode.breakLabel(app, text));
        QuietMode.endBreak();
        assertEquals("Take a break", QuietMode.breakLabel(app, text));

        assertEquals("15 minutes", QuietMode.breakChoice(text, 15));
        assertEquals("1 hour", QuietMode.breakChoice(text, 60));
        assertEquals("2 hours", QuietMode.breakChoice(text, 120));
        assertEquals("8 hours", QuietMode.breakChoice(text, 480));
        assertEquals("Until I end it", QuietMode.breakChoice(text, 0));
        assertEquals("The window reads in the phone's own format", QuietMode.time(app, at(22, 0)),
            QuietMode.minuteLabel(app, QuietMode.DEFAULT_FROM));
    }

    @Test public void theSheetTakesABreakTurnsQuietModeOnAndEndsItAgain() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Switch control = root.findViewWithTag(QuietMode.KEY);
            assertFalse(control.isChecked());
            Button take = root.findViewWithTag("quiet_mode_break");
            assertEquals("Take a break", take.getText().toString());

            take.performClick();
            View sheet = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertNotNull(sheet.findViewWithTag("quiet_mode_choices"));
            assertNull("No break to end yet", sheet.findViewWithTag("quiet_mode_end"));
            for (int minutes : QuietMode.BREAKS) assertNotNull(String.valueOf(minutes),
                sheet.findViewWithTag("quiet_mode_break_" + minutes));
            RadioButton hour = sheet.findViewWithTag("quiet_mode_break_60");
            hour.performClick();
            // A dialog hands its dismiss on through the main thread, and the row waits for that before it opens another.
            shadowOf(Looper.getMainLooper()).idle();

            assertTrue("Picking a break is as clear a yes as the switch", control.isChecked());
            assertTrue(Settings.preferences.getBoolean(QuietMode.KEY, false));
            assertEquals(now + 60 * 60_000L, QuietMode.until());
            assertEquals("On a break until " + QuietMode.time(screen.get(), QuietMode.until()), take.getText().toString());
            assertTrue(quieted("Ana"));

            // The sheet comes back with the way out of the break on it.
            take.performClick();
            sheet = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            Button end = sheet.findViewWithTag("quiet_mode_end");
            assertEquals("End the break", end.getText().toString());
            end.performClick();
            shadowOf(Looper.getMainLooper()).idle();
            assertEquals("Take a break", take.getText().toString());
            assertFalse(quieted("Ana"));
            assertTrue("The switch stays on, so the nightly window keeps working",
                Settings.preferences.getBoolean(QuietMode.KEY, false));
        }
    }

    @Test public void theWindowButtonsShowTheirTimesAndTakeAPickedOne() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Button starts = root.findViewWithTag("quiet_mode_start");
            Button ends = root.findViewWithTag("quiet_mode_stop");
            assertEquals("Quiet from " + QuietMode.minuteLabel(screen.get(), QuietMode.DEFAULT_FROM), starts.getText().toString());
            assertEquals("Quiet until " + QuietMode.minuteLabel(screen.get(), QuietMode.DEFAULT_TO), ends.getText().toString());

            starts.performClick();
            android.app.TimePickerDialog picker = (android.app.TimePickerDialog) ShadowDialog.getLatestDialog();
            assertTrue(picker.isShowing());
            picker.updateTime(21, 45);
            picker.getButton(android.content.DialogInterface.BUTTON_POSITIVE).performClick();
            assertEquals(21 * 60 + 45, QuietMode.from());
            assertEquals("Quiet from " + QuietMode.minuteLabel(screen.get(), 21 * 60 + 45), starts.getText().toString());
            assertEquals("The other end is left where it was", QuietMode.DEFAULT_TO, QuietMode.to());

            ends.performClick();
            picker = (android.app.TimePickerDialog) ShadowDialog.getLatestDialog();
            picker.updateTime(6, 30);
            picker.getButton(android.content.DialogInterface.BUTTON_POSITIVE).performClick();
            assertEquals(6 * 60 + 30, QuietMode.to());
            assertEquals("Quiet until " + QuietMode.minuteLabel(screen.get(), 6 * 60 + 30), ends.getText().toString());

            // A break that ran out while settings sat behind Messenger reads right on the way back.
            Settings.preferences.edit().putBoolean(QuietMode.KEY, true).commit();
            QuietMode.startBreak(15);
            screen.pause().stop();
            now += 16 * 60_000L;
            screen.restart().resume();
            assertEquals("Take a break", ((Button) root.findViewWithTag("quiet_mode_break")).getText().toString());
        }
    }

    @Test public void everyNightSitsUnderTheSwitchAndComesBackWithItInABackup() {
        assertEquals(QuietMode.KEY, Settings.SUB_SWITCHES.get(QuietMode.DAILY));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Switch nightly = root.findViewWithTag(QuietMode.DAILY);
            assertNotNull(nightly);
            assertFalse(nightly.isChecked());
            View main = root.findViewWithTag(QuietMode.KEY);
            View wrapper = (View) ((View) main.getParent()).getParent();
            assertSame("Inside the Quiet mode block", wrapper, ((View) nightly.getParent()).getParent());
            nightly.performClick();
            assertTrue(Settings.preferences.getBoolean(QuietMode.DAILY, false));
            assertFalse("Turning it on leaves the main switch alone", Settings.preferences.getBoolean(QuietMode.KEY, false));
        }

        on();
        String backup = ChoiceCodec.encode(Settings.preferences, Set.of(QuietMode.KEY));
        assertEquals(Map.of("paused", false, QuietMode.KEY, true, QuietMode.DAILY, true), ChoiceCodec.parse(backup));
        assertFalse(ChoiceCodec.encode(Settings.preferences, Set.of("stories")).contains(QuietMode.DAILY));
    }

    @Test public void theControlSitsUnderNotificationsStartsOffIsExperimentalAndStaysOutOfTheQuickSetups() {
        assertTrue(Settings.installed.contains(QuietMode.KEY));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals(QuietMode.KEY)).findFirst().orElseThrow();
        assertEquals("Quiet mode", row[1]);
        assertEquals("notifications", row[3]);
        assertTrue(SettingsActivity.EXPERIMENTAL.contains(QuietMode.KEY));
        assertFalse(Settings.preferences.contains(QuietMode.KEY));
        assertFalse(Settings.wouldUse(QuietMode.KEY));
        // A phone that goes quiet on its own is easy to miss, so no one-tap setup turns it on.
        assertFalse(QuickSetups.QUIET.contains(QuietMode.KEY));
        assertFalse(QuickSetups.PRIVACY.contains(QuietMode.KEY));
    }

    /** Tracks [name] under Special contacts, the way the chat menu's row does. */
    private void track(String id, String name) throws Exception {
        File folder = app.getDatabasePath(SpecialContacts.KEY).getParentFile();
        folder.mkdirs();
        for (File old : folder.listFiles()) old.delete();
        delete(new File(app.getNoBackupFilesDir(), "hush_special_contacts"));
        assertTrue(new File(folder, "msys_database_100").createNewFile());
        Settings.preferences.edit().putBoolean(SpecialContacts.KEY, true).commit();
        ChatHiding.resetForTests();
        ChatHiding.route = ChatHiding.Route.of(ChatHidingTest.ROUTE, ChatHidingTest.class.getClassLoader());
        SpecialContacts.resetForTests();
        SpecialContacts.work = Runnable::run;
        SpecialContacts.clock = () -> now;
        Summary chat = new Summary("c" + id);
        chat.people.add(new Participant("100", "Me"));
        chat.people.add(new Participant(id, name));
        assertTrue(ChatHiding.menuTapped(new Menu(chat), SpecialContacts.ROW_ID));
        shadowOf(Looper.getMainLooper()).idle();
        assertTrue(SpecialContacts.names().contains(name.toLowerCase(Locale.ROOT)));
    }

    private static void delete(File file) {
        File[] inside = file.listFiles();
        if (inside != null) for (File each : inside) delete(each);
        file.delete();
    }
}
