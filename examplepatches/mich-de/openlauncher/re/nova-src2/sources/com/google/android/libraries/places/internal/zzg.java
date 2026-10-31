package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzg extends zzatu implements zzavg {
    private static final zzg zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzcd zzg;
    private long zzh;
    private long zzi;
    private int zzj;
    private int zzk;
    private boolean zzl;
    private long zzm;
    private boolean zzn;
    private zzar zzo;

    static {
        zzg zzgVar = new zzg();
        zzb = zzgVar;
        zzatu.zzaE(zzg.class, zzgVar);
    }

    private zzg() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\t\u0000\u0001\u0001\t\t\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဂ\u0001\u0003ဂ\u0002\u0004᠌\u0003\u0005᠌\u0004\u0006ဇ\u0005\u0007ဂ\u0006\bဇ\u0007\tဉ\b", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", zzas.zza, "zzk", zzm.zza, "zzl", "zzm", "zzn", "zzo"});
        }
        if (i11 == 3) {
            return new zzg();
        }
        zza zzaVar = null;
        if (i11 == 4) {
            return new zzf(zzaVar);
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
        synchronized (zzg.class) {
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
