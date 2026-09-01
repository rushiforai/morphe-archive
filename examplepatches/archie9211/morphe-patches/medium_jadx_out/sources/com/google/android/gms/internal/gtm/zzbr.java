package com.google.android.gms.internal.gtm;

import defpackage.ygf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zzbr extends zzbq {
    private boolean zza;

    public zzbr(zzbu zzbuVar) {
        super(zzbuVar);
    }

    public final void zzV() {
        if (zzX()) {
            return;
        }
        ygf.f("Not initialized");
    }

    public final void zzW() {
        zzd();
        this.zza = true;
    }

    public final boolean zzX() {
        return this.zza;
    }

    public abstract void zzd();
}
