package com.google.android.libraries.places.internal;

import b.c0;
import com.tiktok.util.TTConst;
import java.io.InputStream;
import java.util.concurrent.atomic.AtomicReferenceArray;

/* loaded from: classes3.dex */
public final class zzbcl {
    private final zzbcj zza;
    private final String zzb;
    private final String zzc;
    private final zzbci zzd;
    private final zzbci zze;
    private final boolean zzf;
    private final AtomicReferenceArray zzg = new AtomicReferenceArray(2);

    public /* synthetic */ zzbcl(zzbcj zzbcjVar, String str, zzbci zzbciVar, zzbci zzbciVar2, Object obj, boolean z11, boolean z12, boolean z13, zzbck zzbckVar) {
        zzmt.zzc(zzbcjVar, TTConst.TRACK_TYPE);
        this.zza = zzbcjVar;
        zzmt.zzc(str, "fullMethodName");
        this.zzb = str;
        zzmt.zzc(str, "fullMethodName");
        int iLastIndexOf = str.lastIndexOf(47);
        this.zzc = iLastIndexOf == -1 ? null : str.substring(0, iLastIndexOf);
        zzmt.zzc(zzbciVar, "requestMarshaller");
        this.zzd = zzbciVar;
        zzmt.zzc(zzbciVar2, "responseMarshaller");
        this.zze = zzbciVar2;
        this.zzf = z13;
    }

    public static zzbch zza(zzbci zzbciVar, zzbci zzbciVar2) {
        zzbch zzbchVar = new zzbch(null);
        zzbchVar.zzb(null);
        zzbchVar.zzc(null);
        return zzbchVar;
    }

    public static String zze(String str, String str2) {
        zzmt.zzc(str, "fullServiceName");
        zzmt.zzc(str2, "methodName");
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        return c0.q(sb2, "/", str2);
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("fullMethodName", this.zzb);
        zzmmVarZzb.zzd(TTConst.TRACK_TYPE, this.zza);
        zzmmVarZzb.zze("idempotent", false);
        zzmmVarZzb.zze("safe", false);
        zzmmVarZzb.zze("sampledToLocalTracing", this.zzf);
        zzmmVarZzb.zzd("requestMarshaller", this.zzd);
        zzmmVarZzb.zzd("responseMarshaller", this.zze);
        zzmmVarZzb.zzd("schemaDescriptor", null);
        zzmmVarZzb.zzg();
        return zzmmVarZzb.toString();
    }

    public final zzbcj zzb() {
        return this.zza;
    }

    public final InputStream zzc(Object obj) {
        return this.zzd.zza(obj);
    }

    public final Object zzd(InputStream inputStream) {
        return this.zze.zzb(inputStream);
    }

    public final String zzf() {
        return this.zzb;
    }

    public final String zzg() {
        return this.zzc;
    }
}
