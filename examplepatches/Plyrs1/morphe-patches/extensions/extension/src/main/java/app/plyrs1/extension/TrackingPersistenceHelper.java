package app.plyrs1.extension;

import android.app.Activity;
import android.app.Application;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.service.notification.StatusBarNotification;
import android.util.Log;

import java.lang.reflect.Method;

public final class TrackingPersistenceHelper {
    private static final String TAG = "TrackingPersistence";
    private static final int NOTIFICATION_ID = 92901;
    private static final String ACTION_NOTIFICATION_DISMISSED = "app.plyrs1.gajihub.ACTION_NOTIFICATION_DISMISSED";
    private static final String TARGET_SERVICE_CLASS = "com.asterinet.react.bgactions.RNBackgroundActionsTask";
    private static final long RESUME_RECOVERY_DELAY_MS = 500L;

    private static volatile boolean patchActive = false;
    private static volatile Context appContext = null;
    private static volatile Object lastReactContext = null;
    private static volatile String lastTaskName = "LocationTracking";
    private static volatile boolean serviceRunning = false;
    private static volatile boolean expectedStop = false;
    private static volatile boolean pendingResetEmit = false;
    private static volatile boolean appForeground = false;
    private static volatile Notification lastBuiltNotification = null;
    private static volatile boolean receiverRegistered = false;
    private static volatile boolean lifecycleRegistered = false;

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private TrackingPersistenceHelper() {}

    public static boolean isActive() {
        return patchActive;
    }

    private static Context safeAppContext(Context context) {
        if (context == null) return appContext;
        Context app = context.getApplicationContext();
        return app != null ? app : context;
    }

    public static void setContext(Context context) {
        patchActive = true;
        if (context != null) {
            appContext = safeAppContext(context);
            ensureInitialized(appContext);
        }
    }

    private static void ensureInitialized(Context context) {
        if (context == null) return;
        ensureReceiverRegistered(context);
        ensureLifecycleRegistered(context);
    }

    private static synchronized void ensureReceiverRegistered(Context context) {
        if (receiverRegistered || context == null) {
            return;
        }
        Context ctx = safeAppContext(context);
        BroadcastReceiver receiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context c, Intent intent) {
                if (intent == null || !ACTION_NOTIFICATION_DISMISSED.equals(intent.getAction())) {
                    return;
                }
                if (serviceRunning) {
                    repostNotification(c);
                }
            }
        };
        IntentFilter filter = new IntentFilter(ACTION_NOTIFICATION_DISMISSED);
        if (Build.VERSION.SDK_INT >= 33) {
            ctx.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
        } else {
            ctx.registerReceiver(receiver, filter);
        }
        receiverRegistered = true;
    }

    private static synchronized void ensureLifecycleRegistered(Context context) {
        if (lifecycleRegistered || context == null) {
            return;
        }
        Context app = safeAppContext(context);
        if (!(app instanceof Application)) {
            return;
        }
        ((Application) app).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}

            @Override
            public void onActivityStarted(Activity activity) {}

            @Override
            public void onActivityResumed(Activity activity) {
                appForeground = true;
                onAppResumed(activity);
            }

            @Override
            public void onActivityPaused(Activity activity) {
                appForeground = false;
            }

            @Override
            public void onActivityStopped(Activity activity) {}

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}

            @Override
            public void onActivityDestroyed(Activity activity) {}
        });
        lifecycleRegistered = true;
    }

    public static void applyDeleteIntent(Context context, Notification.Builder builder) {
        if (context == null || builder == null) return;
        Context ctx = safeAppContext(context);
        ensureInitialized(ctx);
        int flags = PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE;
        Intent dismissIntent = new Intent(ACTION_NOTIFICATION_DISMISSED).setPackage(ctx.getPackageName());
        PendingIntent dismissPending = PendingIntent.getBroadcast(ctx, 103, dismissIntent, flags);
        builder.setOngoing(true);
        builder.setDeleteIntent(dismissPending);
    }

    public static Notification attachDeleteIntent(Notification notification) {
        return attachDeleteIntent(appContext, notification);
    }

    public static Notification attachDeleteIntent(Context context, Notification notification) {
        patchActive = true;
        if (context == null || notification == null) {
            return notification;
        }
        appContext = safeAppContext(context);
        ensureInitialized(appContext);

        if (Build.VERSION.SDK_INT < 24) {
            lastBuiltNotification = notification.clone();
            return notification;
        }

        try {
            Notification.Builder builder = Notification.Builder.recoverBuilder(appContext, notification.clone());
            applyDeleteIntent(appContext, builder);
            Notification built = builder.build();
            lastBuiltNotification = built.clone();
            return built;
        } catch (Throwable t) {
            Log.e(TAG, "Failed to attach deleteIntent", t);
            lastBuiltNotification = notification.clone();
            return notification;
        }
    }

    public static void onModuleStart(Object reactContextObj, Object optionsMapObj) {
        patchActive = true;
        if (reactContextObj != null) {
            lastReactContext = reactContextObj;
            if (reactContextObj instanceof Context) {
                setContext((Context) reactContextObj);
            }
        }
        expectedStop = false;
        pendingResetEmit = false;

        if (optionsMapObj != null) {
            try {
                Method hasKey = optionsMapObj.getClass().getMethod("hasKey", String.class);
                if ((Boolean) hasKey.invoke(optionsMapObj, "taskName")) {
                    Method getString = optionsMapObj.getClass().getMethod("getString", String.class);
                    String name = (String) getString.invoke(optionsMapObj, "taskName");
                    if (name != null && !name.isEmpty()) {
                        lastTaskName = name;
                    }
                }
            } catch (Throwable ignored) {}
        }
    }

    public static void onExplicitStop() {
        patchActive = true;
        expectedStop = true;
        serviceRunning = false;
        pendingResetEmit = false;
    }

    public static void onServiceStart(Service service, Intent intent) {
        patchActive = true;
        if (service != null) {
            setContext(service);
        }
        if (intent == null) {
            return;
        }
        Bundle extras = intent.getExtras();
        if (extras != null) {
            String name = extras.getString("taskName");
            if (name != null && !name.isEmpty()) {
                lastTaskName = name;
            }
            serviceRunning = true;
            expectedStop = false;
            pendingResetEmit = false;
        }
    }

    public static void onServiceDestroy(Service service) {
        if (service == null) return;
        if (!TARGET_SERVICE_CLASS.equals(service.getClass().getName())) {
            return;
        }
        serviceRunning = false;
        if (!expectedStop) {
            Log.i(TAG, "RNBackgroundActionsTask destroyed unexpectedly; scheduling JS recovery");
            pendingResetEmit = true;
            if (appForeground) {
                MAIN_HANDLER.postDelayed(TrackingPersistenceHelper::flushPendingReset, RESUME_RECOVERY_DELAY_MS);
            }
        }
    }

    private static void onAppResumed(Context context) {
        if (pendingResetEmit) {
            MAIN_HANDLER.postDelayed(TrackingPersistenceHelper::flushPendingReset, RESUME_RECOVERY_DELAY_MS);
            return;
        }
        if (serviceRunning && !isTrackingNotificationActive(context)) {
            repostNotification(context);
        }
    }

    private static void flushPendingReset() {
        if (!pendingResetEmit || !appForeground || serviceRunning) {
            return;
        }
        pendingResetEmit = false;
        emitServiceStoppedEvent(lastReactContext, lastTaskName);
    }

    private static boolean isTrackingNotificationActive(Context context) {
        if (Build.VERSION.SDK_INT < 23 || context == null) {
            return true;
        }
        try {
            NotificationManager nm = (NotificationManager) safeAppContext(context).getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm == null) return true;
            StatusBarNotification[] active = nm.getActiveNotifications();
            if (active == null) return true;
            for (StatusBarNotification sbn : active) {
                if (sbn != null && sbn.getId() == NOTIFICATION_ID) {
                    return true;
                }
            }
            return false;
        } catch (Throwable t) {
            return true;
        }
    }

    private static void repostNotification(Context context) {
        Context ctx = safeAppContext(context);
        if (ctx == null) return;
        try {
            if (TrackingControlHelper.hasLastNotification()) {
                TrackingControlHelper.refreshNotification(ctx);
                return;
            }
            if (lastBuiltNotification != null) {
                NotificationManager nm = (NotificationManager) ctx.getSystemService(Context.NOTIFICATION_SERVICE);
                if (nm != null) {
                    nm.notify(NOTIFICATION_ID, attachDeleteIntent(ctx, lastBuiltNotification));
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to repost notification", t);
        }
    }

    private static void emitServiceStoppedEvent(Object reactContextObj, String taskName) {
        if (reactContextObj == null) {
            Log.w(TAG, "Cannot emit recovery event: no ReactContext");
            return;
        }
        try {
            Class<?> rcClass = reactContextObj.getClass();
            ClassLoader cl = rcClass.getClassLoader();

            Class<?> argsClass = Class.forName("com.facebook.react.bridge.Arguments", false, cl);
            Object map = argsClass.getMethod("createMap").invoke(null);
            Method putString = map.getClass().getMethod("putString", String.class, String.class);
            putString.invoke(map, "taskName", taskName != null ? taskName : "LocationTracking");
            putString.invoke(map, "reason", "ServiceDestroyed");
            putString.invoke(map, "message", "Background service stopped unexpectedly");

            try {
                Method emitEventMethod = rcClass.getMethod("emitDeviceEvent", String.class, Object.class);
                emitEventMethod.invoke(reactContextObj, "foregroundStartRejected", map);
            } catch (NoSuchMethodException ignored) {
                boolean hasInstance = (Boolean) rcClass.getMethod("hasActiveReactInstance").invoke(reactContextObj);
                if (!hasInstance) {
                    return;
                }
                Class<?> emitterClass = Class.forName("com.facebook.react.modules.core.DeviceEventManagerModule$RCTDeviceEventEmitter", false, cl);
                Object emitter = rcClass.getMethod("getJSModule", Class.class).invoke(reactContextObj, emitterClass);
                emitterClass.getMethod("emit", String.class, Object.class)
                        .invoke(emitter, "foregroundStartRejected", map);
            }
            Log.i(TAG, "Emitted foregroundStartRejected recovery event for " + taskName);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to emit recovery event", t);
        }
    }
}
