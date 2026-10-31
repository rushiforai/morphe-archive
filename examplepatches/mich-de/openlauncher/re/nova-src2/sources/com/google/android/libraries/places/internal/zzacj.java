package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzacj extends zzatu implements zzavg {
    private static final zzacj zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private int zzh;
    private int zzi;
    private int zzj;
    private zzadh zzk;
    private zzacr zzl;
    private zzadf zzm;
    private int zzn;
    private int zzo;

    static {
        zzacj zzacjVar = new zzacj();
        zzb = zzacjVar;
        zzatu.zzaE(zzacj.class, zzacjVar);
    }

    private zzacj() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\t\u0000\u0001\u0001\t\t\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003င\u0002\u0004᠌\u0003\u0005ဉ\u0004\u0006ဉ\u0005\u0007ဉ\u0006\b᠌\u0007\t᠌\b", new Object[]{"zzf", "zzg", zzacg.zza, "zzh", zzaci.zza, "zzi", "zzj", zzacf.zza, "zzk", "zzl", "zzm", "zzn", zzacd.zza, "zzo", zzach.zza});
        }
        if (i11 == 3) {
            return new zzacj();
        }
        zzabf zzabfVar = null;
        if (i11 == 4) {
            return new zzace(zzabfVar);
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
        synchronized (zzacj.class) {
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
