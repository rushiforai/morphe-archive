package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzaeg extends zzatu implements zzavg {
    private static final zzaua zzb = new zzaed();
    private static final zzaeg zze;
    private static volatile zzavn zzf;
    private int zzg;
    private zzatz zzh = zzatu.zzau();
    private int zzi;

    static {
        zzaeg zzaegVar = new zzaeg();
        zze = zzaegVar;
        zzatu.zzaE(zzaeg.class, zzaegVar);
    }

    private zzaeg() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zze, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001ࠞ\u0002င\u0000", new Object[]{"zzg", "zzh", zzaee.zza, "zzi"});
        }
        if (i11 == 3) {
            return new zzaeg();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzaef(zzaduVar);
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
        synchronized (zzaeg.class) {
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
