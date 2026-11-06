package com.openbubbles.wear.patch;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.service.notification.StatusBarNotification;
import android.util.Log;
import com.openbubbles.wear.bridge.EmbeddedRuntime;
import com.openbubbles.wear.protocol.Protocol;

/** Mirrors only this app's notifications; preserves the host's original pending intents. */
public final class PhoneNotificationReceiver extends BroadcastReceiver {
    static final String ACTION_DISMISS = "com.openbubbles.wear.action.PHONE_NOTIFICATION_DISMISSED";
    static final String ORIGINAL_DELETE = "ob_wear_original_delete";
    static final String ORIGINAL_OPEN = "ob_wear_original_open";
    private static final String DISMISSED_AT = "notification_dismissed_at:";

    public static void prepare(Context context, Notification notification, String threadId) {
        if (!valid(threadId, notification.when)) return;
        Bundle extras = new Bundle(notification.extras);
        notification.extras = extras;
        if (!extras.containsKey(ORIGINAL_DELETE)) extras.putParcelable(ORIGINAL_DELETE, notification.deleteIntent);
        if (!extras.containsKey(ORIGINAL_OPEN)) extras.putParcelable(ORIGINAL_OPEN, notification.contentIntent);
        extras.putString(Protocol.EXTRA_NOTIFICATION_THREAD, threadId);
        extras.putLong(Protocol.EXTRA_NOTIFICATION_TIME, notification.when);
        Uri data = new Uri.Builder().scheme("openbubbles-wear").authority("dismiss")
                .appendPath(threadId).appendPath(Long.toString(notification.when)).build();
        Intent deleted = new Intent(context, PhoneNotificationReceiver.class).setAction(ACTION_DISMISS).setData(data)
                .putExtra(Protocol.EXTRA_NOTIFICATION_THREAD, threadId)
                .putExtra(Protocol.EXTRA_NOTIFICATION_TIME, notification.when)
                .putExtra(ORIGINAL_DELETE, (PendingIntent) extras.getParcelable(ORIGINAL_DELETE));
        notification.deleteIntent = PendingIntent.getBroadcast(context, 0, deleted,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        PendingIntent originalOpen = extras.getParcelable(ORIGINAL_OPEN);
        if (originalOpen != null) {
            Intent opened = new Intent(context, OpenActivity.class).setData(data)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_ANIMATION)
                    .putExtra(Protocol.EXTRA_NOTIFICATION_THREAD, threadId)
                    .putExtra(Protocol.EXTRA_NOTIFICATION_TIME, notification.when)
                    .putExtra(ORIGINAL_OPEN, originalOpen);
            notification.contentIntent = PendingIntent.getActivity(context, 0, opened,
                    PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        }
    }

    @Override public void onReceive(Context context, Intent intent) {
        if (!ACTION_DISMISS.equals(intent.getAction())) return;
        sendOriginal(intent.getParcelableExtra(ORIGINAL_DELETE));
        PendingResult pending = goAsync();
        com.google.android.gms.tasks.Task<?> task = publishLocal(context, intent.getStringExtra(Protocol.EXTRA_NOTIFICATION_THREAD),
                intent.getLongExtra(Protocol.EXTRA_NOTIFICATION_TIME, 0L));
        if (task == null) { if (pending != null) pending.finish(); }
        else com.google.android.gms.tasks.Tasks.withTimeout(task, 9L, java.util.concurrent.TimeUnit.SECONDS)
                .addOnCompleteListener(result -> { if (pending != null) pending.finish(); });
    }

    private static boolean valid(String threadId, long postedAt) {
        return threadId != null && Protocol.isNotificationThreadId(threadId) && postedAt > 0L;
    }

    private static void record(Context context, String threadId, long postedAt) {
        android.content.SharedPreferences prefs = context.getSharedPreferences(PatchSettings.PREFS, Context.MODE_PRIVATE);
        String key = DISMISSED_AT + threadId;
        prefs.edit().putLong(key, Math.max(postedAt, prefs.getLong(key, 0L))).apply();
    }

    static com.google.android.gms.tasks.Task<?> publishLocal(Context context, String threadId, long postedAt) {
        if (!valid(threadId, postedAt)) return null;
        try {
            record(context, threadId, postedAt);
            return PatchSettings.isEnabled(context) ? EmbeddedRuntime.publishNotificationDismissal(context, threadId, postedAt) : null;
        } catch (RuntimeException error) {
            Log.w("OBWearPatch", "Could not sync notification dismissal", error);
            return null;
        }
    }

    static boolean wasDismissed(Context context, String threadId, long postedAt) {
        return valid(threadId, postedAt) && postedAt <= context.getSharedPreferences(PatchSettings.PREFS,
                Context.MODE_PRIVATE).getLong(DISMISSED_AT + threadId, 0L);
    }

    public static void dismissMatching(Context context, String threadId, long postedAt) {
        if (!valid(threadId, postedAt)) throw new IllegalArgumentException("Invalid notification dismissal.");
        record(context, threadId, postedAt);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager == null) return;
        for (StatusBarNotification active : manager.getActiveNotifications()) {
            Notification notification = active.getNotification();
            if (!threadId.equals(notification.extras.getString(Protocol.EXTRA_NOTIFICATION_THREAD)) || notification.when > postedAt) continue;
            manager.cancel(active.getTag(), active.getId());
            sendOriginal(notification.extras.getParcelable(ORIGINAL_DELETE));
        }
    }

    private static void sendOriginal(PendingIntent original) {
        if (original == null) return;
        try { original.send(); }
        catch (PendingIntent.CanceledException error) { Log.w("OBWearPatch", "Original notification intent expired", error); }
    }

    public static final class OpenActivity extends Activity {
        @Override public void onCreate(Bundle state) {
            super.onCreate(state);
            Intent intent = getIntent();
            publishLocal(this, intent.getStringExtra(Protocol.EXTRA_NOTIFICATION_THREAD),
                    intent.getLongExtra(Protocol.EXTRA_NOTIFICATION_TIME, 0L));
            sendOriginal(intent.getParcelableExtra(ORIGINAL_OPEN));
            finish();
        }
    }
}
