package com.google.android.libraries.places.internal;

import b.c0;
import b.u4;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.TreeMap;

/* loaded from: classes3.dex */
public final class zzbdo {
    public static final zzbdo zza;
    public static final zzbdo zzb;
    public static final zzbdo zzc;
    public static final zzbdo zzd;
    public static final zzbdo zze;
    public static final zzbdo zzf;
    public static final zzbdo zzg;
    public static final zzbdo zzh;
    public static final zzbdo zzi;
    public static final zzbdo zzj;
    public static final zzbdo zzk;
    public static final zzbdo zzl;
    public static final zzbdo zzm;
    public static final zzbdo zzn;
    public static final zzbdo zzo;
    public static final zzbdo zzp;
    public static final zzbdo zzq;
    static final zzbca zzr;
    static final zzbca zzs;
    private static final List zzt;
    private static final zzbce zzu;
    private final zzbdj zzv;
    private final String zzw;
    private final Throwable zzx;

    /* JADX WARN: Multi-variable type inference failed */
    static {
        TreeMap treeMap = new TreeMap();
        zzbdj[] zzbdjVarArrValues = zzbdj.values();
        int length = zzbdjVarArrValues.length;
        boolean z11 = false;
        int i5 = 0;
        while (true) {
            zzbdk zzbdkVar = null;
            Object[] objArr = 0;
            Object[] objArr2 = 0;
            if (i5 >= length) {
                zzt = Collections.unmodifiableList(new ArrayList(treeMap.values()));
                zza = zzbdj.OK.zzb();
                zzb = zzbdj.CANCELLED.zzb();
                zzc = zzbdj.UNKNOWN.zzb();
                zzd = zzbdj.INVALID_ARGUMENT.zzb();
                zze = zzbdj.DEADLINE_EXCEEDED.zzb();
                zzf = zzbdj.NOT_FOUND.zzb();
                zzg = zzbdj.ALREADY_EXISTS.zzb();
                zzh = zzbdj.PERMISSION_DENIED.zzb();
                zzi = zzbdj.UNAUTHENTICATED.zzb();
                zzj = zzbdj.RESOURCE_EXHAUSTED.zzb();
                zzk = zzbdj.FAILED_PRECONDITION.zzb();
                zzl = zzbdj.ABORTED.zzb();
                zzm = zzbdj.OUT_OF_RANGE.zzb();
                zzn = zzbdj.UNIMPLEMENTED.zzb();
                zzo = zzbdj.INTERNAL.zzb();
                zzp = zzbdj.UNAVAILABLE.zzb();
                zzq = zzbdj.DATA_LOSS.zzb();
                zzr = new zzbcd("grpc-status", z11, new zzbdl(zzbdkVar), objArr2 == true ? 1 : 0);
                zzbdn zzbdnVar = new zzbdn(null);
                zzu = zzbdnVar;
                zzs = new zzbcd("grpc-message", z11, zzbdnVar, objArr == true ? 1 : 0);
                return;
            }
            zzbdj zzbdjVar = zzbdjVarArrValues[i5];
            zzbdo zzbdoVar = (zzbdo) treeMap.put(Integer.valueOf(zzbdjVar.zza()), new zzbdo(zzbdjVar, null, null));
            if (zzbdoVar != null) {
                throw new IllegalStateException(c0.m("Code value duplication between ", zzbdoVar.zzv.name(), " & ", zzbdjVar.name()));
            }
            i5++;
        }
    }

    private zzbdo(zzbdj zzbdjVar, String str, Throwable th2) {
        zzmt.zzc(zzbdjVar, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE);
        this.zzv = zzbdjVar;
        this.zzw = str;
        this.zzx = th2;
    }

    public static /* bridge */ /* synthetic */ zzbdo zzb(byte[] bArr) {
        int i5;
        byte b11;
        int length = bArr.length;
        char c11 = 0;
        if (length == 1) {
            if (bArr[0] == 48) {
                return zza;
            }
            length = 1;
        }
        if (length != 1) {
            if (length == 2 && (b11 = bArr[0]) >= 48 && b11 <= 57) {
                i5 = (b11 - 48) * 10;
                c11 = 1;
            }
            return zzc.zzg("Unknown code ".concat(new String(bArr, zzmb.zza)));
        }
        i5 = 0;
        byte b12 = bArr[c11];
        if (b12 >= 48 && b12 <= 57) {
            int i11 = (b12 - 48) + i5;
            List list = zzt;
            if (i11 < list.size()) {
                return (zzbdo) list.get(i11);
            }
        }
        return zzc.zzg("Unknown code ".concat(new String(bArr, zzmb.zza)));
    }

    public static zzbdo zzd(int i5) {
        if (i5 >= 0) {
            List list = zzt;
            if (i5 < list.size()) {
                return (zzbdo) list.get(i5);
            }
        }
        return zzc.zzg("Unknown code " + i5);
    }

    public static zzbdo zze(Throwable th2) {
        zzmt.zzc(th2, "t");
        for (Throwable cause = th2; cause != null; cause = cause.getCause()) {
            if (cause instanceof zzbdp) {
                return ((zzbdp) cause).zza();
            }
            if (cause instanceof zzbdq) {
                return ((zzbdq) cause).zza();
            }
        }
        return zzc.zzf(th2);
    }

    public static String zzh(zzbdo zzbdoVar) {
        String str = zzbdoVar.zzw;
        zzbdj zzbdjVar = zzbdoVar.zzv;
        return str == null ? zzbdjVar.toString() : u4.m(zzbdjVar.toString(), ": ", str);
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, this.zzv.name());
        zzmmVarZzb.zzd(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, this.zzw);
        Throwable th2 = this.zzx;
        Object string = th2;
        if (th2 != null) {
            StringWriter stringWriter = new StringWriter();
            th2.printStackTrace(new PrintWriter(stringWriter));
            string = stringWriter.toString();
        }
        zzmmVarZzb.zzd("cause", string);
        return zzmmVarZzb.toString();
    }

    public final zzbdj zza() {
        return this.zzv;
    }

    public final zzbdo zzc(String str) {
        String str2 = this.zzw;
        return str2 == null ? new zzbdo(this.zzv, str, this.zzx) : new zzbdo(this.zzv, u4.m(str2, "\n", str), this.zzx);
    }

    public final zzbdo zzf(Throwable th2) {
        return zzmo.zza(this.zzx, th2) ? this : new zzbdo(this.zzv, this.zzw, th2);
    }

    public final zzbdo zzg(String str) {
        return zzmo.zza(this.zzw, str) ? this : new zzbdo(this.zzv, str, this.zzx);
    }

    public final String zzi() {
        return this.zzw;
    }

    public final Throwable zzj() {
        return this.zzx;
    }

    public final boolean zzl() {
        return zzbdj.OK == this.zzv;
    }
}
