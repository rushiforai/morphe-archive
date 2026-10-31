package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzul extends zzatu implements zzavg {
    private static final zzul zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private long zzh;
    private long zzi;

    static {
        zzul zzulVar = new zzul();
        zzb = zzulVar;
        zzatu.zzaE(zzul.class, zzulVar);
    }

    private zzul() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001᠌\u0000\u0002ဃ\u0001\u0003ဃ\u0002", new Object[]{"zzf", "zzg", zzuk.zza, "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new zzul();
        }
        zzug zzugVar = null;
        if (i11 == 4) {
            return new zzuj(zzugVar);
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
        synchronized (zzul.class) {
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
