/*
 * Adapted from gmaps-patches by fangkampanat, https://github.com/fangkampanat/gmaps-patches
 * See the included NOTICE file for the GPLv3 section 7 terms that apply to this code.
 */

package io.github.hyperstown.extension.maps;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.util.Log;

@SuppressWarnings("unused")
public final class GmsResolution {
    private static final String TAG = "GmsResolution";

    private GmsResolution() {
    }

    /**
     * Injection point: replaces Activity.startIntentSenderForResult in Status.startResolutionForResult
     * and in the AndroidX ActivityResultRegistry.
     * <p>
     * MicroG-RE answers a location settings check with a resolution that no activity handles.
     * Its callers only handle SendIntentException, so report the missing activity as one.
     */
    public static void startIntentSenderForResult(Activity activity, IntentSender intent, int requestCode,
                                                  Intent fillInIntent, int flagsMask, int flagsValues,
                                                  int extraFlags, Bundle options)
            throws IntentSender.SendIntentException {
        try {
            activity.startIntentSenderForResult(intent, requestCode, fillInIntent,
                    flagsMask, flagsValues, extraFlags, options);
        } catch (ActivityNotFoundException exception) {
            Log.w(TAG, "No activity handles the resolution, request " + requestCode, exception);
            throw new IntentSender.SendIntentException(exception);
        }
    }
}
