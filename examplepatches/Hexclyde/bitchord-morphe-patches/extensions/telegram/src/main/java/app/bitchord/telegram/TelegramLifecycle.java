package app.bitchord.telegram;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/** Mirrors foreground activity state to TDLib's online status. */
final class TelegramLifecycle implements Application.ActivityLifecycleCallbacks {
    private final TelegramBridge bridge;
    private final Set<Activity> resumed =
            Collections.newSetFromMap(new WeakHashMap<Activity, Boolean>());
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable background;

    private TelegramLifecycle(TelegramBridge bridge) {
        this.bridge = bridge;
        background = () -> bridge.setForeground(false);
    }

    static void install(Application app, TelegramBridge bridge) {
        app.registerActivityLifecycleCallbacks(new TelegramLifecycle(bridge));
    }

    @Override
    public void onActivityResumed(Activity activity) {
        main.removeCallbacks(background);
        resumed.add(activity);
        bridge.setForeground(true);
    }

    @Override
    public void onActivityPaused(Activity activity) {
        resumed.remove(activity);
        if (resumed.isEmpty()) main.postDelayed(background, 700);
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        resumed.remove(activity);
    }

    @Override
    public void onActivityCreated(Activity activity, Bundle state) {}

    @Override
    public void onActivityStarted(Activity activity) {}

    @Override
    public void onActivityStopped(Activity activity) {}

    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
}
