package com.dhuadapter.mediabridge;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/**
 * Receives the MediaCenter server's reboot recovery broadcast (action
 * com.dhuadapter.RECOVER, sent with FLAG_INCLUDE_STOPPED_PACKAGES so it reaches
 * our killed process). Being invoked means the process is already up and the
 * AppComponentFactory has installed the hooks — we just kick the bridge to
 * re-bind with MediaCenter and resume. Declared exported in the patched manifest
 * because the broadcast originates from the system MediaCenter process.
 */
public final class RecoveryReceiver extends BroadcastReceiver {
    private static final String TAG = "DhuAdapter";

    @Override
    public void onReceive(Context ctx, Intent intent) {
        try {
            Log.i(TAG, "RecoveryReceiver: reboot recovery broadcast received");
            MediaBridge.onRecoveryBroadcast(ctx);
        } catch (Throwable t) {
            Log.w(TAG, "RecoveryReceiver failed", t);
        }
    }
}
