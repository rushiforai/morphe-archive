package app.medium.extension;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.util.Log;

@SuppressWarnings("unused")
public class MediumPatchExtension {
    private static final String TAG = "MediumPatchExtension";
    private static boolean registered = false;

    /**
     * Called from DonkeyApplication.onCreate() in Medium.
     */
    public static void init(Application app) {
        if (app == null || registered) return;
        registered = true;

        Log.d(TAG, "Initializing MediumPatchExtension with Application lifecycle callbacks...");

        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}

            @Override
            public void onActivityStarted(Activity activity) {}

            @Override
            public void onActivityResumed(Activity activity) {
                try {
                    TranslateOverlayManager.attachTranslateButton(activity);
                } catch (Throwable t) {
                    Log.e(TAG, "Error attaching translate button in onActivityResumed", t);
                }
            }

            @Override
            public void onActivityPaused(Activity activity) {}

            @Override
            public void onActivityStopped(Activity activity) {}

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}

            @Override
            public void onActivityDestroyed(Activity activity) {}
        });
    }

    public static String translateText(String originalText) {
        if (originalText == null || originalText.length() < 10) return originalText;
        return MediumTranslator.translateText(originalText, MediumTranslator.getTargetLanguage());
    }
}