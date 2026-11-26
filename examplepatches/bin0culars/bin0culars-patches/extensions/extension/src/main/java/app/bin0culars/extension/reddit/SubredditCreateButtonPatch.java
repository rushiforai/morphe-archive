package app.bin0culars.extension.reddit;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.functions.Function0;

public final class SubredditCreateButtonPatch {

    private static final Function0<Object> NO_OP_CLICK = new Function0<Object>() {
        @Override
        public Object invoke() {
            return null;
        }
    };

    private static final AtomicBoolean lifecycleRegistered = new AtomicBoolean(false);
    private static volatile WeakReference<Activity> currentActivity = new WeakReference<>(null);
    private static volatile Boolean cachedEnabled;
    private static volatile int cachedIconRes;

    private SubredditCreateButtonPatch() {}

    private static Intent submitIntent(Context context, Bundle extras) {
        // Modified during patching.
        return null;
    }

    public static boolean isEnabled() {
        try {
            // Cache once per process so the Compose slot table shape stays fixed until restart.
            Boolean enabled = cachedEnabled;
            if (enabled != null) {
                return enabled;
            }
            boolean value = BinocularsMods.isEnabled("subreddit_create_button");
            cachedEnabled = value;
            return value;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void onActivityResumed(Activity activity) {
        try {
            if (activity == null) {
                return;
            }
            currentActivity = new WeakReference<>(activity);
            if (lifecycleRegistered.get()) {
                return;
            }
            Application app = activity.getApplication();
            if (app == null || !lifecycleRegistered.compareAndSet(false, true)) {
                return;
            }
            app.registerActivityLifecycleCallbacks(
                new Application.ActivityLifecycleCallbacks() {
                    @Override
                    public void onActivityCreated(Activity a, Bundle savedInstanceState) {}

                    @Override
                    public void onActivityStarted(Activity a) {}

                    @Override
                    public void onActivityResumed(Activity a) {
                        currentActivity = new WeakReference<>(a);
                    }

                    @Override
                    public void onActivityPaused(Activity a) {
                        WeakReference<Activity> ref = currentActivity;
                        if (ref != null && ref.get() == a) {
                            currentActivity = new WeakReference<>(null);
                        }
                    }

                    @Override
                    public void onActivityStopped(Activity a) {}

                    @Override
                    public void onActivitySaveInstanceState(Activity a, Bundle outState) {}

                    @Override
                    public void onActivityDestroyed(Activity a) {}
                }
            );
        } catch (Throwable ignored) {
        }
    }

    public static int iconRes() {
        try {
            int resId = cachedIconRes;
            if (resId != 0) {
                return resId;
            }
            Context context = GlassNavPatch.getApplicationContext();
            if (context == null) {
                return 0;
            }
            resId = context.getResources().getIdentifier("icon_add", "drawable", context.getPackageName());
            if (resId != 0) {
                cachedIconRes = resId;
            }
            return resId;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    public static String label() {
        try {
            return "Create post";
        } catch (Throwable ignored) {
            return "";
        }
    }

    public static String contentDescription(String name) {
        try {
            String cleanName = normalizeDisplayName(name);
            return cleanName.isEmpty() ? "Create post" : "Create post in r/" + cleanName;
        } catch (Throwable ignored) {
            return "";
        }
    }

    public static Function0<?> onClick(String name) {
        try {
            final String cleanName = normalizeDisplayName(name);
            if (cleanName.isEmpty()) {
                return NO_OP_CLICK;
            }
            return new Function0<Object>() {
                @Override
                public Object invoke() {
                    try {
                        WeakReference<Activity> ref = currentActivity;
                        Activity activity = ref != null ? ref.get() : null;
                        if (activity == null) {
                            return null;
                        }
                        Bundle extras = new Bundle();
                        extras.putString("subreddit_name", cleanName);
                        Intent intent = submitIntent(activity, extras);
                        if (intent == null) {
                            return null;
                        }
                        intent.setComponent(activity.getComponentName());
                        intent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
                        activity.startActivity(intent);
                    } catch (Throwable ignored) {
                    }
                    return null;
                }
            };
        } catch (Throwable ignored) {
            return NO_OP_CLICK;
        }
    }

    private static String normalizeDisplayName(String name) {
        if (name == null) {
            return "";
        }
        name = name.trim();
        if (name.startsWith("r/")) {
            name = name.substring(2);
        }
        return name;
    }
}
