package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzant extends zzatu implements zzavg {
    private static final zzant zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private zzaxv zzh;
    private zzawl zzi;

    static {
        zzant zzantVar = new zzant();
        zzb = zzantVar;
        zzatu.zzaE(zzant.class, zzantVar);
    }

    private zzant() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\f\u0002ဉ\u0000\u0003ဉ\u0001", new Object[]{"zzf", "zzg", "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new zzant();
        }
        zzanq zzanqVar = null;
        if (i11 == 4) {
            return new zzans(zzanqVar);
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
        synchronized (zzant.class) {
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
