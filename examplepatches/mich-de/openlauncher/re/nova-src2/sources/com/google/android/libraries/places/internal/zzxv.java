package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzxv extends zzatu implements zzavg {
    private static final zzxv zzb;
    private static volatile zzavn zze;
    private int zzf;
    private long zzg;
    private zzxd zzh;
    private long zzi;
    private int zzj;
    private boolean zzk;

    static {
        zzxv zzxvVar = new zzxv();
        zzb = zzxvVar;
        zzatu.zzaE(zzxv.class, zzxvVar);
    }

    private zzxv() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001စ\u0000\u0002ဉ\u0001\u0003ဂ\u0002\u0004င\u0003\u0005ဇ\u0004", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk"});
        }
        if (i11 == 3) {
            return new zzxv();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzxu(zzwvVar);
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
        synchronized (zzxv.class) {
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
