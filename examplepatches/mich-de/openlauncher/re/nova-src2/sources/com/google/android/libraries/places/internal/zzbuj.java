package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbuj {
    private zzbui zza;
    private final zzbtb zzb = new zzbtb();

    public final zzbuj zzc(String str, String str2) {
        this.zzb.zza(str, str2);
        return this;
    }

    public final zzbuj zzd(zzbui zzbuiVar) {
        this.zza = zzbuiVar;
        return this;
    }

    public final zzbul zze() {
        if (this.zza != null) {
            return new zzbul(this, null);
        }
        throw new IllegalStateException("url == null");
    }
}
