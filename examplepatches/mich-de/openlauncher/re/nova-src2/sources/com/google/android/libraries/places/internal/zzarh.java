package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzarh extends zzatu implements zzavg {
    private static final zzaua zzb = new zzarf();
    private static final zzarh zze;
    private static volatile zzavn zzf;
    private double zzg;
    private zzatz zzh = zzatu.zzau();
    private zzauc zzi = zzatu.zzax();

    static {
        zzarh zzarhVar = new zzarh();
        zze = zzarhVar;
        zzatu.zzaE(zzarh.class, zzarhVar);
    }

    private zzarh() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zze, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0002\u0000\u0001\u0000\u0002,\u0003Ț", new Object[]{"zzg", "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new zzarh();
        }
        zzard zzardVar = null;
        if (i11 == 4) {
            return new zzarg(zzardVar);
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
        synchronized (zzarh.class) {
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
