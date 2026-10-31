package com.facebook.ads.internal.util.common;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import androidx.annotation.Keep;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

@Keep
/* loaded from: classes.dex */
public class ANActivityLifecycleCallbacksListener implements Application.ActivityLifecycleCallbacks {
    public static final int ACTIVITY_CREATED = 1;
    public static final int ACTIVITY_DESTROYED = 6;
    public static final int ACTIVITY_PAUSED = 4;
    public static final int ACTIVITY_RESUMED = 3;
    public static final int ACTIVITY_STARTED = 2;
    public static final int ACTIVITY_STOPPED = 5;
    private static ANActivityLifecycleCallbacksListener sANActivityLifecycleCallbacksListener;
    private static final Map<Activity, Integer> sActivityStateMap = Collections.synchronizedMap(new WeakHashMap());

    public static synchronized ANActivityLifecycleCallbacksListener getANActivityLifecycleCallbacksListener() {
        return sANActivityLifecycleCallbacksListener;
    }

    public static void registerActivityCallbacks(Context context) {
        Context applicationContext = context.getApplicationContext();
        synchronized (ANActivityLifecycleCallbacksListener.class) {
            try {
                if ((applicationContext instanceof Application) && sANActivityLifecycleCallbacksListener == null) {
                    ANActivityLifecycleCallbacksListener aNActivityLifecycleCallbacksListener = new ANActivityLifecycleCallbacksListener();
                    sANActivityLifecycleCallbacksListener = aNActivityLifecycleCallbacksListener;
                    ((Application) applicationContext).registerActivityLifecycleCallbacks(aNActivityLifecycleCallbacksListener);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static void unregisterActivityCallbacks(Context context) {
        Context applicationContext = context.getApplicationContext();
        synchronized (ANActivityLifecycleCallbacksListener.class) {
            try {
                if (applicationContext instanceof Application) {
                    ((Application) applicationContext).unregisterActivityLifecycleCallbacks(sANActivityLifecycleCallbacksListener);
                    sANActivityLifecycleCallbacksListener = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public Map<Activity, Integer> getActivityStateMap() {
        return sActivityStateMap;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle bundle) {
        sActivityStateMap.put(activity, 1);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
        sActivityStateMap.put(activity, 6);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
        sActivityStateMap.put(activity, 4);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
        sActivityStateMap.put(activity, 3);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
        sActivityStateMap.put(activity, 2);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        sActivityStateMap.put(activity, 5);
    }
}
