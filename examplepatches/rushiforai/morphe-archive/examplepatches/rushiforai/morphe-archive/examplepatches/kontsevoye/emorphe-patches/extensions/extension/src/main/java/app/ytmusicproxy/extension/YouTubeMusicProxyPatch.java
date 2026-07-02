package app.ytmusicproxy.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.io.IOException;
import java.net.Proxy;
import java.net.SocketAddress;
import java.net.URI;
import org.chromium.net.CronetEngine;

@SuppressWarnings("unused")
public final class YouTubeMusicProxyPatch {
    private static final String TAG = "YTMProxyPatch";
    private static volatile boolean traceInstalled;
    private static volatile boolean settingsListenerRegistered;
    private static volatile SharedPreferences.OnSharedPreferenceChangeListener settingsListener;

    private YouTubeMusicProxyPatch() {
    }

    public static void initialize(Context context) {
        try {
            Context appContext = context.getApplicationContext();
            installTrace();
            ProxySettingsStore.ensureDefaults(appContext);
            registerSettingsListener(appContext);
            reloadFromSettings(appContext);
        } catch (Exception ex) {
            Log.w(TAG, "Proxy setup failed", ex);
        }
    }

    public static void reloadFromSettings(Context context) {
        ProxyConfig config = ProxySettingsStore.read(context);
        if (!config.isInstallable()) {
            ProxyInstaller.reset();
            Log.i(TAG, "Proxy setup disabled or invalid " + ProxyInstaller.describeState());
            return;
        }

        boolean applied = ProxyInstaller.apply(config);
        Log.i(
                TAG,
                "Proxy setup " + (applied ? "applied" : "skipped")
                        + " host=" + config.getHost()
                        + " port=" + config.getPort()
                        + " auth=" + hasProxyAuth(config.getUsername(), config.getPassword())
                        + " " + ProxyInstaller.describeState()
        );
    }

    private static void installTrace() {
        if (traceInstalled) {
            return;
        }

        ProxyInstaller.setTrace(new ProxyInstaller.Trace() {
            @Override
            public void onSelect(URI uri, Proxy proxy) {
                Log.i(TAG, "ProxySelector.select " + describeUri(uri) + " -> " + proxy);
            }

            @Override
            public void onConnectFailed(URI uri, SocketAddress socketAddress, IOException exception) {
                Log.w(TAG, "Proxy connect failed for " + describeUri(uri) + " via " + socketAddress, exception);
            }
        });
        traceInstalled = true;
    }

    private static void registerSettingsListener(Context appContext) {
        if (settingsListenerRegistered) {
            return;
        }

        settingsListener = new SharedPreferences.OnSharedPreferenceChangeListener() {
            @Override
            public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
                if (ProxySettingsStore.isProxyKey(key)) {
                    reloadFromSettings(appContext);
                }
            }
        };
        ProxySettingsStore.preferences(appContext).registerOnSharedPreferenceChangeListener(settingsListener);
        settingsListenerRegistered = true;
    }

    public static boolean disableQuic(boolean original) {
        return false;
    }

    public static boolean enableMediaProxyResolver(boolean original) {
        ProxyInstaller.Snapshot snapshot = ProxyInstaller.getSnapshot();
        if (snapshot == null) {
            return original;
        }

        Log.i(TAG, "Media proxy resolver enabled for " + snapshot.getHost() + ":" + snapshot.getPort());
        return true;
    }

    public static void applyCronetProxyOptions(Object builder) {
        ProxyInstaller.Snapshot snapshot = ProxyInstaller.getSnapshot();
        if (snapshot == null) {
            return;
        }

        if (!(builder instanceof CronetEngine.Builder)) {
            Log.i(TAG, "Cronet proxy options skipped for " + describeObject(builder));
            return;
        }

        try {
            ((CronetEngine.Builder) builder).setProxyOptions(CronetProxyOptionsFactory.create(snapshot));
            Log.i(
                    TAG,
                    "Cronet proxy options applied host=" + snapshot.getHost()
                            + " port=" + snapshot.getPort()
                            + " auth=" + snapshot.hasAuthentication()
            );
        } catch (Throwable throwable) {
            Log.w(TAG, "Cronet proxy options failed", throwable);
        }
    }

    private static boolean hasProxyAuth(String username, String password) {
        return !nullToEmpty(username).isEmpty() || !nullToEmpty(password).isEmpty();
    }

    private static String describeUri(URI uri) {
        if (uri == null) {
            return "null";
        }

        return nullToEmpty(uri.getScheme()) + "://" + nullToEmpty(uri.getHost()) + ":" + uri.getPort();
    }

    private static String nullToEmpty(String value) {
        return value == null ? "" : value;
    }

    private static String describeObject(Object value) {
        return value == null ? "null" : value.getClass().getName();
    }
}
