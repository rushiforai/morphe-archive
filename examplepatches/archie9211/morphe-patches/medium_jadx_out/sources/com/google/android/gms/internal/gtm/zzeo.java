package com.google.android.gms.internal.gtm;

import defpackage.vp7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzeo extends zzbr {
    private static zzeo zza;

    public zzeo(zzbu zzbuVar) {
        super(zzbuVar);
    }

    public static zzeo zza() {
        return zza;
    }

    public static final String zzf(Object obj) {
        if (obj == null) {
            return null;
        }
        if (obj instanceof Integer) {
            obj = Long.valueOf(((Integer) obj).intValue());
        }
        if (!(obj instanceof Long)) {
            return obj instanceof Boolean ? obj.toString() : obj instanceof Throwable ? obj.getClass().getCanonicalName() : "-";
        }
        Long l = (Long) obj;
        if (Math.abs(l.longValue()) < 100) {
            return obj.toString();
        }
        char cCharAt = obj.toString().charAt(0);
        String strValueOf = String.valueOf(Math.abs(l.longValue()));
        String str = cCharAt != '-' ? "" : "-";
        return str + Math.round(Math.pow(10.0d, strValueOf.length() - 1)) + "..." + str + Math.round(Math.pow(10.0d, strValueOf.length()) - 1.0d);
    }

    public final void zzb(zzek zzekVar, String str) {
        zzR("Discarding hit. ".concat(str), zzekVar != null ? zzekVar.toString() : "no hit data");
    }

    @Override // com.google.android.gms.internal.gtm.zzbr
    public final void zzd() {
        synchronized (zzeo.class) {
            zza = this;
        }
    }

    public final synchronized void zze(int i, String str, Object obj, Object obj2, Object obj3) {
        char c;
        try {
            vp7.p(str);
            if (zzw().zzb()) {
                zzw();
                c = 'C';
            } else {
                zzw();
                c = 'c';
            }
            String strSubstring = "3" + "01VDIWEA?".charAt(i) + c + zzbs.zza + ":" + zzbq.zzD(str, zzf(obj), zzf(obj2), zzf(obj3));
            if (strSubstring.length() > 1024) {
                strSubstring = strSubstring.substring(0, 1024);
            }
            zzeu zzeuVarZzp = zzt().zzp();
            if (zzeuVarZzp != null) {
                zzeuVarZzp.zze().zzc(strSubstring);
            }
        } catch (Throwable th) {
            throw th;
        }
    }
}
