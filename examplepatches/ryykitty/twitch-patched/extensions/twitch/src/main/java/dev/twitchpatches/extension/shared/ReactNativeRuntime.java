package dev.twitchpatches.extension.shared;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Looper;
import android.util.Log;
import java.io.InputStream;
import java.io.ByteArrayOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.WeakHashMap;
import dev.twitchpatches.extension.channelpoints.ChannelPointsRuntime;
import dev.twitchpatches.extension.promotions.PromotionSettings;
import dev.twitchpatches.extension.promotions.SubscriptionBannerSettings;
import dev.twitchpatches.extension.ads.AdSettings;
import dev.twitchpatches.extension.emotes.EmoteRuntime;
import dev.twitchpatches.extension.reload.ReloadRuntime;

public final class ReactNativeRuntime implements Application.ActivityLifecycleCallbacks {
    private static final WeakHashMap<Object, Boolean> instances = new WeakHashMap<>();
    private static final boolean[] selected = new boolean[7];
    private static boolean initialized;
    private static int resumed;
    private static volatile CompletableFuture<String> bootstrap;

    public static synchronized void initialize(Application application) {
        if (initialized) return;
        initialized = true;
        TwitchTheme.initialize(application);
        application.registerActivityLifecycleCallbacks(new ReactNativeRuntime());
        ExecutorService worker = Executors.newSingleThreadExecutor(task -> new Thread(task, "TwitchPatchAssets"));
        bootstrap = new CompletableFuture<>();
        worker.execute(() -> {
            try (InputStream input = application.getAssets().open("twitchpatches-runtime.js")) {
                ByteArrayOutputStream data = new ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                int count;
                while ((count = input.read(buffer)) != -1) {
                    if (data.size() + count > 65536) throw new java.io.IOException("Patch bootstrap exceeds bounds.");
                    data.write(buffer, 0, count);
                }
                Path file = Files.createTempFile(application.getCodeCacheDir().toPath(), "twitch-patch-", ".js");
                Files.write(file, data.toByteArray());
                bootstrap.complete(file.toString());
            } catch (java.io.IOException error) {
                bootstrap.completeExceptionally(error);
            } finally { worker.shutdown(); }
        });
    }

    public static synchronized void select(int feature) {
        if (feature < 0 || feature >= selected.length) throw new IllegalArgumentException("Unknown RN feature.");
        selected[feature] = true;
    }

    public static synchronized void attach(Object instance) {
        if (!Boolean.TRUE.equals(instances.get(instance))) return;
        dispatch(instance, policy());
    }

    public static synchronized void preloaded(Object instance) {
        if (instances.size() >= 8) instances.clear();
        instances.put(instance, Boolean.TRUE);
    }

    public static String bootstrapPath() {
        CompletableFuture<String> task = bootstrap;
        if (task == null) { Log.w("TwitchPatchesRN", "Bootstrap initialization unavailable"); return null; }
        try {
            if (Looper.myLooper() == Looper.getMainLooper() && !task.isDone()) {
                Log.w("TwitchPatchesRN", "Bootstrap not ready for UI loader"); return null;
            }
            return task.get(2, TimeUnit.SECONDS);
        } catch (InterruptedException error) {
            Thread.currentThread().interrupt();
            Log.w("TwitchPatchesRN", "Bootstrap preparation interrupted");
        } catch (ExecutionException | TimeoutException error) {
            Log.w("TwitchPatchesRN", "Bootstrap preparation failed");
        }
        return null;
    }

    public static synchronized void detach(Object instance) { instances.remove(instance); }

    public static synchronized void refresh() {
        boolean[] policy = policy();
        for (Object instance : instances.keySet()) dispatch(instance, policy);
    }

    public static boolean lightTheme() { return TwitchTheme.light(); }

    private static boolean[] policy() {
        return new boolean[] {selected[0] && ChannelPointsRuntime.isEnabled(),
                selected[1] && PromotionSettings.blocked(), selected[2] && SubscriptionBannerSettings.blocked(),
                resumed > 0, selected[3] && AdSettings.displayAdsBlocked(), selected[4] && EmoteRuntime.enabled(),
                selected[5] && AdSettings.enabled(2), selected[6] && ReloadRuntime.enabled(),
                selected[4] && EmoteRuntime.providerEnabled(0), selected[4] && EmoteRuntime.providerEnabled(1),
                selected[4] && EmoteRuntime.providerEnabled(2), TwitchTheme.light()};
    }

    private static void dispatch(Object instance, boolean[] policy) {
        throw new IllegalStateException("React Native policy bridge was not generated.");
    }

    @Override public void onActivityResumed(Activity activity) { synchronized (ReactNativeRuntime.class) { resumed++; refresh(); } }
    @Override public void onActivityPaused(Activity activity) { synchronized (ReactNativeRuntime.class) { resumed = Math.max(0, resumed - 1); refresh(); } }
    @Override public void onActivityCreated(Activity activity, Bundle state) { }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
    @Override public void onActivityDestroyed(Activity activity) { }
}
