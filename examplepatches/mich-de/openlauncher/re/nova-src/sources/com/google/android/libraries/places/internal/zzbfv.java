package com.google.android.libraries.places.internal;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class zzbfv {
    private String zza = "unknown-authority";
    private zzaye zzb = zzaye.zza;
    private String zzc;
    private zzbaa zzd;

    public final boolean equals(Object obj) {
        if (!(obj instanceof zzbfv)) {
            return false;
        }
        zzbfv zzbfvVar = (zzbfv) obj;
        return this.zza.equals(zzbfvVar.zza) && this.zzb.equals(zzbfvVar.zzb) && zzmo.zza(null, null) && zzmo.zza(this.zzd, zzbfvVar.zzd);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.zza, this.zzb, null, this.zzd});
    }

    public final zzaye zza() {
        return this.zzb;
    }

    public final zzbaa zzb() {
        return this.zzd;
    }

    public final zzbfv zzc(String str) {
        zzmt.zzc(str, "authority");
        this.zza = str;
        return this;
    }

    public final zzbfv zzd(zzaye zzayeVar) {
        this.zzb = zzayeVar;
        return this;
    }

    public final zzbfv zze(zzbaa zzbaaVar) {
        this.zzd = zzbaaVar;
        return this;
    }

    public final zzbfv zzf(String str) {
        this.zzc = null;
        return this;
    }

    public final String zzg() {
        return this.zza;
    }
}
