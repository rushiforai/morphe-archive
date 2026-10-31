package com.google.android.libraries.places.internal;

import b.c0;

/* loaded from: classes3.dex */
public final class zzbul {
    private final zzbui zza;
    private final zzbtd zzb;

    public /* synthetic */ zzbul(zzbuj zzbujVar, zzbuk zzbukVar) {
        this.zza = zzbujVar.zza;
        this.zzb = zzbujVar.zzb.zzb();
    }

    public final String toString() {
        return c0.l("Request{url=", String.valueOf(this.zza), "}");
    }

    public final zzbtd zza() {
        return this.zzb;
    }

    public final zzbui zzb() {
        return this.zza;
    }
}
