package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzuu extends zzatu implements zzavg {
    private static final zzuu zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private zzst zzh;

    static {
        zzuu zzuuVar = new zzuu();
        zzb = zzuuVar;
        zzatu.zzaE(zzuu.class, zzuuVar);
    }

    private zzuu() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001င\u0000\u0002ဉ\u0001", new Object[]{"zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new zzuu();
        }
        zzup zzupVar = null;
        if (i11 == 4) {
            return new zzut(zzupVar);
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
        synchronized (zzuu.class) {
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
