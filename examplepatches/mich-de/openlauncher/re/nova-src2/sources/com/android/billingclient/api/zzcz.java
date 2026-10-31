package com.android.billingclient.api;

import com.google.android.gms.internal.play_billing.n5;
import com.google.android.gms.internal.play_billing.o5;
import com.google.android.gms.internal.play_billing.r4;
import com.google.android.gms.internal.play_billing.t0;
import com.google.android.gms.internal.play_billing.u4;
import com.google.android.gms.internal.play_billing.y4;
import com.google.android.gms.internal.play_billing.z4;

/* loaded from: classes2.dex */
interface zzcz {
    public static final /* synthetic */ int zza = 0;

    static {
        t0.a(3, new Object[]{"com.android.vending.billing.PURCHASES_UPDATED", z4.PURCHASES_UPDATED_ACTION, "com.android.vending.billing.LOCAL_BROADCAST_PURCHASES_UPDATED", z4.LOCAL_PURCHASES_UPDATED_ACTION, "com.android.vending.billing.ALTERNATIVE_BILLING", z4.ALTERNATIVE_BILLING_ACTION}, null);
    }

    void zza(r4 r4Var);

    void zzb(r4 r4Var, int i5);

    void zzc(r4 r4Var, int i5, long j11);

    void zzd(r4 r4Var, long j11, boolean z11);

    void zze(r4 r4Var, int i5, long j11, boolean z11);

    void zzf(u4 u4Var);

    void zzg(u4 u4Var, int i5);

    void zzh(u4 u4Var, long j11, boolean z11);

    void zzi(y4 y4Var);

    void zzj(n5 n5Var);

    void zzk(o5 o5Var);
}
