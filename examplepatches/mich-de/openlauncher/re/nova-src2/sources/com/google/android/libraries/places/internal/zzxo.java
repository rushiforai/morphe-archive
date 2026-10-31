package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzxo extends zzatu implements zzavg {
    private static final zzxo zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private int zzh;
    private long zzi;
    private int zzj;
    private boolean zzk;
    private long zzl;
    private zzst zzm;
    private zzauc zzn = zzatu.zzax();

    static {
        zzxo zzxoVar = new zzxo();
        zzb = zzxoVar;
        zzatu.zzaE(zzxo.class, zzxoVar);
    }

    private zzxo() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\b\u0000\u0001\u0001\b\b\u0000\u0001\u0000\u0001င\u0000\u0002င\u0001\u0003ဂ\u0002\u0004င\u0003\u0005ဇ\u0004\u0006ဂ\u0005\u0007ဉ\u0006\b\u001b", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", zzst.class});
        }
        if (i11 == 3) {
            return new zzxo();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzxn(zzwvVar);
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
        synchronized (zzxo.class) {
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
