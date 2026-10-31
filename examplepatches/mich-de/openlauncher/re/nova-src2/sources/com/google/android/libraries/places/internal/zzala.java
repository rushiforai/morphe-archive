package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzala extends zzatu implements zzavg {
    private static final zzala zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg = 1;
    private int zzh = 1;
    private int zzi;

    static {
        zzala zzalaVar = new zzala();
        zzb = zzalaVar;
        zzatu.zzaE(zzala.class, zzalaVar);
    }

    private zzala() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003င\u0002", new Object[]{"zzf", "zzg", zzakz.zza, "zzh", zzaky.zza, "zzi"});
        }
        if (i11 == 3) {
            return new zzala();
        }
        zzakw zzakwVar = null;
        if (i11 == 4) {
            return new zzakx(zzakwVar);
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
        synchronized (zzala.class) {
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
