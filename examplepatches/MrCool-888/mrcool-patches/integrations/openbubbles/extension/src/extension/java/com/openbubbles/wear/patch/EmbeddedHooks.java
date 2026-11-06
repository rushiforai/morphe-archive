package com.openbubbles.wear.patch;

import android.app.Notification;
import com.openbubbles.wear.bridge.BridgeInfo;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.localob.messaging.app.notifications.ChatNotifications;
import com.localob.messaging.backend.db.Attachment;
import com.localob.messaging.backend.db.Chat;
import com.localob.messaging.backend.db.Database;
import com.localob.messaging.backend.db.Message;
import com.localob.messaging.backend.prefs.SetupPrefs;
import com.openbubbles.wear.bridge.EmbeddedRuntime;
import io.objectbox.BoxStore;
import io.objectbox.reactive.DataSubscription;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/** Fail-safe entry points injected into the native app's own lifecycle and notification path. */
public final class EmbeddedHooks {
    private static final String TAG = "OBWearPatch";
    private static final int MAX_STORE_ATTEMPTS = 20;
    private static final long STORE_RETRY_MS = 500L;
    private static final Object LOCK = new Object();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean changeQueued = new AtomicBoolean();
    private static final List<DataSubscription> subscriptions = new ArrayList<>();
    private static boolean started;

    private EmbeddedHooks() { }

    public static void start(Context context) {
        try {
            synchronized (LOCK) {
                if (started) return;
                Context app = context.getApplicationContext();
                EmbeddedRuntime.initialize(app, new EmbeddedBackend(app));
                started = true;
            }
            attachStore(0);
        } catch (Throwable error) {
            Log.e(TAG, "Embedded Wear bridge initialization failed", error);
        }
    }

    private static void attachStore(int attempt) {
        List<DataSubscription> next = new ArrayList<>();
        try {
            BoxStore store = Database.INSTANCE.getStore();
            next.add(store.subscribe(Chat.class).observer(ignored -> scheduleBackendChanged()));
            next.add(store.subscribe(Message.class).observer(ignored -> scheduleBackendChanged()));
            next.add(store.subscribe(Attachment.class).observer(ignored -> scheduleBackendChanged()));
            synchronized (LOCK) {
                if (subscriptions.isEmpty()) subscriptions.addAll(next);
                else for (DataSubscription subscription : next) subscription.cancel();
            }
            scheduleBackendChanged();
        } catch (Throwable error) {
            for (DataSubscription subscription : next) subscription.cancel();
            if (attempt + 1 < MAX_STORE_ATTEMPTS) {
                MAIN.postDelayed(() -> attachStore(attempt + 1), STORE_RETRY_MS);
            } else {
                Log.w(TAG, "Wear bridge could not subscribe to the OpenBubbles database", error);
            }
        }
    }

    private static void scheduleBackendChanged() {
        if (!changeQueued.compareAndSet(false, true)) return;
        MAIN.post(() -> {
            changeQueued.set(false);
            try { EmbeddedRuntime.onBackendChanged(); }
            catch (Throwable error) { Log.w(TAG, "Embedded backend refresh failed", error); }
        });
    }

    public static void prepareNotification(Context context, Notification notification) {
        try {
            if (notification == null) return;
            String shortcut = notification.getShortcutId();
            if (shortcut == null || shortcut.isEmpty()) return;
            String chatGuid = ChatNotifications.INSTANCE.chatGuidForShortcut(context, shortcut);
            if (chatGuid == null || chatGuid.isEmpty()) return;
            linkNotification(context, notification, chatGuid);
        } catch (Throwable error) {
            Log.w(TAG, "Could not link phone and watch notification dismissals", error);
        }
    }

    static void linkNotification(Context context, Notification notification, String chatGuid) {
        PhoneNotificationReceiver.prepare(context, notification, "chat_" + chatGuid);
    }

    public static void onNotificationPosted(Context context, Notification notification, boolean silent) {
        try {
            if (notification == null) return;
            if (android.os.Build.VERSION.SDK_INT < 29) return;
            String shortcut = notification.getShortcutId();
            if (shortcut == null || shortcut.isEmpty()) return;
            String chatGuid = ChatNotifications.INSTANCE.chatGuidForShortcut(context, shortcut);
            if (chatGuid == null || chatGuid.isEmpty()) return;
            if (PhoneNotificationReceiver.wasDismissed(context, "chat_" + chatGuid, notification.when)) {
                PhoneNotificationReceiver.dismissMatching(context, "chat_" + chatGuid, notification.when);
                return;
            }
            if (!shouldForwardNotification(context, notification, silent)) return;
            EmbeddedRuntime.onAlert(chatGuid, notification.when, SetupPrefs.INSTANCE.getHideTextPreviews());
        } catch (Throwable error) {
            Log.w(TAG, "Could not forward OpenBubbles notification to Wear", error);
        }
    }

    static boolean shouldForwardNotification(Context context, Notification notification, boolean silent) {
        if (silent || notification == null) return false;
        if (!BridgeInfo.shouldAlertWatch(context)) return false;
        android.app.NotificationManager manager = context.getSystemService(android.app.NotificationManager.class);
        if (manager == null || !manager.areNotificationsEnabled()) return false;
        android.app.NotificationChannel channel = manager.getNotificationChannel(notification.getChannelId());
        return channel == null || channel.getImportance() != android.app.NotificationManager.IMPORTANCE_NONE;
    }

}
