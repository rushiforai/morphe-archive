package app.linenotifications.extension;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;
import app.linenotifications.extension.core.NotificationPolicy;

/** Account-bound mute action so stale notifications cannot change another account's room state. */
final class MuteActions {
    static final String ACTION = "app.linenotifications.action.MUTE_CHAT_QUIET";
    private static final String ACCOUNT = "line_notification_patches.mute_account";
    private static final String CHAT = "line_notification_patches.mute_chat";
    private static final String SERVICE = "jp.naver.line.android.access.remote.LineAccessServiceForNotification";

    private MuteActions() {}

    static Notification.Action action(Context context, String account, String chat, Notification.Action nativeMute) {
        if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)) {
            throw new IllegalArgumentException("Unsupported mute action");
        }
        Intent intent = new Intent(ACTION).setClassName(context.getPackageName(), SERVICE)
                .setData(new Uri.Builder().scheme("line-notification-mute").authority("chat")
                        .appendPath(ReadActions.identity(account, chat)).build())
                .putExtra(ACCOUNT, account).putExtra(CHAT, chat);
        PendingIntent pending = PendingIntent.getService(context, 0, intent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        Icon icon = nativeMute != null && nativeMute.getIcon() != null
                ? nativeMute.getIcon()
                : Icon.createWithResource("android", android.R.drawable.ic_lock_silent_mode);
        CharSequence title = nativeMute != null ? nativeMute.title : null;
        if (title == null || title.length() == 0) {
            int resId = context.getResources().getIdentifier(
                    "notification_button_mute", "string", context.getPackageName());
            title = resId != 0 ? context.getText(resId) : "Mute";
        }
        Notification.Action.Builder builder = new Notification.Action.Builder(icon, title, pending)
                .setSemanticAction(Notification.Action.SEMANTIC_ACTION_MUTE)
                .setAllowGeneratedReplies(false)
                .setContextual(nativeMute != null && nativeMute.isContextual());
        if (Build.VERSION.SDK_INT >= 31) {
            builder.setAuthenticationRequired(nativeMute != null && nativeMute.isAuthenticationRequired());
        }
        return builder.build();
    }

    /** Consumes only our private account-bound mute action, including stale or cross-account taps. */
    static boolean handle(Context context, Intent intent) {
        if (intent == null || !ACTION.equals(intent.getAction())) return false;
        if (!Settings.enabled(Settings.SILENT)) return true;
        String account = intent.getStringExtra(ACCOUNT);
        String chat = intent.getStringExtra(CHAT);
        try {
            if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)
                    || !NotificationPolicy.sameAccount(account, NativeLine.account())) {
                trace("mute: action dropped on account mismatch");
                return true;
            }
            ChatNotifications.change(context, account, chat, ChatNotifications.QUIET, null, success -> {
                if (!Boolean.TRUE.equals(success)) return;
                try {
                    if (!NotificationPolicy.sameAccount(account, NativeLine.account())) return;
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    return;
                }
                NotificationManager manager = context.getSystemService(NotificationManager.class);
                Notifications.cancelChatNotifications(manager, account, chat);
            });
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            trace("mute: action rejected");
        }
        return true;
    }

    private static void trace(String stage) {
        if (android.util.Log.isLoggable("LineNotifyPatch", android.util.Log.DEBUG)) {
            android.util.Log.d("LineNotifyPatch", stage);
        }
    }
}
