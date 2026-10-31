package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzagr extends zzatu implements zzavg {
    private static final zzagr zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzwd zzg;
    private byte zzh = 2;

    static {
        zzagr zzagrVar = new zzagr();
        zzb = zzagrVar;
        zzatu.zzaE(zzagr.class, zzagrVar);
    }

    private zzagr() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return Byte.valueOf(this.zzh);
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0001\u0001ᐉ\u0000", new Object[]{"zzf", "zzg"});
        }
        if (i11 == 3) {
            return new zzagr();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzagq(zzaduVar);
        }
        if (i11 == 5) {
            return zzb;
        }
        if (i11 != 6) {
            this.zzh = obj == null ? (byte) 0 : (byte) 1;
            return null;
        }
        zzavn zzavnVar = zze;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzagr.class) {
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
