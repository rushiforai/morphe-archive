package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzzf extends zzatu implements zzavg {
    private static final zzzf zzb;
    private static volatile zzavn zze;
    private int zzf;
    private float zzg;
    private int zzh;

    static {
        zzzf zzzfVar = new zzzf();
        zzb = zzzfVar;
        zzatu.zzaE(zzzf.class, zzzfVar);
    }

    private zzzf() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ခ\u0000\u0002င\u0001", new Object[]{"zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new zzzf();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzze(zzwvVar);
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
        synchronized (zzzf.class) {
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
