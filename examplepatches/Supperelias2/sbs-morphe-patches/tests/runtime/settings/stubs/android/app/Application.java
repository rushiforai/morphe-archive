package android.app;

import android.content.Context;
import android.os.Bundle;

public class Application extends Context {
    public void registerActivityLifecycleCallbacks(ActivityLifecycleCallbacks callbacks) { throw new UnsupportedOperationException("Activity lifecycle not exercised"); }
    public interface ActivityLifecycleCallbacks {
        void onActivityCreated(Activity activity, Bundle state);
        void onActivityStarted(Activity activity);
        void onActivityResumed(Activity activity);
        void onActivityPaused(Activity activity);
        void onActivityStopped(Activity activity);
        void onActivitySaveInstanceState(Activity activity, Bundle state);
        void onActivityDestroyed(Activity activity);
    }
}
