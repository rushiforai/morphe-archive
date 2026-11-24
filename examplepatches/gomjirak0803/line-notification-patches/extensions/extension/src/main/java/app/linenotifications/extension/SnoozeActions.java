package app.linenotifications.extension;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.service.notification.StatusBarNotification;
import android.widget.Toast;
import app.linenotifications.extension.core.NotificationPolicy;

/** Local timed silent action for regular chats without server mute sync. */
final class SnoozeActions {
    static final String ACTION = "app.linenotifications.action.SNOOZE_CHAT_1H";
    private static final String ACCOUNT = "line_notification_patches.snooze_account";
    private static final String CHAT = "line_notification_patches.snooze_chat";
    private static final String SERVICE = "jp.naver.line.android.access.remote.LineAccessServiceForNotification";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private SnoozeActions() {}

    static Notification.Action action(Context context, String account, String chat) {
        if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)) {
            throw new IllegalArgumentException("Unsupported snooze action");
        }
        Intent intent = new Intent(ACTION).setClassName(context.getPackageName(), SERVICE)
                .setData(new Uri.Builder().scheme("line-notification-snooze").authority("chat")
                        .appendPath(ReadActions.identity(account, chat)).build())
                .putExtra(ACCOUNT, account).putExtra(CHAT, chat);
        PendingIntent pending = PendingIntent.getService(context, 0, intent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        return new Notification.Action.Builder(
                Icon.createWithResource("android", android.R.drawable.ic_lock_silent_mode),
                Strings.get(context, "line_notify_action_snooze_1h", "Quiet 1h"), pending)
                .setSemanticAction(Notification.Action.SEMANTIC_ACTION_MUTE)
                .setAllowGeneratedReplies(false).build();
    }

    /** Consumes only our private 1-hour snooze action, including stale or invalid requests. */
    static boolean handle(Context context, Intent intent) {
        if (intent == null || !ACTION.equals(intent.getAction())) return false;
        try {
            String account = intent.getStringExtra(ACCOUNT);
            String chat = intent.getStringExtra(CHAT);
            if (account == null || !NativeLine.regularChat(chat) || !account.equals(NativeLine.account())) return true;
            Settings.snooze(account, chat, NotificationPolicy.SNOOZE_1H_MILLIS);
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            Notifications.cancelChatNotifications(manager, account, chat);
            trace("snooze: 1h applied");
            MAIN.post(() -> {
                try {
                    if (account.equals(NativeLine.account())) {
                        Toast.makeText(context, Strings.get(context, "line_notify_toast_snoozed_1h",
                                "Silenced this chat for 1 hour."), Toast.LENGTH_SHORT).show();
                    }
                } catch (ReflectiveOperationException | RuntimeException ignored) { }
            });
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            trace("snooze: request rejected");
        }
        return true;
    }

    private static void trace(String stage) {
        if (android.util.Log.isLoggable("LineNotifyPatch", android.util.Log.DEBUG)) {
            android.util.Log.d("LineNotifyPatch", stage);
        }
    }
}
