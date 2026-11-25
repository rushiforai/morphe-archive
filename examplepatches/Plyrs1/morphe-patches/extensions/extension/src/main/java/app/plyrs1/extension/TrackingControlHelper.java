package app.plyrs1.extension;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.util.Log;

import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public final class TrackingControlHelper {
    private static final String TAG = "TrackingControl";
    private static final int NOTIFICATION_ID = 92901;
    private static final String ACTION_TOGGLE_PAUSE = "app.plyrs1.gajihub.ACTION_TOGGLE_PAUSE";
    private static final String ACTION_FORCE_SUBMIT = "app.plyrs1.gajihub.ACTION_FORCE_SUBMIT";

    private static final String TARGET_SERVICE_CLASS = "com.asterinet.react.bgactions.RNBackgroundActionsTask";

    private static volatile Context appContext = null;
    private static volatile boolean trackingActive = false;
    private static volatile boolean paused = false;
    private static volatile int pushedCount = 0;
    private static volatile String lastBaseUrl = null;
    private static volatile String lastAuthHeader = null;
    private static volatile Notification lastOriginalNotification = null;
    private static volatile boolean receiverRegistered = false;
    private TrackingControlHelper() {}

    private static Context safeAppContext(Context context) {
        if (context == null) return appContext;
        Context app = context.getApplicationContext();
        return app != null ? app : context;
    }

    public static void setContext(Context context) {
        if (context != null) {
            appContext = safeAppContext(context);
            ensureReceiverRegistered(appContext);
        }
    }

    private static synchronized void ensureReceiverRegistered(Context context) {
        if (receiverRegistered || context == null) {
            return;
        }
        Context ctx = safeAppContext(context);
        BroadcastReceiver receiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context c, Intent intent) {
                if (intent == null || intent.getAction() == null) return;
                if (!trackingActive) {
                    cancelNotification(c);
                    return;
                }
                String action = intent.getAction();
                if (ACTION_TOGGLE_PAUSE.equals(action)) {
                    paused = !paused;
                    refreshNotification(c);
                } else if (ACTION_FORCE_SUBMIT.equals(action)) {
                    forceSubmit(c);
                }
            }
        };
        IntentFilter filter = new IntentFilter();
        filter.addAction(ACTION_TOGGLE_PAUSE);
        filter.addAction(ACTION_FORCE_SUBMIT);
        if (Build.VERSION.SDK_INT >= 33) {
            ctx.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
        } else {
            ctx.registerReceiver(receiver, filter);
        }
        receiverRegistered = true;
    }

    public static Notification decorateNotification(Notification notification) {
        return decorateNotification(appContext, notification);
    }

    public static Notification decorateNotification(Context context, Notification notification) {
        if (context == null || notification == null) {
            return notification;
        }
        appContext = safeAppContext(context);
        ensureReceiverRegistered(appContext);
        trackingActive = true;
        lastOriginalNotification = notification.clone();
        return buildDecoratedNotification(appContext, lastOriginalNotification);
    }

    private static Notification buildDecoratedNotification(Context context, Notification baseNotification) {
        if (Build.VERSION.SDK_INT < 24) {
            return baseNotification;
        }
        try {
            Notification base = baseNotification.clone();
            if (paused && base.extras != null) {
                base.extras.remove(Notification.EXTRA_PROGRESS);
                base.extras.remove(Notification.EXTRA_PROGRESS_MAX);
                base.extras.remove(Notification.EXTRA_PROGRESS_INDETERMINATE);
            }
            Notification.Builder builder = Notification.Builder.recoverBuilder(appContext, base);
            if (paused) {
                builder.setContentTitle("Live tracking is paused (Manual)");
                builder.setContentText("Pushed: " + pushedCount + " — tap Resume or Force Submit");
                builder.setSubText(null);
                builder.setProgress(0, 0, false);
            } else {
                builder.setContentTitle("Live tracking is active");
                builder.setContentText("Pushed: " + pushedCount);
                builder.setSubText(null);
            }

            int flags = PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE;

            Intent toggleIntent = new Intent(ACTION_TOGGLE_PAUSE).setPackage(appContext.getPackageName());
            PendingIntent togglePending = PendingIntent.getBroadcast(appContext, 101, toggleIntent, flags);
            String toggleLabel = paused ? "Resume" : "Pause";
            int toggleIcon = paused ? android.R.drawable.ic_media_play : android.R.drawable.ic_media_pause;
            Notification.Action toggleAction = new Notification.Action.Builder(toggleIcon, toggleLabel, togglePending).build();

            Intent submitIntent = new Intent(ACTION_FORCE_SUBMIT).setPackage(appContext.getPackageName());
            PendingIntent submitPending = PendingIntent.getBroadcast(appContext, 102, submitIntent, flags);
            Notification.Action submitAction = new Notification.Action.Builder(android.R.drawable.ic_menu_mylocation, "Force Submit", submitPending).build();

            builder.setActions(toggleAction, submitAction);
            if (TrackingPersistenceHelper.isActive()) {
                TrackingPersistenceHelper.applyDeleteIntent(appContext, builder);
            }

            return builder.build();
        } catch (Throwable t) {
            Log.e(TAG, "Failed to decorate notification", t);
            return baseNotification;
        }
    }

    public static boolean hasLastNotification() {
        return trackingActive && lastOriginalNotification != null;
    }

    public static void cancelNotification(Context context) {
        Context ctx = safeAppContext(context);
        if (ctx == null) return;
        try {
            NotificationManager nm = (NotificationManager) ctx.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm != null) {
                nm.cancel(NOTIFICATION_ID);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to cancel notification", t);
        }
    }

    public static void onExplicitStop(Context context) {
        trackingActive = false;
        paused = false;
        pushedCount = 0;
        lastOriginalNotification = null;
        cancelNotification(context);
    }

    public static void onServiceDestroyed(Context context) {
        if (context != null && !TARGET_SERVICE_CLASS.equals(context.getClass().getName())) {
            return;
        }
        trackingActive = false;
        lastOriginalNotification = null;
        cancelNotification(context);
    }

    public static void refreshNotification(Context context) {
        Context ctx = safeAppContext(context);
        if (ctx == null) {
            return;
        }
        if (!trackingActive || lastOriginalNotification == null) {
            cancelNotification(ctx);
            return;
        }
        try {
            NotificationManager nm = (NotificationManager) ctx.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm != null) {
                nm.notify(NOTIFICATION_ID, buildDecoratedNotification(ctx, lastOriginalNotification));
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to refresh notification", t);
        }
    }

    public static boolean onSendRequest(
            Object reactContextObj,
            String method,
            String url,
            int requestId,
            Object headersObj
    ) {
        if (reactContextObj instanceof Context) {
            setContext((Context) reactContextObj);
        }
        if (url != null) {
            captureAuthAndBaseUrl(url, headersObj);
        }

        if ("POST".equalsIgnoreCase(method) && isTrackingSubmitUrl(url)) {
            if (paused) {
                emitSyntheticOk(reactContextObj, requestId, url);
                return true;
            } else {
                pushedCount++;
                if (trackingActive && reactContextObj instanceof Context) {
                    refreshNotification((Context) reactContextObj);
                }
            }
        }
        return false;
    }

    private static void captureAuthAndBaseUrl(String url, Object headersObj) {
        if (headersObj != null) {
            try {
                Class<?> raClass = headersObj.getClass();
                Method sizeMethod = raClass.getMethod("size");
                Method getArrayMethod = raClass.getMethod("getArray", int.class);
                Method getStringMethod = raClass.getMethod("getString", int.class);
                int size = (Integer) sizeMethod.invoke(headersObj);
                for (int i = 0; i < size; i++) {
                    Object pair = getArrayMethod.invoke(headersObj, i);
                    if (pair != null) {
                        int pairSize = (Integer) sizeMethod.invoke(pair);
                        if (pairSize >= 2) {
                            String key = (String) getStringMethod.invoke(pair, 0);
                            String val = (String) getStringMethod.invoke(pair, 1);
                            if (key != null && val != null && key.equalsIgnoreCase("Authorization")) {
                                lastAuthHeader = val;
                            }
                        }
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "Failed to read headers", t);
            }
        }
        int idx = url.indexOf("/hr/locationTrackings/employees");
        if (idx > 0) {
            lastBaseUrl = url.substring(0, idx);
        } else if (lastBaseUrl == null) {
            int hrIdx = url.indexOf("/hr/");
            if (hrIdx > 0) {
                lastBaseUrl = url.substring(0, hrIdx);
            }
        }
    }

    private static boolean isTrackingSubmitUrl(String url) {
        if (url == null) return false;
        return url.endsWith("/hr/locationTrackings/employees")
                || url.contains("/hr/locationTrackings/employees?");
    }

    private static void emitSyntheticOk(Object reactContextObj, int requestId, String url) {
        if (reactContextObj == null) {
            return;
        }
        try {
            Class<?> rcClass = reactContextObj.getClass();
            ClassLoader cl = rcClass.getClassLoader();

            Method emitEventMethod;
            Object emitTarget;
            try {
                emitEventMethod = rcClass.getMethod("emitDeviceEvent", String.class, Object.class);
                emitTarget = reactContextObj;
            } catch (NoSuchMethodException ignored) {
                boolean hasInstance = (Boolean) rcClass.getMethod("hasActiveReactInstance").invoke(reactContextObj);
                if (!hasInstance) {
                    return;
                }
                Class<?> emitterClass = Class.forName("com.facebook.react.modules.core.DeviceEventManagerModule$RCTDeviceEventEmitter", false, cl);
                emitTarget = rcClass.getMethod("getJSModule", Class.class).invoke(reactContextObj, emitterClass);
                emitEventMethod = emitterClass.getMethod("emit", String.class, Object.class);
            }

            Class<?> argsClass = Class.forName("com.facebook.react.bridge.Arguments", false, cl);
            Method createMapMethod = argsClass.getMethod("createMap");
            Method createArrayMethod = argsClass.getMethod("createArray");

            Object headersMap = createMapMethod.invoke(null);
            headersMap.getClass().getMethod("putString", String.class, String.class)
                    .invoke(headersMap, "content-type", "application/json");

            Object respArgs = createArrayMethod.invoke(null);
            Class<?> waClass = respArgs.getClass();
            Method pushInt = waClass.getMethod("pushInt", int.class);
            Method pushString = waClass.getMethod("pushString", String.class);
            Method pushMap = waClass.getMethod("pushMap", Class.forName("com.facebook.react.bridge.ReadableMap", false, cl));
            Method pushNull = waClass.getMethod("pushNull");

            pushInt.invoke(respArgs, requestId);
            pushInt.invoke(respArgs, 200);
            pushMap.invoke(respArgs, headersMap);
            pushString.invoke(respArgs, url != null ? url : "");
            emitEventMethod.invoke(emitTarget, "didReceiveNetworkResponse", respArgs);

            Object dataArgs = createArrayMethod.invoke(null);
            pushInt.invoke(dataArgs, requestId);
            pushString.invoke(dataArgs, "{}");
            emitEventMethod.invoke(emitTarget, "didReceiveNetworkData", dataArgs);

            Object completeArgs = createArrayMethod.invoke(null);
            pushInt.invoke(completeArgs, requestId);
            pushNull.invoke(completeArgs);
            emitEventMethod.invoke(emitTarget, "didCompleteNetworkResponse", completeArgs);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to emit synthetic response", t);
        }
    }

    public static void forceSubmit(final Context context) {
        final Context ctx = safeAppContext(context);
        if (!trackingActive) {
            cancelNotification(ctx);
            return;
        }
        if (ctx == null || lastBaseUrl == null || lastAuthHeader == null) {
            Log.w(TAG, "Cannot force submit: missing context/baseUrl/authHeader");
            return;
        }
        new Thread(() -> {
            HttpURLConnection conn = null;
            try {
                Location loc = getBestLastKnownLocation(ctx);
                if (loc == null) {
                    Log.w(TAG, "Cannot force submit: no last known location");
                    return;
                }
                URL url = new URL(lastBaseUrl + "/hr/locationTrackings/employees");
                conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", "application/json");
                conn.setRequestProperty("Authorization", lastAuthHeader);
                conn.setDoOutput(true);
                conn.setConnectTimeout(10000);
                conn.setReadTimeout(10000);

                String body = "{\"latitude\":" + loc.getLatitude() + ",\"longitude\":" + loc.getLongitude() + "}";
                byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
                try (OutputStream os = conn.getOutputStream()) {
                    os.write(bytes);
                }

                int code = conn.getResponseCode();
                if (code >= 200 && code < 300) {
                    pushedCount++;
                    refreshNotification(ctx);
                } else {
                    Log.w(TAG, "Force submit returned HTTP " + code);
                }
            } catch (Throwable t) {
                Log.e(TAG, "Force submit failed", t);
            } finally {
                if (conn != null) {
                    conn.disconnect();
                }
            }
        }, "TrackingForceSubmit").start();
    }

    private static Location getBestLastKnownLocation(Context context) {
        try {
            LocationManager lm = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE);
            if (lm == null) return null;
            Location gps = null;
            Location net = null;
            try {
                gps = lm.getLastKnownLocation(LocationManager.GPS_PROVIDER);
            } catch (SecurityException ignored) {}
            try {
                net = lm.getLastKnownLocation(LocationManager.NETWORK_PROVIDER);
            } catch (SecurityException ignored) {}
            if (gps != null && net != null) {
                return gps.getTime() >= net.getTime() ? gps : net;
            }
            return gps != null ? gps : net;
        } catch (Throwable t) {
            return null;
        }
    }
}
