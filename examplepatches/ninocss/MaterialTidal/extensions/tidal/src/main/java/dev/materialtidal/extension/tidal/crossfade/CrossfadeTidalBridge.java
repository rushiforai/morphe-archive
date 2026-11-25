package dev.materialtidal.extension.tidal.crossfade;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.util.List;

/**
 * Runtime & Dalvik bridge connecting TIDAL's Settings, ExoPlayer Crossfade engine, Play Queue,
 * and Now Playing Context Menu to our extension UI & audio shaping helpers.
 *
 * <p>All {@code native*} method bodies are replaced at patch time with fingerprinted Dalvik
 * bytecode by {@code CrossfadePlaybackPatch}.
 */
@SuppressWarnings("unused")
public final class CrossfadeTidalBridge {

    private static final String TAG = "MaterialTidalCrossfade";
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static volatile WeakReference<Application> appRef = new WeakReference<>(null);
    private static volatile WeakReference<Activity> currentActivityRef = new WeakReference<>(null);
    private static volatile boolean lifecycleRegistered;

    private static volatile Object crossfadePreferenceRef;
    private static volatile Object playbackEngineRef;
    private static volatile Object nativeSliderSettingsItemRef;
    private static volatile CrossfadeSettingsItemAdapter styleSettingsItemRef;
    private static volatile Object settingsRefreshSubject;

    private static volatile int fallbackDurationSeconds = clampDuration(CrossfadeConfig.getDefaultDurationSeconds());

    private static volatile int cachedWavesIconRes;
    private static volatile int cachedCyanColorRes;
    private static volatile int cachedDefaultMenuColorRes;

    private CrossfadeTidalBridge() {
    }

    public static void initApplication(Application app) {
        if (app == null) {
            return;
        }
        appRef = new WeakReference<>(app);
        CrossfadePrefs.init(app);

        synchronized (CrossfadeTidalBridge.class) {
            if (!lifecycleRegistered) {
                lifecycleRegistered = true;
                app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                    @Override
                    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                        currentActivityRef = new WeakReference<>(activity);
                    }

                    @Override
                    public void onActivityStarted(Activity activity) {
                        currentActivityRef = new WeakReference<>(activity);
                    }

                    @Override
                    public void onActivityResumed(Activity activity) {
                        currentActivityRef = new WeakReference<>(activity);
                    }

                    @Override
                    public void onActivityPaused(Activity activity) {
                    }

                    @Override
                    public void onActivityStopped(Activity activity) {
                    }

                    @Override
                    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                    }

                    @Override
                    public void onActivityDestroyed(Activity activity) {
                        Activity current = currentActivityRef.get();
                        if (current == activity) {
                            currentActivityRef = new WeakReference<>(null);
                        }
                    }
                });
            }
        }
    }

    public static Application getAppContext() {
        return appRef.get();
    }

    public static Activity getCurrentActivity() {
        return currentActivityRef.get();
    }

    public static void registerCrossfadePreference(Object pref) {
        if (pref != null) {
            crossfadePreferenceRef = pref;
        }
    }

    public static void registerPlaybackEngine(Object engine) {
        if (engine != null) {
            playbackEngineRef = engine;
        }
    }

    public static int readDurationSeconds() {
        Object pref = crossfadePreferenceRef;
        if (pref != null) {
            try {
                int sec = clampDuration(nativeReadDurationSeconds(pref));
                fallbackDurationSeconds = sec;
                return sec;
            } catch (Throwable t) {
                Log.w(TAG, "Failed reading crossfade_duration via CrossfadePreference", t);
            }
        }
        return fallbackDurationSeconds;
    }

    public static void writeDurationSeconds(int seconds) {
        int clamped = clampDuration(seconds);
        fallbackDurationSeconds = clamped;

        Object pref = crossfadePreferenceRef;
        if (pref != null) {
            try {
                nativeWriteDurationSeconds(pref, clamped);
            } catch (Throwable t) {
                Log.w(TAG, "Failed writing crossfade_duration via CrossfadePreference", t);
            }
        } else {
            Object engine = playbackEngineRef;
            if (engine != null) {
                try {
                    nativeSetEngineCrossfadeDurationMs(engine, clamped * 1000L);
                } catch (Throwable t) {
                    Log.w(TAG, "Failed pushing fallback crossfade duration to engine", t);
                }
            }
        }
        notifyAllSettingsItemsChanged();
    }

    public static void retriggerPlaybackCrossfade() {
        Object engine = playbackEngineRef;
        if (engine == null) {
            return;
        }
        int sec = readDurationSeconds();
        if (sec <= 0) {
            return;
        }
        try {
            nativeSetEngineCrossfadeDurationMs(engine, 0L);
            nativeSetEngineCrossfadeDurationMs(engine, sec * 1000L);
        } catch (Throwable t) {
            Log.w(TAG, "Failed retriggering playback crossfade state", t);
        }
    }

    public static void onAudioPlaybackSettingsBuilt(List<Object> items, Object nativeSliderItem) {
        if (items == null) {
            return;
        }
        if (nativeSliderItem != null) {
            nativeSliderSettingsItemRef = nativeSliderItem;
        }
        Application app = appRef.get();
        if (app != null) {
            CrossfadePrefs.ensureInitialized(app);
        }
        CrossfadeSettingsItemAdapter adapter = styleSettingsItemRef;
        if (adapter == null) {
            adapter = new CrossfadeSettingsItemAdapter();
            styleSettingsItemRef = adapter;
        } else {
            adapter.refreshImpl();
        }
        if (!items.contains(adapter)) {
            items.add(adapter);
        }
    }

    public static Object mergeSettingsRefreshObservable(Object originalObservable) {
        Object subject = ensureSettingsRefreshSubject();
        if (subject == null) {
            return originalObservable;
        }
        if (originalObservable == null) {
            return subject;
        }
        try {
            Object merged = nativeMergeObservables(originalObservable, subject);
            return merged != null ? merged : originalObservable;
        } catch (Throwable t) {
            Log.w(TAG, "Failed merging settings refresh observable", t);
            return originalObservable;
        }
    }

    public static void notifySettingsStyleItemChanged() {
        Object subject = settingsRefreshSubject;
        CrossfadeSettingsItemAdapter styleItem = styleSettingsItemRef;
        if (subject == null || styleItem == null) {
            return;
        }
        publishRefreshForItem(subject, styleItem);
    }

    public static void notifyAllSettingsItemsChanged() {
        Object subject = settingsRefreshSubject;
        if (subject == null) {
            return;
        }
        Object sliderItem = nativeSliderSettingsItemRef;
        if (sliderItem != null) {
            publishRefreshForItem(subject, sliderItem);
        }
        CrossfadeSettingsItemAdapter styleItem = styleSettingsItemRef;
        if (styleItem != null) {
            publishRefreshForItem(subject, styleItem);
        }
    }

    private static void publishRefreshForItem(Object subject, Object item) {
        try {
            Object event = nativeCreateSettingsRefreshEvent(item);
            if (event != null) {
                synchronized (CrossfadeTidalBridge.class) {
                    nativePublishNext(subject, event);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed publishing settings refresh event", t);
        }
    }

    private static Object ensureSettingsRefreshSubject() {
        Object subject = settingsRefreshSubject;
        if (subject == null) {
            synchronized (CrossfadeTidalBridge.class) {
                subject = settingsRefreshSubject;
                if (subject == null) {
                    try {
                        subject = nativeCreatePublishSubject();
                        settingsRefreshSubject = subject;
                    } catch (Throwable t) {
                        Log.w(TAG, "Failed creating PublishSubject", t);
                    }
                }
            }
        }
        return subject;
    }

    public static void onNextQueueEvaluated(Object localPlayQueue) {
        if (localPlayQueue == null) {
            CrossfadeEngine.setSameAlbumNextTrackId(null);
            return;
        }
        try {
            String nextId = nativeFindConsecutiveSameAlbumNextTrackId(localPlayQueue);
            CrossfadeEngine.setSameAlbumNextTrackId(nextId);
        } catch (Throwable t) {
            Log.w(TAG, "Failed evaluating next play queue item for gapless album check", t);
            CrossfadeEngine.setSameAlbumNextTrackId(null);
        }
    }

    public static void addPlayerContextMenuItem(List<Object> menuItems, Object trackObj) {
        if (menuItems == null || trackObj == null) {
            return;
        }
        Application app = appRef.get();
        if (app != null) {
            CrossfadePrefs.ensureInitialized(app);
        }
        int seconds = readDurationSeconds();
        String title = CrossfadeEngine.getPlayerContextMenuTitle(seconds);
        int iconRes = resolveDrawableId("ic_media_right_waves_regular", cachedWavesIconRes);
        if (iconRes != 0) {
            cachedWavesIconRes = iconRes;
        }
        int colorRes;
        if (seconds > 0) {
            colorRes = resolveColorId("cyan", cachedCyanColorRes);
            if (colorRes != 0) {
                cachedCyanColorRes = colorRes;
            }
        } else {
            colorRes = resolveColorId("context_menu_default_color", cachedDefaultMenuColorRes);
            if (colorRes != 0) {
                cachedDefaultMenuColorRes = colorRes;
            }
        }
        try {
            Object item = nativeCreateContextMenuItem(trackObj, title, iconRes, colorRes);
            if (item != null) {
                menuItems.add(item);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed creating player crossfade context menu item", t);
        }
    }

    public static void openBottomSheetFromSettings() {
        MAIN_HANDLER.post(() -> {
            Activity act = currentActivityRef.get();
            if (act != null && !act.isFinishing() && !act.isDestroyed()) {
                CrossfadeBottomSheet.show(act);
            }
        });
    }

    private static int clampDuration(int seconds) {
        if (seconds < CrossfadeConfig.MIN_DURATION_SECONDS) {
            return CrossfadeConfig.MIN_DURATION_SECONDS;
        }
        if (seconds > CrossfadeConfig.MAX_DURATION_SECONDS) {
            return CrossfadeConfig.MAX_DURATION_SECONDS;
        }
        return seconds;
    }

    private static int resolveDrawableId(String name, int cached) {
        if (cached != 0) {
            return cached;
        }
        return resolveIdentifier(name, "drawable");
    }

    private static int resolveColorId(String name, int cached) {
        if (cached != 0) {
            return cached;
        }
        return resolveIdentifier(name, "color");
    }

    private static int resolveIdentifier(String name, String defType) {
        Application app = appRef.get();
        if (app == null) {
            return 0;
        }
        try {
            return app.getResources().getIdentifier(name, defType, app.getPackageName());
        } catch (Throwable ignored) {
            return 0;
        }
    }

    // ---- Patch-time native* Dalvik bridge stubs ----

    public static int nativeReadDurationSeconds(Object pref) {
        return CrossfadeConfig.getDefaultDurationSeconds();
    }

    public static void nativeWriteDurationSeconds(Object pref, int seconds) {
    }

    public static void nativeSetEngineCrossfadeDurationMs(Object engine, long durationMs) {
    }

    public static Object nativeCreatePublishSubject() {
        return null;
    }

    public static Object nativeMergeObservables(Object obs1, Object obs2) {
        return obs1;
    }

    public static void nativePublishNext(Object subject, Object value) {
    }

    public static Object nativeCreateSettingsRefreshEvent(Object settingsItem) {
        return null;
    }

    public static Object nativeCreateSettingsRowViewState(
            CharSequence title,
            CharSequence subtitle,
            CharSequence trailingValue,
            Object onClickFn
    ) {
        return null;
    }

    public static Object nativeCreateEmptyMaybe() {
        return null;
    }

    public static Object nativeCreateContextMenuItem(
            Object trackObj,
            String title,
            int iconRes,
            int colorRes
    ) {
        return null;
    }

    public static String nativeFindConsecutiveSameAlbumNextTrackId(Object localPlayQueue) {
        return null;
    }
}
