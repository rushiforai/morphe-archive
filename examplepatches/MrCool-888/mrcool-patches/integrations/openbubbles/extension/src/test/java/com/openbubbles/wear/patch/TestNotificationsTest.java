package com.openbubbles.wear.patch;

import android.app.Application;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.KeyguardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Looper;
import com.openbubbles.wear.protocol.Protocol;
import java.time.Duration;
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
public class TestNotificationsTest {
    private Context context;
    private NotificationManager manager;
    private ComponentName bridge;

    @Before public void setup() {
        context = RuntimeEnvironment.getApplication();
        context.getSharedPreferences(PatchSettings.PREFS, Context.MODE_PRIVATE).edit().clear().commit();
        manager = context.getSystemService(NotificationManager.class);
        manager.cancelAll();
        bridge = new ComponentName(context, "com.openbubbles.wear.bridge.WearBridgeService");
        Shadows.shadowOf(context.getPackageManager()).addServiceIfNotPresent(bridge);
        ComponentName launcher = new ComponentName(context, "com.openbubbles.TestLauncher");
        Shadows.shadowOf(context.getPackageManager()).addActivityIfNotPresent(launcher);
        IntentFilter filter = new IntentFilter(Intent.ACTION_MAIN);
        filter.addCategory(Intent.CATEGORY_LAUNCHER);
        Shadows.shadowOf(context.getPackageManager()).addIntentFilterForActivity(launcher, filter);
    }

    @Test public void buttonRequiresTheSelectedAndEnabledWatchBridge() {
        Shadows.shadowOf(context.getPackageManager()).removeService(bridge);
        assertTrue(TestNotifications.schedule(context).contains("Select the Wear companion bridge"));
        Shadows.shadowOf(context.getPackageManager()).addServiceIfNotPresent(bridge);
        PatchSettings.setEnabled(context, false);
        assertTrue(TestNotifications.schedule(context).contains("Turn on"));
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(11));
        assertEquals(0, manager.getActiveNotifications().length);
    }

    @Test public void delayedTestPreservesOtherNotificationsAndCarriesDismissalMetadata() {
        assertTrue(TestNotifications.schedule(context).contains("10 seconds"));
        Notification other = new Notification.Builder(context, TestNotifications.CHANNEL)
                .setSmallIcon(android.R.drawable.sym_action_chat).setContentTitle("Other").build();
        manager.notify("unrelated", 99, other);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(9));
        assertEquals(1, manager.getActiveNotifications().length);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        assertEquals(2, manager.getActiveNotifications().length);
        Notification test = java.util.Arrays.stream(manager.getActiveNotifications())
                .filter(n -> TestNotifications.TAG.equals(n.getTag())).findFirst().get().getNotification();
        assertEquals(Protocol.TEST_NOTIFICATION_THREAD_ID, test.extras.getString(Protocol.EXTRA_NOTIFICATION_THREAD));
        assertEquals(test.when, test.extras.getLong(Protocol.EXTRA_NOTIFICATION_TIME));
        assertNull(new Notification.WearableExtender(test).getDismissalId());
        assertNotNull(test.contentIntent);
        android.os.Parcelable[] messages = test.extras.getParcelableArray(Notification.EXTRA_MESSAGES);
        assertNotNull(messages);
        assertTrue(((android.os.Bundle) messages[0]).getCharSequence("text").toString()
                .contains("No message was sent"));
    }

    @Test public void repeatedClicksReplaceThePendingTestAndDisabledBridgeCancelsDelivery() {
        TestNotifications.schedule(context);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(5));
        TestNotifications.schedule(context);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(5));
        assertEquals(0, manager.getActiveNotifications().length);
        PatchSettings.setEnabled(context, false);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(5));
        assertEquals(0, manager.getActiveNotifications().length);
    }

    @Test public void laterTestCarriesANewerDismissalCutoff() {
        TestNotifications.schedule(context);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(10));
        long first = manager.getActiveNotifications()[0].getNotification().extras.getLong(Protocol.EXTRA_NOTIFICATION_TIME);
        manager.cancel(TestNotifications.TAG, TestNotifications.ID);
        TestNotifications.schedule(context);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(10));
        long second = manager.getActiveNotifications()[0].getNotification().extras.getLong(Protocol.EXTRA_NOTIFICATION_TIME);
        assertNotEquals(first, second);
        assertEquals(1, manager.getActiveNotifications().length);
    }
}
