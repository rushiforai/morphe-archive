package com.android.billingclient.api;

import com.google.android.gms.internal.play_billing.u5;
import com.google.android.gms.internal.play_billing.x;

/* loaded from: classes2.dex */
final class zzct extends x {
    private final u5 zza;

    public zzct(u5 u5Var) {
        super("com.google.android.apps.play.billingtestcompanion.aidl.IBillingOverrideServiceCallback");
        this.zza = u5Var;
    }

    @Override // com.google.android.gms.internal.play_billing.z
    public final void zza(int i5) {
        this.zza.a(Integer.valueOf(i5));
    }
}
