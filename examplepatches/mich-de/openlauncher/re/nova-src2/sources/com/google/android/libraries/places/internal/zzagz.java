package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzagz extends zzatu implements zzavg {
    private static final zzaua zzb = new zzagx();
    private static final zzagz zze;
    private static volatile zzavn zzf;
    private zzatz zzg = zzatu.zzau();

    static {
        zzagz zzagzVar = new zzagz();
        zze = zzagzVar;
        zzatu.zzaE(zzagz.class, zzagzVar);
    }

    private zzagz() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zze, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001ࠞ", new Object[]{"zzg", zzajd.zza});
        }
        if (i11 == 3) {
            return new zzagz();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzagy(zzaduVar);
        }
        if (i11 == 5) {
            return zze;
        }
        if (i11 != 6) {
            return null;
        }
        zzavn zzavnVar = zzf;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzagz.class) {
            try {
                zzatpVar = zzf;
                if (zzatpVar == null) {
                    zzatpVar = new zzatp(zze);
                    zzf = zzatpVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return zzatpVar;
    }
}
