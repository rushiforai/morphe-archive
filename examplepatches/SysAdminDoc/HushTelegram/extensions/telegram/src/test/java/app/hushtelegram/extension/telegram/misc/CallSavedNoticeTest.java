/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowNotificationManager;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CallSavedNoticeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final Uri RECORDING = Uri.parse("content://media/external/audio/media/42");
    private static final String NAME = "Telegram call with Alex Kim 2026-11-12 14-05.m4a";

    private CallSavedNotice.Reader<Long> realSelf;
    private CallSavedNotice.Reader<String> realKey;

    private static Context context() {
        return RuntimeEnvironment.getApplication();
    }

    private static ShadowNotificationManager notifications() {
        return shadowOf((NotificationManager) context().getSystemService(Context.NOTIFICATION_SERVICE));
    }

    private static Intent saved(Notification.Action action) {
        return shadowOf(action.actionIntent).getSavedIntent();
    }

    @Before public void setUp() {
        realSelf = CallSavedNotice.self;
        realKey = CallSavedNotice.shareKey;
        CallSavedNotice.self = () -> 1000L;
        CallSavedNotice.shareKey = () -> "telegrams-own-key";
        Settings.RECORD_CALLS_NOTIFY.save(true);
        HookStatus.clear();
    }

    @After public void tearDown() {
        CallSavedNotice.self = realSelf;
        CallSavedNotice.shareKey = realKey;
        Settings.RECORD_CALLS_NOTIFY.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultSoASaveStaysQuiet() {
        Settings.RECORD_CALLS_NOTIFY.resetToDefault();
        assertFalse(Settings.RECORD_CALLS_NOTIFY.get());
        CallSavedNotice.show(context(), RECORDING, NAME, CallRecordings.MIME);
        assertEquals(0, notifications().size());
    }

    @Test public void aSavedRecordingPlaysOnATapAndSharesTwoWays() {
        CallSavedNotice.show(context(), RECORDING, NAME, CallRecordings.MIME);
        assertEquals(1, notifications().size());
        Notification shown = notifications().getNotification(CallSavedNotice.NOTIFICATION_ID);
        assertNotNull(shown);
        assertEquals(CallSavedNotice.CHANNEL, shown.getChannelId());
        NotificationManager manager = context().getSystemService(NotificationManager.class);
        assertEquals("Call recordings", String.valueOf(manager.getNotificationChannel(CallSavedNotice.CHANNEL).getName()));
        assertEquals("Call recording saved", String.valueOf(shown.extras.getCharSequence(Notification.EXTRA_TITLE)));
        assertEquals(NAME, String.valueOf(shown.extras.getCharSequence(Notification.EXTRA_TEXT)));

        Intent play = shadowOf(shown.contentIntent).getSavedIntent();
        assertEquals(Intent.ACTION_VIEW, play.getAction());
        assertEquals(RECORDING, play.getData());
        assertEquals(CallRecordings.MIME, play.getType());
        assertTrue((play.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0);

        assertEquals(2, shown.actions.length);
        assertEquals("Share", String.valueOf(shown.actions[0].title));
        Intent chooser = saved(shown.actions[0]);
        assertEquals(Intent.ACTION_CHOOSER, chooser.getAction());
        Intent share = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertEquals(Intent.ACTION_SEND, share.getAction());
        assertEquals(RECORDING, share.getParcelableExtra(Intent.EXTRA_STREAM));
        assertEquals(RECORDING, share.getClipData().getItemAt(0).getUri());
        assertTrue((share.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0);

        assertEquals("Saved Messages", String.valueOf(shown.actions[1].title));
        Intent own = saved(shown.actions[1]);
        assertEquals(Intent.ACTION_SEND, own.getAction());
        assertEquals(context().getPackageName(), own.getComponent().getPackageName());
        assertEquals(CallSavedNotice.LAUNCH_ACTIVITY, own.getComponent().getClassName());
        assertEquals(RECORDING, own.getParcelableExtra(Intent.EXTRA_STREAM));
        assertEquals(CallRecordings.MIME, own.getType());
        assertEquals("the account's own chat", 1000L, own.getLongExtra("dialogId", 0));
        assertEquals("telegrams-own-key", own.getStringExtra("hash"));
    }

    @Test public void withoutTheAccountOrTheKeySavedMessagesLeavesTelegramToAsk() {
        CallSavedNotice.shareKey = () -> null;
        Intent own = CallSavedNotice.savedMessages(context(), RECORDING, CallRecordings.MIME);
        assertFalse(own.hasExtra("dialogId"));
        assertFalse(own.hasExtra("hash"));

        CallSavedNotice.shareKey = () -> "telegrams-own-key";
        CallSavedNotice.self = () -> {
            throw new ClassNotFoundException("org.telegram.messenger.UserConfig");
        };
        own = CallSavedNotice.savedMessages(context(), RECORDING, CallRecordings.MIME);
        assertFalse(own.hasExtra("dialogId"));
        assertEquals(CallSavedNotice.LAUNCH_ACTIVITY, own.getComponent().getClassName());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("saved messages share"));
    }

    @Test public void aRecordingWithNoAddressGetsNoNotification() {
        CallSavedNotice.show(context(), null, NAME, CallRecordings.MIME);
        assertEquals(0, notifications().size());
    }
}
