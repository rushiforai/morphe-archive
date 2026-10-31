package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzagt extends zzatu implements zzavg {
    private static final zzagt zzb;
    private static volatile zzavn zze;

    static {
        zzagt zzagtVar = new zzagt();
        zzb = zzagtVar;
        zzatu.zzaE(zzagt.class, zzagtVar);
    }

    private zzagt() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        zzadu zzaduVar = null;
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0000", null);
        }
        if (i11 == 3) {
            return new zzagt();
        }
        if (i11 == 4) {
            return new zzags(zzaduVar);
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
        synchronized (zzagt.class) {
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
