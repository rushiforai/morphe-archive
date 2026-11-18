package app.wazeytm.extension.waze;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Messenger;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.waze.sdk.SdkConfiguration;
import java.lang.reflect.Method;
import java.lang.reflect.Field;
import app.wazeytm.extension.waze.settings.MorpheSettings;

/** Register SoundCloud using Waze's own media-browser controller and native player UI. */
public final class SoundCloudSupportPatch {
    private static final String TAG = "WazeSoundCloud";
    private static final String SERVICE = "com.soundcloud.android.playback.players.MediaService";
    private static final int AUDIO_SCOPE = 0x200000;
    private static Request pending;
    private static Request active;
    private static Object activeAdapter;
    private static final ThreadLocal<String> browsePackage = new ThreadLocal<>();

    private static final class Request {
        final String token;
        Request(String token) { this.token = token; }
    }

    private SoundCloudSupportPatch() { }

    private static String getConfiguredPackageName() {
        return "com.soundcloud.android";
    }

    private static boolean enabled() {
        return MorpheSettings.isEnabled(MorpheSettings.Feature.SOUNDCLOUD);
    }

    private static boolean installed(Context context) {
        if (context == null) return false;
        try {
            ServiceInfo service = context.getPackageManager().getServiceInfo(
                    new ComponentName(getConfiguredPackageName(), SERVICE), 0);
            return service.enabled && service.exported && service.applicationInfo.enabled;
        } catch (Exception ignored) {
            return false;
        }
    }

    public static void onSdkConfigurationLoaded(SdkConfiguration config) {
        if (!enabled()) return;
        Context context = MorpheSettings.getContext();
        if (!installed(context)) return;
        try {
            CharSequence label = context.getPackageManager().getApplicationLabel(
                    context.getPackageManager().getApplicationInfo(getConfiguredPackageName(), 0));
            if (AudioPartnerConfig.add(config, getConfiguredPackageName(), label.toString(), AUDIO_SCOPE)) {
                Log.i(TAG, "Added native audio partner " + getConfiguredPackageName());
            }
        } catch (Exception exception) {
            Log.e(TAG, "Cannot add SoundCloud audio partner", exception);
        }
    }

    /** -1 means leave the original Waze path in charge. */
    public static int availability(Intent intent) {
        String packageName = intent == null ? null : intent.getPackage();
        if (!getConfiguredPackageName().equals(packageName) || !enabled()) return -1;
        return installed(MorpheSettings.getContext()) ? 1 : 0;
    }

    /** Keep Waze's ordinary start path and its timeout; register only after browser readiness. */
    public static synchronized void prepare(String packageName, String token, Runnable failureCallback) {
        if (getConfiguredPackageName().equals(packageName) && enabled()) {
            pending = new Request(token);
            // Without a failure callback Waze will not schedule a watchdog. Reuse an
            // already connected adapter immediately; new adapters finish in onConnected.
            if (failureCallback == null) finishStart();
        } else {
            pending = null;
        }
    }

    public static synchronized void finishStart() {
        if (pending == null) return;
        try {
            Class<?> factoryClass = Class.forName(WazeAudioBindings.factoryClass());
            Field instance = WazeFieldAccess.find(factoryClass, factoryClass, true);
            Field cache = WazeFieldAccess.find(factoryClass, java.util.Map.class, false);
            Object adapter = ((java.util.Map<?, ?>) cache.get(instance.get(null))).get(getConfiguredPackageName());
            registerIfReady(adapter);
        } catch (Exception exception) {
            Log.e(TAG, "Cannot inspect SoundCloud browser readiness", exception);
        }
    }

    public static void onBrowserConnected(Object callback) {
        try {
            Object adapter = adapter(callback);
            browsePackage.set((String) adapterField(adapter, String.class));
            // Run after Waze initializes its transport controls. Capture this at entry:
            // Waze's optimized DEX reuses its parameter register later in the callback.
            new Handler(Looper.getMainLooper()).post(() -> {
                synchronized (SoundCloudSupportPatch.class) {
                    try {
                        registerIfReady(adapter);
                    } catch (Exception exception) {
                        Log.e(TAG, "Cannot register connected SoundCloud browser", exception);
                    }
                }
            });
        } catch (Exception exception) {
            browsePackage.remove();
            Log.e(TAG, "Cannot finish SoundCloud browser connection", exception);
        }
    }

    public static String browseRoot(String original) {
        return enabled() && getConfiguredPackageName().equals(browsePackage.get()) ? "stream" : original;
    }

    private static Object adapter(Object callback) throws Exception {
        Field field = WazeFieldAccess.find(callback.getClass(), Class.forName(WazeAudioBindings.adapterClass()), false);
        return field.get(callback);
    }

    private static Object adapterField(Object adapter, Class<?> type) throws Exception {
        Field field = WazeFieldAccess.find(Class.forName(WazeAudioBindings.adapterClass()), type, false);
        return field.get(adapter);
    }

    private static Object manager() throws Exception {
        Method instance = Class.forName(WazeAudioBindings.managerClass()).getDeclaredMethod(WazeAudioBindings.managerInstanceMethod());
        instance.setAccessible(true);
        return instance.invoke(null);
    }

    private static void registerIfReady(Object adapter) throws Exception {
        if (pending == null || adapter == null || !enabled()
                || !getConfiguredPackageName().equals(adapterField(adapter, String.class))
                || adapterField(adapter, Class.forName(WazeAudioBindings.transportClass())) == null) return;
        Context context = MorpheSettings.getContext();
        if (!installed(context)) return;
        Request request = pending;
        pending = null;
        Bundle options = new Bundle();
        Intent launch = context.getPackageManager().getLaunchIntentForPackage(getConfiguredPackageName());
        if (launch != null) {
            options.putParcelable("openMeIntent", PendingIntent.getActivity(context, 0, launch,
                    PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE));
        }
        options.putInt("versionCode", 1);
        Class<?> managerClass = Class.forName(WazeAudioBindings.managerClass());
        Method register = managerClass.getDeclaredMethod(WazeAudioBindings.registerMethod(), Resources.class,
                String.class, String.class, Bundle.class, Messenger.class);
        register.setAccessible(true);
        boolean registered = (Boolean) register.invoke(manager(), context.getResources(),
                getConfiguredPackageName(), request.token, options, null);
        if (registered) {
            active = request;
            activeAdapter = adapter;
        }
        Log.i(TAG, "Native SoundCloud session registration: " + registered);
    }

    public static void onBrowserLost(Object callback) {
        try {
            Object adapter = adapter(callback);
            new Handler(Looper.getMainLooper()).post(() -> cleanUpLostBrowser(adapter));
        } catch (Exception exception) {
            Log.e(TAG, "Cannot identify lost SoundCloud browser", exception);
        }
    }

    private static synchronized void cleanUpLostBrowser(Object adapter) {
        try {
            if (!getConfiguredPackageName().equals(adapterField(adapter, String.class))) return;
            // Initial failures keep Waze's watchdog, which disconnects its cached adapter
            // and invokes its failure UI. An established session has no watchdog left.
            if (activeAdapter != adapter || active == null) return;
            active = null;
            activeAdapter = null;
            Method disconnect = Class.forName(WazeAudioBindings.adapterClass()).getDeclaredMethod(WazeAudioBindings.disconnectMethod());
            disconnect.setAccessible(true);
            disconnect.invoke(adapter);
            Method unbind = Class.forName(WazeAudioBindings.managerClass()).getDeclaredMethod(
                    WazeAudioBindings.packageChangedMethod(), String.class, boolean.class);
            unbind.setAccessible(true);
            unbind.invoke(manager(), getConfiguredPackageName(), false);
            Log.i(TAG, "Disconnected lost SoundCloud browser session");
        } catch (Exception exception) {
            Log.e(TAG, "Cannot clean up SoundCloud browser session", exception);
        }
    }
}
