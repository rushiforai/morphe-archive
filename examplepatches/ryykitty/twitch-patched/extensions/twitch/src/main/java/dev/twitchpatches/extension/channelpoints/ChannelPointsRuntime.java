package dev.twitchpatches.extension.channelpoints;

import android.app.Activity;
import android.app.Application;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.SystemClock;
import dev.twitchpatches.extension.settings.PatchSettings;

public final class ChannelPointsRuntime implements Application.ActivityLifecycleCallbacks {
    private static volatile ChannelPointsRuntime instance;
    private final SharedPreferences preferences;
    private final PlaybackClaims claims = new PlaybackClaims();
    private volatile boolean enabled;
    private volatile int startedActivities;
    private long lastOfferLog;
    private long lastObservationLog;

    public static void observation(String category) {
        ChannelPointsRuntime runtime = instance;
        if (runtime == null) return;
        synchronized (runtime) {
            long now = SystemClock.elapsedRealtime();
            if (now - runtime.lastObservationLog < 5000) return;
            android.util.Log.i("TwitchPatchesPoints", category);
            runtime.lastObservationLog = now;
        }
    }

    private ChannelPointsRuntime(Application application) {
        preferences = application.getSharedPreferences("twitch_patches_channel_points", 0);
        enabled = preferences.getBoolean("auto_claim", true);
        application.registerActivityLifecycleCallbacks(this);
    }

    public static synchronized void initialize(Application application) {
        if (instance == null) {
            instance = new ChannelPointsRuntime(application);
            dev.twitchpatches.extension.shared.ReactNativeRuntime.select(0);
            PatchSettings.register(new ChannelPointsSetting());
        }
    }

    public static void configure(Object player, Object channel, boolean live) {
        ChannelPointsRuntime runtime = instance;
        if (runtime != null) runtime.claims.configure(player, channel, live);
    }

    public static void state(Object player, boolean playing) {
        ChannelPointsRuntime runtime = instance;
        if (runtime != null) runtime.claims.state(player, playing);
    }

    public static void release(Object player) {
        ChannelPointsRuntime runtime = instance;
        if (runtime != null) runtime.claims.release(player);
    }

    public static boolean offer(Object channel, String claim) {
        ChannelPointsRuntime runtime = instance;
        if (runtime == null) return false;
        boolean permitted = runtime.enabled && runtime.startedActivities > 0;
        boolean accepted = runtime.claims.offer(channel, claim, SystemClock.elapsedRealtime(), permitted);
        runtime.logOffer(accepted ? "claim attempt reserved" : !runtime.enabled ? "setting disabled" :
                runtime.startedActivities == 0 ? "no foreground activity" : runtime.claims.readiness(channel));
        return accepted;
    }

    private synchronized void logOffer(String category) {
        long now = SystemClock.elapsedRealtime();
        if (now - lastOfferLog < 5000) return;
        android.util.Log.i("TwitchPatchesPoints", category);
        lastOfferLog = now;
    }

    public static boolean isEnabled() {
        ChannelPointsRuntime runtime = instance;
        return runtime != null && runtime.enabled;
    }

    public static void setEnabled(boolean checked) {
        ChannelPointsRuntime runtime = instance;
        if (runtime == null) return;
        runtime.enabled = checked;
        runtime.preferences.edit().putBoolean("auto_claim", checked).apply();
        dev.twitchpatches.extension.shared.ReactNativeRuntime.refresh();
    }

    @Override public void onActivityStarted(Activity activity) { startedActivities++; }
    @Override public void onActivityStopped(Activity activity) { startedActivities = Math.max(0, startedActivities - 1); }
    @Override public void onActivityCreated(Activity activity, Bundle state) { }
    @Override public void onActivityResumed(Activity activity) { }
    @Override public void onActivityPaused(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
    @Override public void onActivityDestroyed(Activity activity) { }
}
