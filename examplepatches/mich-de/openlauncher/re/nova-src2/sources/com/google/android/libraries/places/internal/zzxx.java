package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzxx extends zzatu implements zzavg {
    private static final zzxx zzb;
    private static volatile zzavn zze;
    private int zzf;
    private long zzg;
    private int zzh;
    private float zzi;
    private int zzj;
    private float zzk;
    private float zzl;

    static {
        zzxx zzxxVar = new zzxx();
        zzb = zzxxVar;
        zzatu.zzaE(zzxx.class, zzxxVar);
    }

    private zzxx() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001စ\u0000\u0002င\u0001\u0003ခ\u0002\u0004င\u0003\u0005ခ\u0004\u0006ခ\u0005", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl"});
        }
        if (i11 == 3) {
            return new zzxx();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzxw(zzwvVar);
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
        synchronized (zzxx.class) {
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
