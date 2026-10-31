package com.android.billingclient.api;

import com.google.android.gms.internal.play_billing.j1;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.w4;
import java.util.Objects;
import java.util.concurrent.TimeoutException;
import z4.a;

/* loaded from: classes2.dex */
final class zzcs implements j1 {
    final /* synthetic */ a zza;
    final /* synthetic */ Runnable zzb;
    final /* synthetic */ zzcw zzc;
    final /* synthetic */ int zzd;

    public zzcs(zzcw zzcwVar, int i5, a aVar, Runnable runnable) {
        this.zzd = i5;
        this.zza = aVar;
        this.zzb = runnable;
        Objects.requireNonNull(zzcwVar);
        this.zzc = zzcwVar;
    }

    @Override // com.google.android.gms.internal.play_billing.j1
    public final void zza(Throwable th2) {
        if (th2 instanceof TimeoutException) {
            this.zzc.zzaN(w4.BILLING_OVERRIDE_SERVICE_CALL_TIMEOUT, 28, zzdc.zzE);
            m0.i("BillingClientTesting", "Asynchronous call to Billing Override Service timed out.", th2);
        } else {
            this.zzc.zzaN(w4.BILLING_OVERRIDE_SERVICE_CALL_EXCEPTION, 28, zzdc.zzE);
            m0.i("BillingClientTesting", "An error occurred while retrieving billing override.", th2);
        }
        this.zzb.run();
    }

    @Override // com.google.android.gms.internal.play_billing.j1
    public final /* bridge */ /* synthetic */ void zzb(Object obj) {
        Integer num = (Integer) obj;
        int iIntValue = num.intValue();
        zzcw zzcwVar = this.zzc;
        if (!zzcw.zzaK(iIntValue)) {
            this.zzb.run();
        } else {
            this.zza.accept(zzcwVar.zzaL(this.zzd, num.intValue()));
        }
    }
}
