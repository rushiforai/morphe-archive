package com.pairip.vmencryption;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/* JADX INFO: loaded from: classes2.dex */
public final class KeyImportPlaceholderReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Log.w("KeyNotImported", "Cannot handle broadcast before key import is complete.  App needs to be restarted.");
    }
}
