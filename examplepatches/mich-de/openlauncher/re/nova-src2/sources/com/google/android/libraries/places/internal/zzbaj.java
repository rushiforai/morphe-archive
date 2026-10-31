package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbaj {
    private Object zza;

    private zzbaj() {
        throw null;
    }

    public final zzbaj zza(Object obj) {
        this.zza = obj;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final zzbal zzb() {
        zzmt.zzp(this.zza != null, "config is not set");
        return new zzbal(zzbdo.zza, this.zza, null, 0 == true ? 1 : 0);
    }

    public /* synthetic */ zzbaj(zzbai zzbaiVar) {
    }
}
