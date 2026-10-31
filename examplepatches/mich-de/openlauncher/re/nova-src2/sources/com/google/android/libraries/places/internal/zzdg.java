package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzdg extends zzatu implements zzavg {
    private static final zzdg zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private int zzh;
    private int zzi;
    private int zzj;
    private float zzk;
    private int zzl;
    private int zzm;
    private float zzn;
    private int zzo;
    private int zzp;
    private float zzq;
    private int zzr;
    private float zzs;
    private int zzt;
    private int zzu;
    private float zzv;
    private int zzw;

    static {
        zzdg zzdgVar = new zzdg();
        zzb = zzdgVar;
        zzatu.zzaE(zzdg.class, zzdgVar);
    }

    private zzdg() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0011\u0000\u0001\u0001\u0011\u0011\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003᠌\u0002\u0004င\u0003\u0005ခ\u0004\u0006င\u0005\u0007င\u0006\bခ\u0007\tင\b\nင\t\u000bခ\n\fင\u000b\rခ\f\u000eင\r\u000fင\u000e\u0010ခ\u000f\u0011င\u0010", new Object[]{"zzf", "zzg", zzcr.zza(), "zzh", zzcu.zza(), "zzi", zzaxj.zza(), "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", "zzt", "zzu", "zzv", "zzw"});
        }
        if (i11 == 3) {
            return new zzdg();
        }
        zzde zzdeVar = null;
        if (i11 == 4) {
            return new zzdf(zzdeVar);
        }
        if (i11 == 5) {
            return zzb;
        }
        if (i11 != 6) {
            return null;
        }
        zzavn zzavnVar = zze;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzdg.class) {
            try {
                zzatpVar = zze;
                if (zzatpVar == null) {
                    zzatpVar = new zzatp(zzb);
                    zze = zzatpVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return zzatpVar;
    }
}
