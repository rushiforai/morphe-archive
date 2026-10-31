package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzu extends zzatu implements zzavg {
    private static final zzu zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzcd zzg;
    private int zzh;
    private long zzi;
    private int zzj;
    private int zzk;
    private long zzl;
    private long zzm;
    private long zzn;
    private float zzo;
    private long zzp;
    private int zzq;
    private boolean zzr;
    private int zzs;
    private zzauc zzt = zzatu.zzax();
    private zzauc zzu = zzatu.zzax();
    private int zzv;
    private int zzw;
    private long zzx;

    static {
        zzu zzuVar = new zzu();
        zzb = zzuVar;
        zzatu.zzaE(zzu.class, zzuVar);
    }

    private zzu() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0012\u0000\u0001\u0001\u0012\u0012\u0000\u0002\u0000\u0001ဉ\u0000\u0002᠌\u0001\u0003ဂ\u0002\u0004᠌\u0003\u0005᠌\u0004\u0006ဂ\u0005\u0007ဂ\u0006\bဂ\u0007\tခ\b\nဂ\t\u000bင\n\fဇ\u000b\r᠌\f\u000e\u001b\u000f\u001b\u0010င\r\u0011င\u000e\u0012ဂ\u000f", new Object[]{"zzf", "zzg", "zzh", zzt.zza, "zzi", "zzj", zzas.zza, "zzk", zzm.zza, "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", zzab.zza, "zzt", zzar.class, "zzu", zzar.class, "zzv", "zzw", "zzx"});
        }
        if (i11 == 3) {
            return new zzu();
        }
        zza zzaVar = null;
        if (i11 == 4) {
            return new zzs(zzaVar);
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
        synchronized (zzu.class) {
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
