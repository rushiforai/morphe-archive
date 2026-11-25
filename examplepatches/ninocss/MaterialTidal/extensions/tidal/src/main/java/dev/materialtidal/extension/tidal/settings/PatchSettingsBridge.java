package dev.materialtidal.extension.tidal.settings;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.util.List;

/**
 * Runtime & Dalvik bridge connecting TIDAL's main Settings screen ({@code Lhsg;}) and
 * {@code App.onCreate()} to our MaterialTidal in-app Patch Settings sheet.
 *
 * <p>All {@code native*} method bodies are replaced at patch time with fingerprinted Dalvik
 * bytecode by {@code PatchSettingsPatch}.
 */
@SuppressWarnings("unused")
public final class PatchSettingsBridge {

    private static final String TAG = "MaterialTidalSettings";
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static volatile WeakReference<Application> appRef = new WeakReference<>(null);
    private static volatile WeakReference<Activity> currentActivityRef = new WeakReference<>(null);
    private static volatile boolean lifecycleRegistered;

    private static volatile PatchSettingsItemAdapter settingsItemRef;
    private static volatile Object settingsRefreshSubject;

    private PatchSettingsBridge() {
    }

    public static void initApplication(Application app) {
        if (app == null) {
            return;
        }
        appRef = new WeakReference<>(app);
        PatchSettingsPrefs.init(app);

        synchronized (PatchSettingsBridge.class) {
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

    public static void onMainSettingsBuilt(List<Object> items) {
        if (items == null) {
            return;
        }
        Application app = appRef.get();
        if (app != null) {
            PatchSettingsPrefs.ensureInitialized(app);
        } else {
            Activity act = currentActivityRef.get();
            if (act != null) {
                PatchSettingsPrefs.ensureInitialized(act);
            }
        }

        PatchSettingsItemAdapter adapter = settingsItemRef;
        if (adapter == null) {
            adapter = new PatchSettingsItemAdapter();
            settingsItemRef = adapter;
        } else {
            adapter.refreshImpl();
        }

        if (!items.contains(adapter)) {
            int insertIndex = items.isEmpty() ? 0 : 1;
            items.add(insertIndex, adapter);
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
            Log.w(TAG, "Failed merging main settings refresh observable", t);
            return originalObservable;
        }
    }

    public static void notifySettingsItemChanged() {
        PatchSettingsItemAdapter item = settingsItemRef;
        if (item == null) {
            return;
        }
        try {
            item.refreshImpl();
        } catch (Throwable ignored) {
        }
        Object subject = settingsRefreshSubject;
        if (subject == null) {
            return;
        }
        try {
            Object event = nativeCreateSettingsRefreshEvent(item);
            if (event != null) {
                synchronized (PatchSettingsBridge.class) {
                    nativePublishNext(subject, event);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed publishing main settings refresh event", t);
        }
    }

    private static Object ensureSettingsRefreshSubject() {
        Object subject = settingsRefreshSubject;
        if (subject == null) {
            synchronized (PatchSettingsBridge.class) {
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

    public static void openPatchSettingsSheet() {
        MAIN_HANDLER.post(() -> {
            Activity act = currentActivityRef.get();
            if (act != null && !act.isFinishing() && !act.isDestroyed()) {
                PatchSettingsBottomSheet.show(act);
            }
        });
    }

    // ---- Patch-time native* Dalvik bridge stubs ----

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
}
