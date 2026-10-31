package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzyy extends zzatu implements zzavg {
    private static final zzyy zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private float zzh;
    private int zzi;
    private float zzj;
    private int zzk;

    static {
        zzyy zzyyVar = new zzyy();
        zzb = zzyyVar;
        zzatu.zzaE(zzyy.class, zzyyVar);
    }

    private zzyy() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001င\u0000\u0002ခ\u0001\u0003င\u0002\u0004ခ\u0003\u0005င\u0004", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk"});
        }
        if (i11 == 3) {
            return new zzyy();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzyx(zzwvVar);
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
        synchronized (zzyy.class) {
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
