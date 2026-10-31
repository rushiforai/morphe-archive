package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbrm {
    public static final zzbtt zza;
    public static final zzbtt zzb;
    public static final zzbtt zzc;
    public static final zzbtt zzd;
    public static final zzbtt zze;
    public static final zzbtt zzf;

    static {
        zzbwf zzbwfVar = zzbtt.zzd;
        zzbwe zzbweVar = zzbwf.zza;
        zza = new zzbtt(zzbwfVar, zzbwe.zza("https"));
        zzb = new zzbtt(zzbwfVar, zzbwe.zza("http"));
        zzbwf zzbwfVar2 = zzbtt.zzb;
        zzc = new zzbtt(zzbwfVar2, zzbwe.zza("POST"));
        zzd = new zzbtt(zzbwfVar2, zzbwe.zza("GET"));
        zze = new zzbtt(zzbjd.zzh.zzd(), "application/grpc");
        zzf = new zzbtt("te", "trailers");
    }
}
