package dev.jason.gboardpatches.extension.toprowswipe;

import android.util.Log;

final class GboardTarget {
    private static final String TAG = "GboardTopRowSwipe";

    void logTargetError(String message, Throwable throwable) {
        if (throwable != null) {
            Log.w(TAG, message, throwable);
        } else {
            Log.w(TAG, message);
        }
    }
}
