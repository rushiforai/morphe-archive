package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzym extends zzatu implements zzavg {
    private static final zzym zzb;
    private static volatile zzavn zze;
    private int zzf;
    private long zzg;
    private int zzh;
    private int zzi;
    private float zzj;
    private float zzk;

    static {
        zzym zzymVar = new zzym();
        zzb = zzymVar;
        zzatu.zzaE(zzym.class, zzymVar);
    }

    private zzym() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001စ\u0000\u0002င\u0001\u0003င\u0002\u0004ခ\u0003\u0005ခ\u0004", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk"});
        }
        if (i11 == 3) {
            return new zzym();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzyl(zzwvVar);
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
        synchronized (zzym.class) {
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
