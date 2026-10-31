package com.android.billingclient.api;

import android.content.Context;
import android.content.IntentFilter;

/* loaded from: classes2.dex */
final class zzab {
    private final Context zza;
    private final PurchasesUpdatedListener zzb;
    private final zzb zzc;
    private final UserChoiceBillingListener zzd;
    private final DeveloperProvidedBillingListener zze;
    private final zzcz zzf;
    private final zzaa zzg = new zzaa(this, true);
    private final zzaa zzh = new zzaa(this, false);
    private boolean zzi;

    public zzab(Context context, PurchasesUpdatedListener purchasesUpdatedListener, zzdo zzdoVar, zzb zzbVar, UserChoiceBillingListener userChoiceBillingListener, DeveloperProvidedBillingListener developerProvidedBillingListener, zzcz zzczVar) {
        this.zza = context;
        this.zzb = purchasesUpdatedListener;
        this.zzc = zzbVar;
        this.zzd = userChoiceBillingListener;
        this.zze = developerProvidedBillingListener;
        this.zzf = zzczVar;
    }

    public final DeveloperProvidedBillingListener zzd() {
        return this.zze;
    }

    public final PurchasesUpdatedListener zzf() {
        return this.zzb;
    }

    public final void zzh() {
        zzaa zzaaVar = this.zzg;
        Context context = this.zza;
        zzaaVar.zzc(context);
        this.zzh.zzc(context);
    }

    public final void zzi(boolean z11) {
        IntentFilter intentFilter = new IntentFilter("com.android.vending.billing.PURCHASES_UPDATED");
        IntentFilter intentFilter2 = new IntentFilter("com.android.vending.billing.LOCAL_BROADCAST_PURCHASES_UPDATED");
        intentFilter2.addAction("com.android.vending.billing.ALTERNATIVE_BILLING");
        this.zzi = z11;
        zzaa zzaaVar = this.zzh;
        Context context = this.zza;
        zzaaVar.zza(context, intentFilter2);
        if (this.zzi) {
            this.zzg.zzb(context, intentFilter, "com.google.android.finsky.permission.PLAY_BILLING_LIBRARY_BROADCAST");
        } else {
            this.zzg.zza(context, intentFilter);
        }
    }
}
