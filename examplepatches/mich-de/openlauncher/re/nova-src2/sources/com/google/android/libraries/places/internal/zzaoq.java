package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzaoq extends zzatu implements zzavg {
    private static final zzaoq zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzaxs zzg;
    private zzaxs zzh;
    private zzaqe zzi;
    private zzauc zzj = zzatu.zzax();

    static {
        zzaoq zzaoqVar = new zzaoq();
        zzb = zzaoqVar;
        zzatu.zzaE(zzaoq.class, zzaoqVar);
    }

    private zzaoq() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0001\u0000\u0001ဉ\u0000\u0002ဉ\u0002\u0003ဉ\u0001\u0004\u001b", new Object[]{"zzf", "zzg", "zzi", "zzh", "zzj", zzamt.class});
        }
        if (i11 == 3) {
            return new zzaoq();
        }
        zzaok zzaokVar = null;
        if (i11 == 4) {
            return new zzaop(zzaokVar);
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
        synchronized (zzaoq.class) {
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
