package com.android.billingclient.api;

import com.google.android.gms.internal.play_billing.w4;
import com.google.android.gms.internal.play_billing.z4;

/* loaded from: classes2.dex */
final class zzde {
    public static void zza(w4 w4Var, BillingResult billingResult, zzcz zzczVar, int i5, int i11) {
        int i12 = zzcy.zza;
        zzczVar.zzb(zzcy.zzb(w4Var, i5, billingResult, null, z4.BROADCAST_ACTION_UNSPECIFIED), i11);
    }

    public static void zzb(w4 w4Var, BillingResult billingResult, zzcz zzczVar, int i5, int i11, String str) {
        int i12 = zzcy.zza;
        zzczVar.zzb(zzcy.zzb(w4Var, i5, billingResult, str, z4.BROADCAST_ACTION_UNSPECIFIED), i11);
    }
}
