package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzyw extends zzatu implements zzavg {
    private static final zzyw zzb;
    private static volatile zzavn zze;
    private int zzf;
    private long zzg;
    private long zzh;
    private zzauc zzi = zzatu.zzax();
    private zzauc zzj = zzatu.zzax();
    private zzauc zzk = zzatu.zzax();
    private zzauc zzl = zzatu.zzax();
    private zzzf zzm;
    private zzzf zzn;
    private zzzf zzo;
    private zzzf zzp;

    static {
        zzyw zzywVar = new zzyw();
        zzb = zzywVar;
        zzatu.zzaE(zzyw.class, zzywVar);
    }

    private zzyw() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\n\u0000\u0001\u0001\n\n\u0000\u0004\u0000\u0001ဂ\u0000\u0002ဂ\u0001\u0003\u001b\u0004\u001b\u0005\u001b\u0006\u001b\u0007ဉ\u0002\bဉ\u0003\tဉ\u0004\nဉ\u0005", new Object[]{"zzf", "zzg", "zzh", "zzi", zzyy.class, "zzj", zzyy.class, "zzk", zzyy.class, "zzl", zzyy.class, "zzm", "zzn", "zzo", "zzp"});
        }
        if (i11 == 3) {
            return new zzyw();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzyv(zzwvVar);
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
        synchronized (zzyw.class) {
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
