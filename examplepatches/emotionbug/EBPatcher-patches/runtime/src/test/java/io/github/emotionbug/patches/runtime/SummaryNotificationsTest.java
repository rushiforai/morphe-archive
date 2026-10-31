package io.github.emotionbug.patches.runtime;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.pm.ProviderInfo;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import java.lang.reflect.Field;
import java.time.Duration;
import org.json.JSONArray;
import org.json.JSONObject;
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
@SQLiteMode(SQLiteMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public final class SummaryNotificationsTest {
    private Context context;
    private NotificationManager manager;
    private SummaryStore store;
    private SummaryProgressNotification progress;
    private SummaryStore.Job job;
    private Field singleton;
    private Uri providerUri;

    @Before public void setup() throws Exception {
        context = RuntimeEnvironment.getApplication();
        manager = context.getSystemService(NotificationManager.class);
        store = new SummaryStore(context);
        singleton = SummaryStore.class.getDeclaredField("instance"); singleton.setAccessible(true); singleton.set(null, store);
        store.mode(SummaryStore.ALWAYS);
        store.event(101, 201, Uri.parse("content://fixture/recordings/101"), false, null, null);
        job = store.next(true);
        ProviderInfo info = new ProviderInfo();
        info.authority = context.getPackageName() + ".ebpatcher.settings";
        ExtensionSettingsProvider provider = new ExtensionSettingsProvider();
        provider.attachInfo(context, info);
        ShadowContentResolver.registerProviderInternal(info.authority, provider);
        providerUri = Uri.parse("content://" + info.authority);
        progress = new SummaryProgressNotification(context);
    }
    @After public void close() throws Exception {
        progress.shutdown(); manager.cancelAll(); singleton.set(null, null); store.close();
    }
    private Notification incoming(long briefing) {
        Notification result = new Notification.Builder(context, "native-summary")
                .setSmallIcon(android.R.drawable.stat_notify_sync).setContentTitle("Original summary").build();
        assertFalse(SummaryNotifications.nativeArriving(context, briefing, result));
        return result;
    }
    private Notification notice(String tag, int id) { return shadowOf(manager).getNotification(tag, id); }
    private Notification fallback(SummaryStore.Job selected) {
        return notice(SummaryNotifications.fallbackTag(selected.id), SummaryProgressNotification.NOTIFICATION);
    }
    private Bundle request(String command, Bundle values) {
        return context.getContentResolver().call(providerUri, ExtensionSettingsProvider.SUMMARY_STATUS, command, values);
    }
    private Bundle remoteSession() {
        Bundle identity = new Bundle();
        identity.putString("owner", request("connect", null).getString("owner"));
        identity.putLong("job", job.id); identity.putInt("revision", job.revision);
        identity.putString("session", request("begin", identity).getString("session"));
        return identity;
    }
    private JSONObject prepareLocal() throws Exception {
        JSONObject local = new JSONObject().put("title", "Fixture title").put("summary", "Local summary")
                .put("segments", new JSONArray().put(new JSONObject().put("startMs", 0).put("endMs", 10)
                        .put("speaker", "Channel 1").put("text", "Local words")));
        store.complete(job, "Local words", "Local summary", local,
                new JSONObject().put("source", "local").put("reason", "Fixture comparison"));
        JSONObject snapshot = new JSONObject().put("recordingId", job.recordingId)
                .put("briefingId", job.briefingId).put("audioUri", job.audio);
        store.nativeBackup(snapshot);
        store.nativeIntent(snapshot, store.presentation(store.job(job.id)));
        return snapshot;
    }

    @Test public void apiFirstIsUpdatedAtItsOriginalTagAndIdWithoutTouchingAnotherCall() {
        manager.notify("native", 1201, incoming(201));
        manager.notify("other", 1202, incoming(999));
        SummaryProgressNotification.Session session = progress.begin(job);
        session.accept("whisper:1:1:2");
        assertEquals(2, manager.getActiveNotifications().length);
        assertNull(fallback(job));
        Notification adopted = notice("native", 1201);
        assertTrue(adopted.extras.getBoolean(SummaryNotifications.OWNED));
        assertTrue(adopted.extras.getBoolean(SummaryNotifications.REPLACED));
        assertEquals(job.id, adopted.extras.getLong(SummaryNotifications.JOB_ID));
        assertFalse(notice("other", 1202).extras.getBoolean(SummaryNotifications.OWNED));
        assertEquals(999, notice("other", 1202).extras.getLong(SummaryNotifications.BRIEFING_ID));
        session.finish();
        assertEquals(0, notice("native", 1201).flags & Notification.FLAG_ONGOING_EVENT);
        assertEquals(2, manager.getActiveNotifications().length);
    }

    @Test public void localFirstAbsorbsLateApiWithoutASecondNoticeOrSound() {
        progress.begin(job).accept("summary");
        Notification api = new Notification.Builder(context, "native-summary").setSmallIcon(android.R.drawable.stat_notify_sync).build();
        assertTrue(SummaryNotifications.nativeArriving(context, 201, api));
        assertEquals(1, manager.getActiveNotifications().length);
        Notification current = fallback(job);
        assertTrue(current.extras.getBoolean(SummaryNotifications.REPLACED));
        assertTrue((current.flags & Notification.FLAG_ONGOING_EVENT) != 0);
        assertNull(current.sound); assertNull(current.vibrate); assertEquals(0, current.defaults);
        assertEquals(Notification.GROUP_ALERT_SUMMARY, current.getGroupAlertBehavior());
        assertEquals(job.id, current.extras.getLong(SummaryNotifications.JOB_ID));
    }

    @Test public void rotatingNativeIdCannotMakeHeartbeatOrRefreshOverwriteAnotherCall() {
        manager.notify("native", 1201, incoming(201));
        SummaryProgressNotification.Session session = progress.begin(job);
        manager.notify("native", 1201, incoming(999));
        SummaryNotifications.refresh(context, job.id);
        assertEquals(999, notice("native", 1201).extras.getLong(SummaryNotifications.BRIEFING_ID));
        session.run();
        assertFalse(notice("native", 1201).extras.getBoolean(SummaryNotifications.OWNED));
        assertEquals(job.id, fallback(job).extras.getLong(SummaryNotifications.JOB_ID));
        session.close();
        assertNull(fallback(job));
        assertEquals(999, notice("native", 1201).extras.getLong(SummaryNotifications.BRIEFING_ID));
    }

    @Test public void aggregateAndForegroundNotificationsAreNeverClaimed() {
        Notification aggregate = new Notification.Builder(context, "native-summary").setSmallIcon(android.R.drawable.stat_notify_sync)
                .setGroup("native").setGroupSummary(true).build();
        assertFalse(SummaryNotifications.nativeArriving(context, 201, aggregate));
        manager.notify("group", 1201, aggregate);
        Notification recording = new Notification.Builder(context, "recording").setSmallIcon(android.R.drawable.stat_notify_sync).build();
        recording.flags |= Notification.FLAG_FOREGROUND_SERVICE;
        assertFalse(SummaryNotifications.nativeArriving(context, 201, recording));
        manager.notify("recording", 1202, recording);
        assertNull(SummaryNotifications.target(context, job));
        progress.begin(job);
        assertEquals(3, manager.getActiveNotifications().length);
        assertFalse(notice("group", 1201).extras.getBoolean(SummaryNotifications.OWNED));
        assertFalse(notice("recording", 1202).extras.getBoolean(SummaryNotifications.OWNED));
    }

    @Test public void nativeCommitRefreshDoesNotResurrectDismissedResults() {
        SummaryProgressNotification.Session session = progress.begin(job);
        session.finish();
        manager.cancel(SummaryNotifications.fallbackTag(job.id), SummaryProgressNotification.NOTIFICATION);
        SummaryNotifications.refresh(context, job.id);
        session.run();
        assertEquals(0, manager.getActiveNotifications().length);
    }

    @Test public void fallbackForAnotherJobPreservesEarlierTerminalResult() {
        progress.begin(job).finish();
        Notification terminal = fallback(job);
        store.event(102, 202, Uri.parse("content://fixture/recordings/102"), false, null, null);
        SummaryStore.Job second = store.next(true);
        assertNotNull(second); assertNotEquals(job.id, second.id);
        progress.begin(second).accept("summary");
        assertEquals(2, manager.getActiveNotifications().length);
        assertSame(terminal, fallback(job));
        assertEquals(second.id, fallback(second).extras.getLong(SummaryNotifications.JOB_ID));
    }

    @Test public void lateAssociationAdoptsNativeIdentityWithoutDuplicatingProgress() {
        store.event(102, 0, Uri.parse("content://fixture/recordings/102"), false, null, null);
        SummaryStore.Job unassociated = store.next(true);
        progress.begin(unassociated).accept("comparison");
        manager.notify("late", 1205, incoming(777));
        store.nativeAssociation(unassociated.id, unassociated.recordingId, unassociated.audio, 777);
        SummaryNotifications.refresh(context, unassociated.id);
        assertNull(fallback(unassociated));
        assertEquals(1, manager.getActiveNotifications().length);
        Notification adopted = notice("late", 1205);
        assertEquals(777, adopted.extras.getLong(SummaryNotifications.BRIEFING_ID));
        assertEquals(unassociated.id, adopted.extras.getLong(SummaryNotifications.JOB_ID));
        assertTrue((adopted.flags & Notification.FLAG_ONGOING_EVENT) != 0);
    }

    @Test public void finishSamplesCommittedOutcomeAndRefreshCannotRestoreOngoing() throws Exception {
        Bundle session = remoteSession();
        JSONObject snapshot = prepareLocal();
        assertEquals("pending", SummaryNotifications.outcome(context, job));
        SummaryNotifications.refresh(context, job.id);
        store.nativeCommitted(snapshot);
        request("finish", session);
        assertEquals(SummaryProgressNotification.resultText("local", false), fallback(job).extras.getString(Notification.EXTRA_TEXT));
        SummaryNotifications.refresh(context, job.id);
        request("heartbeat", session);
        request("stage", session);
        assertEquals(0, fallback(job).flags & Notification.FLAG_ONGOING_EVENT);
        assertEquals(0, fallback(job).getTimeoutAfter());
        assertEquals(SummaryProgressNotification.resultText("local", false), fallback(job).extras.getString(Notification.EXTRA_TEXT));
    }

    @Test public void commitAfterFinishReplacesPendingWithoutResurrectingProgress() throws Exception {
        Bundle session = remoteSession();
        JSONObject snapshot = prepareLocal();
        request("finish", session);
        assertEquals(SummaryProgressNotification.resultText("pending", false), fallback(job).extras.getString(Notification.EXTRA_TEXT));
        store.nativeCommitted(snapshot);
        SummaryNotifications.refresh(context, job.id);
        request("finish", session);
        assertEquals(SummaryProgressNotification.resultText("local", false), fallback(job).extras.getString(Notification.EXTRA_TEXT));
        assertEquals(0, fallback(job).flags & Notification.FLAG_ONGOING_EVENT);
    }

    @Test public void acknowledgedResultSurvivesJobPruningBeforeWorkerFinish() throws Exception {
        Bundle session = remoteSession();
        JSONObject snapshot = prepareLocal();
        store.nativeCommitted(snapshot);
        SummaryNotifications.refresh(context, job.id);
        store.getWritableDatabase().delete("jobs", "id=?", new String[]{Long.toString(job.id)});
        request("finish", session);
        assertEquals(SummaryProgressNotification.resultText("local", false), fallback(job).extras.getString(Notification.EXTRA_TEXT));
        assertEquals(0, fallback(job).flags & Notification.FLAG_ONGOING_EVENT);
        SummaryNotifications.refresh(context, job.id);
        assertEquals(0, fallback(job).flags & Notification.FLAG_ONGOING_EVENT);
    }

    @Test public void occupiedFallbackKeyNeverOverwritesAnUnrelatedNotification() {
        Notification unrelated = new Notification.Builder(context, "recorder")
                .setSmallIcon(android.R.drawable.stat_notify_sync).build();
        manager.notify(SummaryNotifications.fallbackTag(job.id), SummaryProgressNotification.NOTIFICATION, unrelated);
        progress.begin(job).accept("comparison");
        assertSame(unrelated, fallback(job));
        progress.shutdown();
        assertSame(unrelated, fallback(job));
    }

    @Test public void oldSessionAndOldProcessCommandsCannotMutateReplacementSession() {
        Bundle old = remoteSession();
        Bundle next = new Bundle(old);
        next.putString("session", request("begin", next).getString("session"));
        next.putString("stage", "comparison"); request("stage", next);
        String text = fallback(job).extras.getString(Notification.EXTRA_TEXT);
        request("finish", old); request("close", old); request("heartbeat", old);
        assertEquals(text, fallback(job).extras.getString(Notification.EXTRA_TEXT));
        Bundle replacement = remoteSession();
        replacement.putString("stage", "gemma_init"); request("stage", replacement);
        text = fallback(job).extras.getString(Notification.EXTRA_TEXT);
        request("begin", next); request("finish", next);
        assertEquals(text, fallback(job).extras.getString(Notification.EXTRA_TEXT));
    }

    @Test public void mainProcessRefreshNeverRenewsDeadWorkerLease() {
        Bundle session = remoteSession();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(SummaryProgressNotification.REFRESH_MS));
        SummaryNotifications.refresh(context, job.id);
        assertTrue(fallback(job).getTimeoutAfter() <= SummaryProgressNotification.TIMEOUT_MS - SummaryProgressNotification.REFRESH_MS);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(SummaryProgressNotification.TIMEOUT_MS));
        SummaryNotifications.refresh(context, job.id);
        assertNull(fallback(job));
        request("heartbeat", session); request("finish", session);
        assertNull(fallback(job));
    }
}
