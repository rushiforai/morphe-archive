package com.pairip.vmencryption;

import android.app.PendingIntent;

/* JADX INFO: loaded from: classes2.dex */
public interface KeyImportResultListener {
    void onActionRequired(PendingIntent pendingIntent);

    void onFailure(Exception exception);

    void onSuccess();
}
