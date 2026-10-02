/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.inbox;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.AlarmManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Looper;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.SignedInUser;
import app.morphe.extension.tiktok.settings.Settings;

import com.ss.android.ugc.aweme.im.sdk.notification.PushQuickActionReceiver;

import java.io.File;
import java.util.Calendar;
import java.util.TimeZone;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlarmManager;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class AutoStreakTest {
    private static final int NOON = 12 * 60;
    private TimeZone zone;
    private Context context;

    @Before public void setUp() {
        zone = TimeZone.getDefault();
        TimeZone.setDefault(TimeZone.getTimeZone("America/Chicago"));
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        Settings.AUTO_STREAK.resetToDefault();
        Settings.AUTO_STREAK_RECIPIENT.resetToDefault();
        Settings.AUTO_STREAK_MINUTE.resetToDefault();
        Settings.AUTO_STREAK_MESSAGE.resetToDefault();
        Settings.AUTO_STREAK_STATE.resetToDefault();
        PushQuickActionReceiver.RECEIVED.clear();
        StreakMessenger.settleMillis = 0;
        StreakMessenger.warmUpMillis = 0;
        StreakMessenger.readyForTests = true;
        SignedInUser.idForTests = "200";
        AutoStreak.nowForTests = at(2026, Calendar.SEPTEMBER, 30, 9, 0);
    }

    @After public void tearDown() {
        TimeZone.setDefault(zone);
        StreakMessenger.readyForTests = null;
        StreakMessenger.settleMillis = 8_000L;
        StreakMessenger.warmUpMillis = 10_000L;
        StreakMessenger.handOffMillis = 10_000L;
        SignedInUser.idForTests = null;
        AutoStreak.nowForTests = null;
    }

    private static long at(int year, int month, int day, int hour, int minute) {
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(year, month, day, hour, minute);
        return calendar.getTimeInMillis();
    }

    private static AutoStreak.State active(long since) {
        AutoStreak.State state = new AutoStreak.State();
        state.activeSince = since;
        return state;
    }

    @Test public void theStateReadsBackWhatWasWritten() {
        AutoStreak.State state = active(1234L);
        state.sentDay = "2026-09-29";
        state.tryDay = "2026-09-30";
        state.tries = 2;
        state.result = AutoStreak.Result.NOT_READY;
        state.resultAt = 99L;
        state.owner = "200";
        state.sentTo = "matt,friend.one";
        AutoStreak.State read = AutoStreak.State.parse(state.format());
        assertEquals("2026-09-29", read.sentDay);
        assertEquals("2026-09-30", read.tryDay);
        assertEquals(2, read.tries);
        assertEquals(AutoStreak.Result.NOT_READY, read.result);
        assertEquals(99L, read.resultAt);
        assertEquals(1234L, read.activeSince);
        assertEquals("200", read.owner);
        assertEquals("matt,friend.one", read.sentTo);
        // A row written before the list was kept still reads, with nobody on it.
        assertEquals("2026-09-29", AutoStreak.State.parse("1|2026-09-29||0|SENT|0|0|200").sentDay);
        assertEquals("", AutoStreak.State.parse("1|2026-09-29||0|SENT|0|0|200").sentTo);
    }

    @Test public void aStateThisBuildCannotReadStartsOver() {
        AutoStreak.State read = AutoStreak.State.parse("1|2026-09-29||x|SENT|0|0|");
        assertEquals("", read.sentDay);
        assertEquals(0, read.tries);
        assertEquals(AutoStreak.Result.NONE, AutoStreak.State.parse("2|a|b").result);
    }

    @Test public void beforeTheTimeTheAlarmIsSetForToday() {
        long morning = at(2026, Calendar.SEPTEMBER, 30, 9, 0);
        AutoStreak.State state = active(morning - 1);
        assertFalse(AutoStreak.isDue(state, morning, NOON));
        assertEquals(at(2026, Calendar.SEPTEMBER, 30, 12, 0), AutoStreak.nextAlarm(state, morning, NOON));
    }

    @Test public void aTimeAlreadyPastWhenTurnedOnWaitsForTomorrow() {
        long afternoon = at(2026, Calendar.SEPTEMBER, 30, 15, 0);
        AutoStreak.State state = active(afternoon);
        assertFalse(AutoStreak.isDue(state, afternoon + 60_000, NOON));
        assertEquals(at(2026, Calendar.OCTOBER, 1, 12, 0), AutoStreak.nextAlarm(state, afternoon, NOON));
    }

    @Test public void aLateMessageRetriesUntilTheDaysTriesRunOut() {
        long late = at(2026, Calendar.SEPTEMBER, 30, 12, 20);
        AutoStreak.State state = active(at(2026, Calendar.SEPTEMBER, 29, 8, 0));
        assertTrue(AutoStreak.isDue(state, late, NOON));
        state.tryDay = "2026-09-30";
        for (int tries = 0; tries < AutoStreak.TRIES_PER_DAY; tries++) {
            state.tries = tries;
            assertEquals(late + AutoStreak.RETRY_MILLIS, AutoStreak.nextAlarm(state, late, NOON));
        }
        state.tries = AutoStreak.TRIES_PER_DAY;
        assertEquals(at(2026, Calendar.OCTOBER, 1, 12, 0), AutoStreak.nextAlarm(state, late, NOON));
        // Yesterday's tries are not today's.
        state.tryDay = "2026-09-29";
        assertEquals(late + AutoStreak.RETRY_MILLIS, AutoStreak.nextAlarm(state, late, NOON));
    }

    @Test public void aDayWhoseMessageWentWaitsForTomorrow() {
        long evening = at(2026, Calendar.SEPTEMBER, 30, 20, 0);
        AutoStreak.State state = active(0L);
        state.sentDay = "2026-09-30";
        assertFalse(AutoStreak.isDue(state, evening, NOON));
        assertEquals(at(2026, Calendar.OCTOBER, 1, 12, 0), AutoStreak.nextAlarm(state, evening, NOON));
        // The next day it is due again.
        assertTrue(AutoStreak.isDue(state, at(2026, Calendar.OCTOBER, 1, 12, 0), NOON));
    }

    @Test public void theDayFollowsTheClockAcrossADaylightSavingChange() {
        // US clocks fall back on 1 November 2026. Noon the day after is still noon.
        long saturday = at(2026, Calendar.OCTOBER, 31, 13, 0);
        AutoStreak.State state = active(0L);
        state.sentDay = "2026-10-31";
        assertEquals(at(2026, Calendar.NOVEMBER, 1, 12, 0), AutoStreak.nextAlarm(state, saturday, NOON));
        assertEquals("2026-11-01", AutoStreak.day(at(2026, Calendar.NOVEMBER, 1, 0, 30)));
    }

    @Test public void theHandleIsReadOutOfWhatWasTyped() {
        assertEquals("some.name_1", StreakMessenger.handleOf("  @some.name_1 "));
        assertEquals("friend", StreakMessenger.handleOf("friend"));
        assertEquals("some.name", StreakMessenger.handleOf("https://www.tiktok.com/@some.name?lang=en"));
        // A short link doesn't say who it is, and its scheme isn't a handle.
        assertEquals("", StreakMessenger.handleOf("https://vm.tiktok.com/ZMabc123/"));
        assertEquals("", StreakMessenger.handleOf("  "));
        assertEquals("", StreakMessenger.handleOf(null));
    }

    @Test public void theChatIdPutsTheSmallerUidFirst() {
        assertEquals("0:1:6818336315042825222:6961555913413460997",
                StreakMessenger.conversationId("6961555913413460997", "6818336315042825222"));
        assertEquals("0:1:6818336315042825222:6961555913413460997",
                StreakMessenger.conversationId("6818336315042825222", "6961555913413460997"));
        // A shorter uid is a smaller number even where its text sorts later.
        assertEquals("0:1:9:10", StreakMessenger.conversationId("10", "9"));
    }

    @Test public void theReplyLinkCarriesTheChatAndTheTextIntact() {
        Uri link = Uri.parse(StreakMessenger.replyLink("0:1:100:200", "🔥 hi & bye"));
        assertEquals("0:1:100:200", link.getQueryParameter("conv_id"));
        assertEquals("🔥 hi & bye", link.getQueryParameter("reply_text"));
    }

    @Test public void turningItOnArmsTheAlarmAndTheReceiverAndOffTakesThemAway() throws Exception {
        AlarmManager alarms = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        ShadowAlarmManager shadow = shadowOf(alarms);
        ComponentName receiver = new ComponentName(context, AutoStreakReceiver.class);

        Settings.AUTO_STREAK.save(true);
        AutoStreak.settingsChanged(context, true);
        Utils.awaitBackgroundTasksForTests();
        assertNotNull(shadow.peekNextScheduledAlarm());
        assertEquals(at(2026, Calendar.SEPTEMBER, 30, 12, 0), shadow.peekNextScheduledAlarm().getTriggerAtMs());
        assertEquals(PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                context.getPackageManager().getComponentEnabledSetting(receiver));

        Settings.AUTO_STREAK.save(false);
        AutoStreak.settingsChanged(context, false);
        Utils.awaitBackgroundTasksForTests();
        assertNull(shadow.peekNextScheduledAlarm());
        assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DEFAULT,
                context.getPackageManager().getComponentEnabledSetting(receiver));
    }

    @Test public void typingTheSamePersonAgainDoesNotSendThemASecondMessage() throws Exception {
        Settings.AUTO_STREAK.save(true);
        AutoStreak.State sent = active(0);
        sent.sentDay = "2026-09-30";
        sent.owner = "200";
        Settings.AUTO_STREAK_STATE.save(sent.format());

        Settings.AUTO_STREAK_RECIPIENT.save("@Matt");
        AutoStreak.recipientChanged(context, "matt");
        Utils.awaitBackgroundTasksForTests();
        assertEquals("2026-09-30", AutoStreak.state().sentDay);

        // Someone else starts like a switch turned on: at 9:00, today's noon is still theirs.
        Settings.AUTO_STREAK_RECIPIENT.save("@someone");
        AutoStreak.recipientChanged(context, "@Matt");
        Utils.awaitBackgroundTasksForTests();
        AutoStreak.State after = AutoStreak.state();
        assertEquals(AutoStreak.now(), after.activeSince);
        assertTrue(AutoStreak.isDue(after, at(2026, Calendar.SEPTEMBER, 30, 12, 0), NOON));

        // Going back to the person who already had today's message doesn't send another.
        Settings.AUTO_STREAK_RECIPIENT.save("matt");
        AutoStreak.recipientChanged(context, "@someone");
        Utils.awaitBackgroundTasksForTests();
        assertFalse(AutoStreak.isDue(AutoStreak.state(), at(2026, Calendar.SEPTEMBER, 30, 12, 0), NOON));
    }

    @Test public void everyoneMessagedTodayStaysOnTheDaysList() {
        AutoStreak.State state = active(0);
        state.markSent("2026-09-30", "Matt");
        state.markSent("2026-09-30", "friend.one");
        state.markSent("2026-09-30", "matt");
        assertEquals("matt,friend.one", state.sentTo);
        assertTrue(state.sentOn("2026-09-30", "MATT"));
        assertTrue(state.sentOn("2026-09-30", "friend.one"));
        assertFalse(state.sentOn("2026-09-30", "someone"));
        assertFalse(state.sentOn("2026-10-01", "matt"));
        // A new day starts a new list.
        state.markSent("2026-10-01", "someone");
        assertEquals("someone", state.sentTo);
        assertFalse(state.sentOn("2026-10-01", "matt"));
    }

    @Test public void theReportSaysHowTheLastTryWentWithoutNamingAnyone() {
        assertTrue(AutoStreak.Report.INSTANCE.lines().isEmpty());

        Settings.AUTO_STREAK.save(true);
        Settings.AUTO_STREAK_RECIPIENT.save("@matt");
        AutoStreak.State state = active(0);
        state.tryDay = "2026-09-30";
        state.tries = 2;
        state.result = AutoStreak.Result.NOT_READY;
        state.resultAt = at(2026, Calendar.SEPTEMBER, 30, 8, 15);
        state.owner = "200";
        Settings.AUTO_STREAK_STATE.save(state.format());

        String report = String.join("\n", AutoStreak.Report.INSTANCE.lines());
        assertTrue(report, report.contains("Account: the one it was set up on"));
        assertTrue(report, report.contains("Last try: NOT_READY at 2026-09-30 08:15"));
        assertTrue(report, report.contains("Alarm tries today: 2"));
        assertTrue(report, report.contains("Next alarm: 2026-09-30 12:00"));
        assertFalse(report, report.toLowerCase(java.util.Locale.ROOT).contains("matt"));
    }

    private void contacts(String self, String uid, String handle, String name) {
        File file = context.getDatabasePath("db_im_contact-" + self);
        file.getParentFile().mkdirs();
        try (SQLiteDatabase database = SQLiteDatabase.openOrCreateDatabase(file, null)) {
            database.execSQL("CREATE TABLE IF NOT EXISTS IM_USER_BASE_INFO (UID TEXT, NICK_NAME TEXT, UNIQUE_ID TEXT)");
            database.execSQL("INSERT INTO IM_USER_BASE_INFO VALUES (?, ?, ?)", new Object[]{uid, name, handle});
        }
    }

    /** Taps Send it now and runs the main thread until it answers. */
    private String sendNow() throws Exception {
        AtomicReference<String> toast = new AtomicReference<>();
        AutoStreak.sendNow(context, toast::set);
        long until = System.currentTimeMillis() + 20_000;
        while (toast.get() == null && System.currentTimeMillis() < until) {
            shadowOf(Looper.getMainLooper()).idle();
            Thread.sleep(10);
        }
        assertNotNull("Send it now never answered", toast.get());
        return toast.get();
    }

    @Test public void sendingHandsTheQuickReplyTheChatAndTheMessage() throws Exception {
        contacts("200", "100", "Friend.One", "Friend");
        Settings.AUTO_STREAK.save(true);
        Settings.AUTO_STREAK_RECIPIENT.save("@friend.one");
        Settings.AUTO_STREAK_MESSAGE.save("🔥");

        assertEquals("Sent to @friend.one", sendNow());

        assertEquals(1, PushQuickActionReceiver.RECEIVED.size());
        Intent handed = PushQuickActionReceiver.RECEIVED.get(0);
        Uri link = Uri.parse(handed.getStringExtra(StreakMessenger.REPLY_EXTRA));
        assertEquals("0:1:100:200", link.getQueryParameter("conv_id"));
        assertEquals("🔥", link.getQueryParameter("reply_text"));
        AutoStreak.State state = AutoStreak.state();
        assertEquals("2026-09-30", state.sentDay);
        assertEquals(AutoStreak.Result.SENT, state.result);
        assertEquals("200", state.owner);
        assertEquals("friend.one", state.sentTo);
        assertFalse(AutoStreak.isDue(state, at(2026, Calendar.SEPTEMBER, 30, 13, 0), NOON));
    }

    @Test public void aHandOffTheMainThreadNeverTookIsCalledOffNotSentLate() throws Exception {
        StreakMessenger.handOffMillis = 200L;
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread sender = new Thread(() -> {
            try {
                StreakMessenger.deliver(context, "0:1:100:200", "hi");
            } catch (Throwable thrown) {
                failure.set(thrown);
            }
        });
        sender.start();
        sender.join(5_000);
        assertNotNull("the hand-off should have timed out", failure.get());
        // The main thread gets to the queued hand-off only now, after the try was counted as failed.
        shadowOf(Looper.getMainLooper()).idle();
        assertTrue(PushQuickActionReceiver.RECEIVED.isEmpty());
    }

    @Test public void someoneWithNoChatIsNotMessaged() throws Exception {
        contacts("200", "100", "friend.one", "Friend");
        Settings.AUTO_STREAK.save(true);
        Settings.AUTO_STREAK_RECIPIENT.save("stranger");

        String toast = sendNow();

        assertTrue(toast, toast.contains("@stranger"));
        assertTrue(PushQuickActionReceiver.RECEIVED.isEmpty());
        assertEquals(AutoStreak.Result.NOT_FOUND, AutoStreak.state().result);
        assertEquals("", AutoStreak.state().sentDay);
    }

    @Test public void anotherAccountDoesNotSendForTheOneItWasSetUpOn() throws Exception {
        contacts("200", "100", "friend.one", "Friend");
        Settings.AUTO_STREAK.save(true);
        Settings.AUTO_STREAK_RECIPIENT.save("friend.one");
        AutoStreak.State state = AutoStreak.state();
        state.owner = "300";
        Settings.AUTO_STREAK_STATE.save(state.format());

        sendNow();

        assertTrue(PushQuickActionReceiver.RECEIVED.isEmpty());
        assertEquals(AutoStreak.Result.OTHER_ACCOUNT, AutoStreak.state().result);
    }

    @Test public void messagingThatNeverStartsSendsNothing() throws Exception {
        contacts("200", "100", "friend.one", "Friend");
        Settings.AUTO_STREAK.save(true);
        Settings.AUTO_STREAK_RECIPIENT.save("friend.one");
        StreakMessenger.readyForTests = false;

        sendNow();

        assertTrue(PushQuickActionReceiver.RECEIVED.isEmpty());
        assertEquals(AutoStreak.Result.NOT_READY, AutoStreak.state().result);
    }

    @Test public void theRecipientRowSaysWhoTheHandleIs() {
        contacts("200", "100", "friend.one", "Friend");
        assertEquals("Found Friend in your chats.", AutoStreak.recipientNote(context, "@Friend.One"));
        assertTrue(AutoStreak.recipientNote(context, "nobody").startsWith("No chat with @nobody"));
        assertNull(AutoStreak.recipientNote(context, ""));
    }
}
