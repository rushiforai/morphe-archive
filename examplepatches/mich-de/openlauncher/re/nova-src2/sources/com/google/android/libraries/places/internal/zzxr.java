package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzxr extends zzatu implements zzavg {
    private static final zzxr zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private long zzh;
    private zzxd zzi;
    private long zzj;
    private int zzk;
    private zzatz zzl = zzatu.zzau();
    private zzatz zzm = zzatu.zzau();
    private int zzn;

    static {
        zzxr zzxrVar = new zzxr();
        zzb = zzxrVar;
        zzatu.zzaE(zzxr.class, zzxrVar);
    }

    private zzxr() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\b\u0000\u0001\u0001\b\b\u0000\u0002\u0000\u0001᠌\u0000\u0002စ\u0001\u0003ဉ\u0002\u0004ဂ\u0003\u0005င\u0004\u0006\u0016\u0007\u0016\bင\u0005", new Object[]{"zzf", "zzg", zzxq.zza, "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn"});
        }
        if (i11 == 3) {
            return new zzxr();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzxp(zzwvVar);
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
        synchronized (zzxr.class) {
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
