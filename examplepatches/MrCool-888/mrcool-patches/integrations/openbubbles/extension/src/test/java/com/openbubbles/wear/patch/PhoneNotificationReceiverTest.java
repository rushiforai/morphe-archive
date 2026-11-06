package com.openbubbles.wear.patch;

import android.app.Application;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import com.openbubbles.wear.protocol.Protocol;
import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = {32}, application = Application.class)
public class PhoneNotificationReceiverTest {
    private Context context;
    private NotificationManager manager;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        manager = context.getSystemService(NotificationManager.class);
        manager.cancelAll();
        context.getSharedPreferences(PatchSettings.PREFS, Context.MODE_PRIVATE).edit().clear().commit();
    }

    @Test public void prepareTwiceKeepsTheOriginalDeleteAndOpenIntents() throws Exception {
        PendingIntent delete = originalIntent("delete");
        PendingIntent open = originalIntent("open");
        Notification notification = notification(100L, delete, open);

        PhoneNotificationReceiver.prepare(context, notification, Protocol.TEST_NOTIFICATION_THREAD_ID);
        PendingIntent wrappedDelete = notification.deleteIntent;
        PendingIntent wrappedOpen = notification.contentIntent;
        PhoneNotificationReceiver.prepare(context, notification, Protocol.TEST_NOTIFICATION_THREAD_ID);

        assertEquals(wrappedDelete, notification.deleteIntent);
        assertEquals(wrappedOpen, notification.contentIntent);
        assertSame(delete, notification.extras.getParcelable(PhoneNotificationReceiver.ORIGINAL_DELETE));
        assertSame(open, notification.extras.getParcelable(PhoneNotificationReceiver.ORIGINAL_OPEN));
        Intent sent = Shadows.shadowOf(notification.deleteIntent).getSavedIntent();
        assertEquals(PhoneNotificationReceiver.ACTION_DISMISS, sent.getAction());
        assertEquals(delete, sent.getParcelableExtra(PhoneNotificationReceiver.ORIGINAL_DELETE));
    }

    @Test public void matchingDismissalClearsOnlySameChatNotificationsUpToTimestamp() {
        String chat = "chat_iMessage;-;other@example.com";
        manager.notify("old", 1, taggedNotification(chat, 100L, originalIntent("old-delete")));
        manager.notify("new", 2, taggedNotification(chat, 201L, originalIntent("new-delete")));
        manager.notify("other", 3, taggedNotification("chat_iMessage;-;else@example.com", 90L,
                originalIntent("other-delete")));

        PhoneNotificationReceiver.dismissMatching(context, chat, 200L);

        assertEquals(2, manager.getActiveNotifications().length);
        assertTrue(PhoneNotificationReceiver.wasDismissed(context, chat, 100L));
        assertTrue(PhoneNotificationReceiver.wasDismissed(context, chat, 200L));
        assertFalse(PhoneNotificationReceiver.wasDismissed(context, chat, 201L));
        assertEquals(1, Shadows.shadowOf((Application) context).getBroadcastIntents().size());
        assertEquals("old-delete", Shadows.shadowOf((Application) context).getBroadcastIntents().get(0).getAction());
    }

    @Test public void receivedSwipeCallsOriginalDeleteAndStoresChatWatermark() throws Exception {
        String chat = "chat_iMessage;-;other@example.com";
        Notification notification = notification(345L, originalIntent("native-delete"), null);
        PhoneNotificationReceiver.prepare(context, notification, chat);
        Intent cleared = Shadows.shadowOf(notification.deleteIntent).getSavedIntent();
        new PhoneNotificationReceiver().onReceive(context, cleared);

        assertTrue(PhoneNotificationReceiver.wasDismissed(context, chat, 345L));
        assertEquals("native-delete", Shadows.shadowOf((Application) context).getBroadcastIntents().get(0).getAction());
    }

    @Test public void embeddedDismissalWorksWithoutBackendStartupOrMarkRead() throws Exception {
        JSONObject request = new JSONObject().put("apiVersion", BridgeOps.API_VERSION)
                .put("op", "dismissNotification").put("threadId", Protocol.TEST_NOTIFICATION_THREAD_ID)
                .put("postedAt", 500L);

        JSONObject response = new JSONObject(new EmbeddedBackend(context).execute(request.toString()));

        assertTrue(response.optBoolean("ok"));
        assertTrue(PhoneNotificationReceiver.wasDismissed(context, Protocol.TEST_NOTIFICATION_THREAD_ID, 500L));
        assertEquals(0, manager.getActiveNotifications().length);
    }

    @Test public void openingKeepsTheNativeContentIntentAndPublishesTheDismissal() {
        Notification notification = notification(456L, null, originalIntent("native-open"));
        PhoneNotificationReceiver.prepare(context, notification, Protocol.TEST_NOTIFICATION_THREAD_ID);
        Intent opened = Shadows.shadowOf(notification.contentIntent).getSavedIntent();
        org.robolectric.Robolectric.buildActivity(PhoneNotificationReceiver.OpenActivity.class, opened).create();
        assertTrue(PhoneNotificationReceiver.wasDismissed(context, Protocol.TEST_NOTIFICATION_THREAD_ID, 456L));
        assertEquals("native-open", Shadows.shadowOf((Application) context).getBroadcastIntents().get(0).getAction());
    }

    private PendingIntent originalIntent(String action) {
        return PendingIntent.getBroadcast(context, action.hashCode(), new Intent(action),
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
    }

    private Notification notification(long when, PendingIntent delete, PendingIntent open) {
        Notification notification = new Notification.Builder(context)
                .setWhen(when).setSmallIcon(android.R.drawable.ic_dialog_info).build();
        notification.deleteIntent = delete;
        notification.contentIntent = open;
        return notification;
    }

    private Notification taggedNotification(String thread, long when, PendingIntent delete) {
        Notification notification = notification(when, delete, null);
        notification.extras.putString(Protocol.EXTRA_NOTIFICATION_THREAD, thread);
        notification.extras.putLong(Protocol.EXTRA_NOTIFICATION_TIME, when);
        notification.extras.putParcelable(PhoneNotificationReceiver.ORIGINAL_DELETE, delete);
        return notification;
    }
}
