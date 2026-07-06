package dev.jason.gboardpatches.extension.webclipboard;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public final class WebClipboardPackageReplacedReceiver extends BroadcastReceiver {
    private static final String TAG = "GboardWebClipboard";

    @Override
    public void onReceive(Context context, Intent intent) {
        try {
            if (context == null || intent == null
                    || !Intent.ACTION_MY_PACKAGE_REPLACED.equals(intent.getAction())) {
                return;
            }
            WebClipboardTileController.reconcileAfterPackageReplace(context);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to reconcile Web Clipboard after package replace", throwable);
        }
    }
}

