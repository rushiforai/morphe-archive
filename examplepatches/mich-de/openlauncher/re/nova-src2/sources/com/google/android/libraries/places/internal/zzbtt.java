package com.google.android.libraries.places.internal;

import b.u4;

/* loaded from: classes3.dex */
public final class zzbtt {
    public static final zzbwf zza;
    public static final zzbwf zzb;
    public static final zzbwf zzc;
    public static final zzbwf zzd;
    public static final zzbwf zze;
    public static final zzbwf zzf;
    public static final zzbwf zzg;
    public final zzbwf zzh;
    public final zzbwf zzi;
    final int zzj;

    static {
        zzbwe zzbweVar = zzbwf.zza;
        zza = zzbwe.zza(":status");
        zzb = zzbwe.zza(":method");
        zzc = zzbwe.zza(":path");
        zzd = zzbwe.zza(":scheme");
        zze = zzbwe.zza(":authority");
        zzf = zzbwe.zza(":host");
        zzg = zzbwe.zza(":version");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public zzbtt(String str, String str2) {
        this(zzbwe.zza(str), zzbwe.zza(str2));
        zzbwe zzbweVar = zzbwf.zza;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof zzbtt) {
            zzbtt zzbttVar = (zzbtt) obj;
            if (this.zzh.equals(zzbttVar.zzh) && this.zzi.equals(zzbttVar.zzi)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = this.zzh.hashCode() + 527;
        return this.zzi.hashCode() + (iHashCode * 31);
    }

    public final String toString() {
        return u4.m(this.zzh.zzf(), ": ", this.zzi.zzf());
    }

    public zzbtt(zzbwf zzbwfVar, zzbwf zzbwfVar2) {
        this.zzh = zzbwfVar;
        this.zzi = zzbwfVar2;
        this.zzj = zzbwfVar2.zzc() + zzbwfVar.zzc() + 32;
    }
}
