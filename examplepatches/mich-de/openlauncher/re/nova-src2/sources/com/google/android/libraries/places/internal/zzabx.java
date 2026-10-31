package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzabx extends zzatu implements zzavg {
    private static final zzabx zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private boolean zzh;
    private long zzi;

    static {
        zzabx zzabxVar = new zzabx();
        zzb = zzabxVar;
        zzatu.zzaE(zzabx.class, zzabxVar);
    }

    private zzabx() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001᠌\u0000\u0002ဇ\u0001\u0003ဂ\u0002", new Object[]{"zzf", "zzg", zzabw.zza, "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new zzabx();
        }
        zzabf zzabfVar = null;
        if (i11 == 4) {
            return new zzabv(zzabfVar);
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
        synchronized (zzabx.class) {
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
