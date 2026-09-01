package com.android.billingclient.api;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class InAppMessageResult {
    private final int zza;
    private final String zzb;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Retention(RetentionPolicy.SOURCE)
    public @interface InAppMessageResponseCode {
        public static final int NO_ACTION_NEEDED = 0;
        public static final int SUBSCRIPTION_STATUS_UPDATED = 1;
    }

    public InAppMessageResult(int i, String str) {
        this.zza = i;
        this.zzb = str;
    }

    public String getPurchaseToken() {
        return this.zzb;
    }

    public int getResponseCode() {
        return this.zza;
    }
}
