package com.pairip.vmencryption;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

/* JADX INFO: loaded from: classes2.dex */
public final class KeyImportPlaceholderService extends Service {
    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        Log.w("KeyNotImported", "Cannot handle bind before key import is complete.  App needs to be restarted.");
        return null;
    }
}
