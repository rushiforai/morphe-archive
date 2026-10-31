package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzvy extends zzatu implements zzavg {
    private static final zzvy zzb;
    private static volatile zzavn zze;
    private int zzf;
    private boolean zzg;
    private long zzh;

    static {
        zzvy zzvyVar = new zzvy();
        zzb = zzvyVar;
        zzatu.zzaE(zzvy.class, zzvyVar);
    }

    private zzvy() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဃ\u0001", new Object[]{"zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new zzvy();
        }
        zzvs zzvsVar = null;
        if (i11 == 4) {
            return new zzvx(zzvsVar);
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
        synchronized (zzvy.class) {
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
