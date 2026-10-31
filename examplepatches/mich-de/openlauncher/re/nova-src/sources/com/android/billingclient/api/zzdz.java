package com.android.billingclient.api;

import java.util.List;

/* loaded from: classes2.dex */
public final class zzdz {
    private final List zza;
    private final BillingResult zzb;

    public zzdz(BillingResult billingResult, List list) {
        this.zza = list;
        this.zzb = billingResult;
    }

    public final BillingResult zza() {
        return this.zzb;
    }

    public final List zzb() {
        return this.zza;
    }
}
