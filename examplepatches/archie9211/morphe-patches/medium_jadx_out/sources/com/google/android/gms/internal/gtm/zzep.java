package com.google.android.gms.internal.gtm;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.pairip.VMRunner;
import defpackage.nm;
import defpackage.vp7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
final class zzep extends BroadcastReceiver {
    static final String zza = "com.google.android.gms.internal.gtm.zzep";
    private final zzbu zzb;
    private boolean zzc;
    private boolean zzd;

    public zzep(zzbu zzbuVar) {
        vp7.p(zzbuVar);
        this.zzb = zzbuVar;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        VMRunner.invoke("EDrL0u49HTyRRhSp", new Object[]{this, context, intent});
    }

    public final void zza() {
        this.zzb.zzm();
        this.zzb.zzf();
        if (this.zzc) {
            return;
        }
        Context contextZza = this.zzb.zza();
        nm.A(contextZza, this, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"), null, 4);
        IntentFilter intentFilter = new IntentFilter("com.google.analytics.RADIO_POWERED");
        intentFilter.addCategory(contextZza.getPackageName());
        nm.A(contextZza, this, intentFilter, null, 4);
        this.zzd = zze();
        this.zzb.zzm().zzO("Registering connectivity change receiver. Network connected", Boolean.valueOf(this.zzd));
        this.zzc = true;
    }

    public final void zzb() {
        Context contextZza = this.zzb.zza();
        Intent intent = new Intent("com.google.analytics.RADIO_POWERED");
        intent.addCategory(contextZza.getPackageName());
        intent.putExtra(zza, true);
        contextZza.sendOrderedBroadcast(intent, null);
    }

    public final void zzc() {
        if (this.zzc) {
            this.zzb.zzm().zzN("Unregistering connectivity change receiver");
            this.zzc = false;
            this.zzd = false;
            try {
                this.zzb.zza().unregisterReceiver(this);
            } catch (IllegalArgumentException e) {
                this.zzb.zzm().zzJ("Failed to unregister the network broadcast receiver", e);
            }
        }
    }

    public final boolean zzd() {
        if (!this.zzc) {
            this.zzb.zzm().zzQ("Connectivity unknown. Receiver not registered");
        }
        return this.zzd;
    }

    public final boolean zze() {
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) this.zzb.zza().getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo != null) {
                if (activeNetworkInfo.isConnected()) {
                    return true;
                }
            }
        } catch (SecurityException unused) {
        }
        return false;
    }
}
