package io.github.emotionbug.patches.runtime;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.ContentResolver;
import android.content.pm.ProviderInfo;
import android.net.Uri;
import android.os.Looper;
import java.time.Duration;
import java.lang.reflect.Field;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import org.robolectric.annotation.SQLiteMode;
import org.robolectric.shadows.ShadowContentResolver;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 29)
@LooperMode(LooperMode.Mode.PAUSED)
@SQLiteMode(SQLiteMode.Mode.NATIVE)
public final class SummaryProgressNotificationTest {
    private Context context;
    private NotificationManager manager;
    private SummaryProgressNotification progress;
    private SummaryStore.Job job;
    private SummaryStore store;
    private Field singleton;

    @Before public void setup() throws Exception {
        context = RuntimeEnvironment.getApplication();
        manager = context.getSystemService(NotificationManager.class);
        store = new SummaryStore(context);
        singleton = SummaryStore.class.getDeclaredField("instance"); singleton.setAccessible(true); singleton.set(null, store);
        store.mode(SummaryStore.ALWAYS);
        store.event(100, 200, Uri.parse("content://fixture/audio"), false, null, null);
        job = store.list().get(0);
        ProviderInfo info = new ProviderInfo();
        info.authority = context.getPackageName() + ".ebpatcher.settings";
        ExtensionSettingsProvider provider = new ExtensionSettingsProvider();
        provider.attachInfo(context, info);
        ShadowContentResolver.registerProviderInternal(info.authority, provider);
        progress = new SummaryProgressNotification(context);
    }

    @After public void stop() throws Exception {
        progress.shutdown(); singleton.set(null, null); store.close();
    }

    private Notification current() {
        return shadowOf(manager).getNotification(SummaryNotifications.fallbackTag(job.id), SummaryProgressNotification.NOTIFICATION);
    }

    @Test public void fixedStagesAndOrdinalCountersNeverExposeCallbackContents() {
        assertNull(SummaryProgressNotification.stageText("private transcript"));
        assertNull(SummaryProgressNotification.stageText("whisper:private:1:2"));
        assertNull(SummaryProgressNotification.stageText("whisper:1:3:2"));
        assertNull(SummaryProgressNotification.stageText("checkpoint:0:1:1"));
        SummaryProgressNotification.Session session = progress.begin(job);
        session.accept("whisper:12:2:2");
        String transcription = current().extras.getString(Notification.EXTRA_TEXT);
        session.accept("summary");
        String summary = current().extras.getString(Notification.EXTRA_TEXT);
        assertNotEquals(transcription, summary);
        session.accept("private transcript");
        assertEquals(summary, current().extras.getString(Notification.EXTRA_TEXT));
    }

    @Test public void notificationAndNewChannelAreSilentPrivateAndIndeterminate() {
        progress.begin(job).accept("gemma_init");
        Notification notification = current();
        NotificationChannel channel = manager.getNotificationChannel(SummaryProgressNotification.CHANNEL);
        assertEquals(NotificationManager.IMPORTANCE_LOW, channel.getImportance());
        assertNull(channel.getSound());
        assertFalse(channel.shouldVibrate());
        assertNull(notification.sound);
        assertNull(notification.vibrate);
        assertEquals(0, notification.defaults);
        assertEquals(Notification.GROUP_ALERT_SUMMARY, notification.getGroupAlertBehavior());
        assertEquals(Notification.VISIBILITY_PRIVATE, notification.visibility);
        assertTrue((notification.flags & Notification.FLAG_ONGOING_EVENT) != 0);
        assertTrue((notification.flags & Notification.FLAG_ONLY_ALERT_ONCE) != 0);
        assertTrue(notification.extras.getBoolean(Notification.EXTRA_PROGRESS_INDETERMINATE));
        assertEquals(SummaryProgressNotification.TIMEOUT_MS, notification.getTimeoutAfter());
        assertNotNull(notification.contentIntent);
    }

    @Test public void existingUserChannelIsNotReconfigured() {
        NotificationChannel channel = new NotificationChannel(SummaryProgressNotification.CHANNEL, "User channel", NotificationManager.IMPORTANCE_HIGH);
        channel.setSound(Uri.parse("content://user/sound"), null);
        channel.enableVibration(true);
        manager.createNotificationChannel(channel);
        progress.begin(job);
        NotificationChannel retained = manager.getNotificationChannel(SummaryProgressNotification.CHANNEL);
        assertEquals(NotificationManager.IMPORTANCE_HIGH, retained.getImportance());
        assertEquals(Uri.parse("content://user/sound"), retained.getSound());
        assertTrue(retained.shouldVibrate());
        assertEquals(Notification.GROUP_ALERT_SUMMARY, current().getGroupAlertBehavior());
    }

    @Test public void completionAndOldCallbacksCannotEraseOrReviveNewSession() {
        SummaryProgressNotification.Session old = progress.begin(job);
        SummaryProgressNotification.Session next = progress.begin(job);
        next.accept("comparison");
        String activeText = current().extras.getString(Notification.EXTRA_TEXT);
        old.close();
        old.accept("decode");
        old.run();
        assertEquals(activeText, current().extras.getString(Notification.EXTRA_TEXT));
        next.close();
        next.accept("summary");
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(SummaryProgressNotification.REFRESH_MS * 2));
        assertNull(current());
    }

    @Test public void terminalResultOverwritesProgressAndSurvivesServiceShutdown() {
        SummaryProgressNotification.Session session = progress.begin(job);
        String ongoing = current().extras.getString(Notification.EXTRA_TEXT);
        session.finish();
        Notification result = current();
        assertNotEquals(ongoing, result.extras.getString(Notification.EXTRA_TEXT));
        assertEquals(0, result.flags & Notification.FLAG_ONGOING_EVENT);
        assertEquals(0, result.getTimeoutAfter());
        assertTrue(result.extras.getBoolean(SummaryNotifications.OWNED));
        assertEquals(job.id, result.extras.getLong(SummaryNotifications.JOB_ID));
        assertEquals(job.recordingId, result.extras.getLong(SummaryNotifications.RECORDING_ID));
        assertEquals(job.briefingId, result.extras.getLong(SummaryNotifications.BRIEFING_ID));
        session.accept("decode");
        progress.shutdown();
        assertSame(result, current());
        assertNull(SummaryProgressNotification.resultText("private result", true));
    }

    @Test public void obsoleteOrMissingOutcomeCannotLeaveAnOngoingNotification() {
        SummaryProgressNotification.Session session = progress.begin(job);
        store.getWritableDatabase().delete("jobs", "id=?", new String[]{Long.toString(job.id)});
        session.finish();
        assertNull(current());
        session.run();
        assertNull(current());
    }

    @Test public void restartClearsStaleStatusAndShutdownPreventsLateStart() {
        progress.begin(job);
        assertNotNull(current());
        SummaryProgressNotification restarted = new SummaryProgressNotification(context);
        assertNull(current());
        progress.shutdown();
        progress.begin(job).accept("summary");
        assertNull(current());
        restarted.shutdown();
    }

    @Test public void heartbeatRenewsOnlyLiveSessionAndLeavesUnrelatedNotificationsAlone() {
        Notification unrelated = new Notification.Builder(context, "recorder").setSmallIcon(android.R.drawable.stat_notify_sync).build();
        manager.notify(123, unrelated);
        SummaryProgressNotification.Session session = progress.begin(job);
        session.accept("summary");
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(SummaryProgressNotification.REFRESH_MS));
        assertNotNull(current());
        session.close();
        assertNull(current());
        assertNotNull(shadowOf(manager).getNotification(123));
    }

    @Test public void disabledNotificationsDoNotPreventStageOrLifecycleOperations() {
        shadowOf(manager).setNotificationsEnabled(false);
        SummaryProgressNotification.Session session = progress.begin(job);
        session.accept("whisper:1:1:2");
        session.run();
        assertNull(current());
        session.close();
    }

    @Test @Config(sdk = 33) public void androidNotificationPermissionDenialDoesNotBlockProcessingCallbacks() {
        shadowOf(RuntimeEnvironment.getApplication()).denyPermissions("android.permission.POST_NOTIFICATIONS");
        SummaryProgressNotification.Session session = progress.begin(job);
        session.accept("gemma_init");
        session.accept("summary");
        session.finish();
        assertNull(current());
    }

    @Test public void notificationServiceFailuresAreContained() {
        Context unavailable = new ContextWrapper(context) {
            @Override public Context getApplicationContext() { return this; }
            @Override public ContentResolver getContentResolver() { throw new SecurityException("fixture denial"); }
        };
        SummaryProgressNotification denied = new SummaryProgressNotification(unavailable);
        SummaryProgressNotification.Session session = denied.begin(job);
        session.accept("comparison");
        session.run();
        session.close();
        denied.shutdown();
    }
}
