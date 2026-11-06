package com.openbubbles.wear.patch;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Person;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.openbubbles.wear.bridge.EmbeddedRuntime;
import com.openbubbles.wear.protocol.Protocol;
import com.openbubbles.wear.protocol.WireThread;

/** A local notification exercise; never creates a database message or sends to a recipient. */
public final class TestNotifications {
    static final String CHANNEL = "openbubbles.wear.test";
    static final String TAG = "openbubbles-notification-test";
    static final int ID = 1;
    static final long DELAY_MS = 10_000L;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static Runnable pending;

    private TestNotifications() { }

    public static String schedule(Context context) {
        try {
            context.getPackageManager().getServiceInfo(new ComponentName(context,
                    "com.openbubbles.wear.bridge.WearBridgeService"), 0);
        } catch (PackageManager.NameNotFoundException error) {
            return "Select the Wear companion bridge patch to test notifications.";
        }
        if (!PatchSettings.isEnabled(context)) return "Turn on the Wear companion bridge first.";
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager == null || !manager.areNotificationsEnabled()) return "Allow OpenBubbles notifications first.";
        manager.createNotificationChannel(new NotificationChannel(CHANNEL, "Test messages", NotificationManager.IMPORTANCE_HIGH));
        if (manager.getNotificationChannel(CHANNEL).getImportance() == NotificationManager.IMPORTANCE_NONE)
            return "Allow the Test messages notification channel first.";
        Context app = context.getApplicationContext();
        if (pending != null) MAIN.removeCallbacks(pending);
        pending = () -> {
            pending = null;
            try { post(app); }
            catch (RuntimeException error) { Log.w("OBWearPatch", "Could not post test notification", error); }
        };
        MAIN.postDelayed(pending, DELAY_MS);
        return "Test notification in 10 seconds. Lock your phone to test watch alerts.";
    }

    private static void post(Context context) {
        if (!PatchSettings.isEnabled(context)) return;
        long now = System.currentTimeMillis();
        WireThread thread = Protocol.testNotificationThread(now);
        Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        if (launch == null) return;
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        PendingIntent open = PendingIntent.getActivity(context, ID, launch,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        Person sender = new Person.Builder().setName("OpenBubbles test").build();
        String text = thread.getMessages().get(0).getDisplayText();
        Notification notification = new Notification.Builder(context, CHANNEL)
                .setSmallIcon(android.R.drawable.sym_action_chat)
                .setContentTitle(thread.getTitle()).setContentText(text)
                .setStyle(new Notification.MessagingStyle(new Person.Builder().setName("You").build())
                        .addMessage(text, now, sender))
                .setCategory(Notification.CATEGORY_MESSAGE).setWhen(now)
                .setAutoCancel(true).setContentIntent(open)
                .build();
        PhoneNotificationReceiver.prepare(context, notification, Protocol.TEST_NOTIFICATION_THREAD_ID);
        context.getSystemService(NotificationManager.class).notify(TAG, ID, notification);
        boolean eligible = EmbeddedHooks.shouldForwardNotification(context, notification, false);
        Log.i("OBWearTest", "Phone test posted; watch eligible=" + eligible);
        if (eligible)
            EmbeddedRuntime.onTestAlert(now);
    }
}
