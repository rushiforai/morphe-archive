package app.morphe.extension.maps.patches;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.util.Log;

/** Reports a GmsCore resolution that no activity can start as the failure Maps already handles. */
@SuppressWarnings("unused")
public final class GmsResolutionPatch {
    private static final String TAG = "MorpheGmsResolution";

    private GmsResolutionPatch() {
    }

    /**
     * Replaces the Activity call in Status.startResolutionForResult and in the AndroidX
     * ActivityResultRegistry IntentSender launch. MicroG-RE 7.2.1 and 7.2.2 return a
     * location-settings PendingIntent that resolves to no activity (issue #15). Both places and
     * their Maps callers handle only SendIntentException, so convert ActivityNotFoundException:
     * Status callers skip the dialog, and the registry delivers RESULT_CANCELED to the requester.
     */
    public static void startIntentSenderForResult(Activity activity, IntentSender intent,
            int requestCode, Intent fillInIntent, int flagsMask, int flagsValues,
            int extraFlags, Bundle options) throws IntentSender.SendIntentException {
        try {
            activity.startIntentSenderForResult(intent, requestCode, fillInIntent,
                    flagsMask, flagsValues, extraFlags, options);
        } catch (ActivityNotFoundException exception) {
            Log.w(TAG, "Resolution has no activity; request=" + requestCode, exception);
            throw new IntentSender.SendIntentException(exception);
        }
    }
}
