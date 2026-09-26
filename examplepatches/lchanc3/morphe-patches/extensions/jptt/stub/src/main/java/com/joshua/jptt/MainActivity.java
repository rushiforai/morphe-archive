package com.joshua.jptt;

import android.content.Context;

/** Stub of the class already present in the JPTT APK. */
@SuppressWarnings("ALL")
public class MainActivity {

    public static JSocket socket;

    public static void showBuildShortcutOnLauncherDialog(Context context, String site, String board) {
        throw new UnsupportedOperationException("stub");
    }

    public boolean isConnected() {
        throw new UnsupportedOperationException("stub");
    }

    public void notifyNotConnected() {
        throw new UnsupportedOperationException("stub");
    }

    // Added to MainActivity by the Reconnect on return patch.

    public boolean patchHasPendingReconnect() {
        throw new UnsupportedOperationException("stub");
    }

    public void patchReconnectNow() {
        throw new UnsupportedOperationException("stub");
    }

    public void patchHoldReconnect() {
        throw new UnsupportedOperationException("stub");
    }
}
