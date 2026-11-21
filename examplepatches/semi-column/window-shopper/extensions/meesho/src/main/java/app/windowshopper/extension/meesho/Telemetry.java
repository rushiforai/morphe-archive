package app.windowshopper.extension.meesho;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import okhttp3.Call;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

public final class Telemetry {
    private Telemetry() {}

    static boolean blocked(String host) {
        return host.matches("events[0-9]*\\.meeshoapi\\.com|events\\.otpless\\.tech|(debug\\.)?logs\\.juspay\\.(in|io|net)");
    }

    /** Answers telemetry calls locally so nothing leaves the device; null lets the call proceed. */
    public static Response intercept(Call call) {
        Request request = call.request();
        if (!blocked(request.url().host()) || !Settings.enabled(Settings.Feature.TELEMETRY)) return null;
        return new Response.Builder().request(request).protocol(Protocol.HTTP_1_1).code(200).message("OK")
            .body(ResponseBody.create(MediaType.get("application/json"), "{}")).build();
    }

    public static boolean skipWorker() { return Settings.enabled(Settings.Feature.TELEMETRY); }

    // Uses the SDKs' own opt-out switches; turning the setting off restores them once.
    static void configureSdks(Context context, SharedPreferences prefs) {
        boolean block = Settings.enabled(Settings.Feature.TELEMETRY);
        if (!block && !prefs.getBoolean("TELEMETRY_APPLIED", false)) return;
        call(() -> {
            Object appsFlyer = Class.forName("com.appsflyer.AppsFlyerLib").getMethod("getInstance").invoke(null);
            appsFlyer.getClass().getMethod("stop", boolean.class, Context.class).invoke(appsFlyer, block, context);
        });
        // Facebook ignores these until its SDK finishes initializing in Application.onCreate.
        new Handler(Looper.getMainLooper()).post(() -> {
            call(() -> {
                Class<?> facebook = Class.forName("com.facebook.FacebookSdk");
                facebook.getMethod("setAutoLogAppEventsEnabled", boolean.class).invoke(null, !block);
                facebook.getMethod("setAdvertiserIDCollectionEnabled", boolean.class).invoke(null, !block);
            });
            call(() -> {
                Class<?> firebase = Class.forName("com.google.firebase.analytics.FirebaseAnalytics");
                Object analytics = firebase.getMethod("getInstance", Context.class).invoke(null, context);
                firebase.getMethod("setAnalyticsCollectionEnabled", boolean.class).invoke(analytics, !block);
            });
            prefs.edit().putBoolean("TELEMETRY_APPLIED", block).apply();
        });
    }

    private interface Step { void run() throws ReflectiveOperationException; }

    private static void call(Step step) {
        try {
            step.run();
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.e("WindowShopper", "Telemetry switch unavailable", error);
        }
    }
}
