package app.linenotifications.extension;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/** Explicit user actions through the same cached read updater as LINE's chat list. */
final class ReadActions {
    static final String ACTION = "app.linenotifications.action.MARK_CHAT_AS_READ";
    static final String ACTION_MARKER = "line_notification_patches.read_action";
    private static final String ACCOUNT = "line_notification_patches.read_account";
    private static final String CHAT = "line_notification_patches.read_chat";
    private static final String SERVICE = "jp.naver.line.android.access.remote.LineAccessServiceForNotification";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Set<String> BUSY = ConcurrentHashMap.newKeySet();

    private ReadActions() {}

    static Notification.Action action(Context context, String account, String chat) {
        if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)) {
            throw new IllegalArgumentException("Unsupported read action");
        }
        Intent intent = new Intent(ACTION).setClassName(context.getPackageName(), SERVICE)
                .setData(new Uri.Builder().scheme("line-notification-read").authority("chat")
                        .appendPath(identity(account, chat)).build())
                .putExtra(ACCOUNT, account).putExtra(CHAT, chat);
        PendingIntent pending = PendingIntent.getService(context, 0, intent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        Bundle extras = new Bundle();
        extras.putBoolean(ACTION_MARKER, true);
        return new Notification.Action.Builder(
                Icon.createWithResource("android", android.R.drawable.checkbox_on_background),
                Strings.get(context, "line_notify_action_mark_read", "Mark as read"), pending)
                .setSemanticAction(Notification.Action.SEMANTIC_ACTION_MARK_AS_READ)
                .setAllowGeneratedReplies(false).addExtras(extras).build();
    }

    /** Consumes only our private action, including stale or invalid requests. */
    static boolean handle(Context context, Intent intent) {
        if (intent == null || !ACTION.equals(intent.getAction())) return false;
        if (!Settings.readActionActive()) return true;
        try {
            String account = intent.getStringExtra(ACCOUNT);
            String chat = intent.getStringExtra(CHAT);
            if (account == null || !NativeLine.regularChat(chat) || !account.equals(NativeLine.account())) return true;
            // The PendingIntent is room-scoped, not bounded by its creation-time message.
            NativeLine.Chat state = NativeLine.chat(chat);
            if (state == null || state.unread == 0) return true;
            String key = identity(account, chat);
            if (!BUSY.add(key)) return true;
            AtomicBoolean finished = new AtomicBoolean();
            try {
                Method provider = NativeLine.type("bd0.f").getMethod("a", Context.class, NativeLine.type("bd0.a"));
                Class<?> holderType = NativeLine.type("x30.d");
                Object holder = provider.invoke(null, Settings.context(), holderType.getField("a").get(null));
                Object readHolder = holderType.getMethod("b").invoke(holder);
                Object updater = NativeLine.type("yl3.s0").getField("a").get(readHolder);
                Object completion = NativeLine.type("tn3.e").getMethod("e", String.class).invoke(updater, chat);

                // Resolve cleanup before submitting the read so adapter failures leave the notification intact.
                Class<?> cleanupType = NativeLine.type("j34.h");
                Object cleanup = provider.invoke(null, Settings.context(), cleanupType.getField("c").get(null));
                Object targets = Array.newInstance(NativeLine.type("j34.l"), 2);
                Array.set(targets, 0, NativeLine.type("j34.l$a").getConstructor(String.class).newInstance(chat));
                Array.set(targets, 1, NativeLine.type("j34.l$c").getConstructor(String.class).newInstance(chat));
                Method clear = cleanupType.getMethod("c", targets.getClass());
                Class<?> observerType = NativeLine.type("q08.b");
                Object observer = Proxy.newProxyInstance(Settings.context().getClassLoader(),
                        new Class<?>[]{observerType}, (proxy, method, args) -> {
                            switch (method.getName()) {
                                case "onComplete":
                                    if (finished.compareAndSet(false, true)) MAIN.post(() -> {
                                        try {
                                            if (!account.equals(NativeLine.account())) return;
                                            // This is native local completion, not a server delivery acknowledgment.
                                            clear.invoke(cleanup, targets);
                                            trace("read: native completion and room cleanup");
                                        } catch (ReflectiveOperationException | RuntimeException ignored) {
                                            failed(context, account);
                                        } finally { BUSY.remove(key); }
                                    });
                                    return null;
                                case "onError":
                                    if (finished.compareAndSet(false, true)) {
                                        BUSY.remove(key);
                                        failed(context, account);
                                    }
                                    return null;
                                case "b": return null; // onSubscribe: the native scheduler owns this operation's disposable.
                                case "hashCode": return System.identityHashCode(proxy);
                                case "equals": return proxy == args[0];
                                case "toString": return "NotificationReadObserver";
                                default: throw new UnsupportedOperationException("Unexpected read observer method");
                            }
                        });
                if (!Settings.readActionActive() || !account.equals(NativeLine.account())) {
                    BUSY.remove(key);
                    return true;
                }
                trace("read: native updater submitted");
                // tn3.e.e already selects LINE's IO scheduler and native offline retry policy.
                NativeLine.type("q08.a").getMethod("a", observerType).invoke(completion, observer);
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                if (finished.compareAndSet(false, true)) {
                    BUSY.remove(key);
                    failed(context, account);
                }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            trace("read: request rejected");
        }
        return true;
    }

    static String identity(String account, String chat) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256")
                    .digest((account + "\n" + chat).getBytes(StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder(digest.length * 2);
            for (byte value : digest) {
                result.append(Character.forDigit((value >>> 4) & 15, 16));
                result.append(Character.forDigit(value & 15, 16));
            }
            return result.toString();
        } catch (NoSuchAlgorithmException impossible) { throw new IllegalStateException(impossible); }
    }

    private static void failed(Context context, String account) {
        trace("read: native action failed");
        MAIN.post(() -> {
            try {
                if (account.equals(NativeLine.account())) {
                    Toast.makeText(context, Strings.get(context, "line_notify_toast_read_failed",
                            "Could not confirm mark-as-read result. Please check in LINE."), Toast.LENGTH_SHORT).show();
                }
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
        });
    }

    private static void trace(String stage) {
        if (android.util.Log.isLoggable("LineNotifyPatch", android.util.Log.DEBUG)) {
            android.util.Log.d("LineNotifyPatch", stage);
        }
    }
}
