package com.google.android.gms.internal.consent_sdk;

import android.util.Log;
import java.io.IOException;

/* loaded from: classes.dex */
public final class zzg extends Exception {
    public zzg(int i5, String str) {
        super(str);
    }

    public final ex.a a() {
        if (getCause() == null) {
            Log.w("UserMessagingPlatform", super.getMessage());
        } else {
            Log.w("UserMessagingPlatform", super.getMessage(), getCause());
        }
        return new ex.a(super.getMessage(), 8, false);
    }

    public zzg(int i5, IOException iOException, String str) {
        super(str, iOException);
    }
}
