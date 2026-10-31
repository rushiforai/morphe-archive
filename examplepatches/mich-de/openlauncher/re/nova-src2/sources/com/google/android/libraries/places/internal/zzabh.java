package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzabh extends zzatu implements zzavg {
    private static final zzabh zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;

    static {
        zzabh zzabhVar = new zzabh();
        zzb = zzabhVar;
        zzatu.zzaE(zzabh.class, zzabhVar);
    }

    private zzabh() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001င\u0000", new Object[]{"zzf", "zzg"});
        }
        if (i11 == 3) {
            return new zzabh();
        }
        zzabf zzabfVar = null;
        if (i11 == 4) {
            return new zzabg(zzabfVar);
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
        synchronized (zzabh.class) {
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
