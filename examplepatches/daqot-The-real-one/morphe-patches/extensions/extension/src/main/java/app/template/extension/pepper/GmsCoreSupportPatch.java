package app.template.extension.pepper;

import android.app.Activity;

import app.template.extension.shared.GmsCoreSupport;

@SuppressWarnings("unused")
public final class GmsCoreSupportPatch {

    /**
     * Injection point. Called when the main activity is created.
     */
    public static void checkGmsCore(Activity activity) {
        GmsCoreSupport.checkGmsCore(activity, "Pepper", "Peppera");
    }
}
