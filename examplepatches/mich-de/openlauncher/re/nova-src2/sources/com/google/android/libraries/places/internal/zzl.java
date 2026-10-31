package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzl extends zzatu implements zzavg {
    private static final zzl zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzcd zzg;
    private long zzh;
    private int zzi;
    private boolean zzj;
    private zzar zzk;

    static {
        zzl zzlVar = new zzl();
        zzb = zzlVar;
        zzatu.zzaE(zzl.class, zzlVar);
    }

    private zzl() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဂ\u0001\u0003᠌\u0002\u0004ဇ\u0003\u0005ဉ\u0004", new Object[]{"zzf", "zzg", "zzh", "zzi", zzm.zza, "zzj", "zzk"});
        }
        if (i11 == 3) {
            return new zzl();
        }
        zza zzaVar = null;
        if (i11 == 4) {
            return new zzk(zzaVar);
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
        synchronized (zzl.class) {
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
