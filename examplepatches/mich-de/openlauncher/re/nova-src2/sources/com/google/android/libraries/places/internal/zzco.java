package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzco extends zzatu implements zzavg {
    private static final zzco zzb;
    private static volatile zzavn zze;
    private int zzf;
    private double zzg = 1.0d;
    private double zzh = 1.0d;

    static {
        zzco zzcoVar = new zzco();
        zzb = zzcoVar;
        zzatu.zzaE(zzco.class, zzcoVar);
    }

    private zzco() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001က\u0000\u0002က\u0001", new Object[]{"zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new zzco();
        }
        zzcm zzcmVar = null;
        if (i11 == 4) {
            return new zzcn(zzcmVar);
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
        synchronized (zzco.class) {
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
