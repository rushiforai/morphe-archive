package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzal extends zzatu implements zzavg {
    private static final zzal zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private long zzh;
    private long zzi;
    private long zzj;
    private float zzk;
    private boolean zzl;
    private zzauc zzm = zzatu.zzax();
    private zzauc zzn = zzatu.zzax();
    private zzauc zzo = zzatu.zzax();
    private int zzp;
    private int zzq;
    private int zzr;
    private int zzs;
    private int zzt;
    private int zzu;
    private long zzv;

    static {
        zzal zzalVar = new zzal();
        zzb = zzalVar;
        zzatu.zzaE(zzal.class, zzalVar);
    }

    private zzal() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0010\u0000\u0001\u0001\u0010\u0010\u0000\u0003\u0000\u0001᠌\u0000\u0002ဂ\u0001\u0003ဂ\u0002\u0004ဂ\u0003\u0005ခ\u0004\u0006ဇ\u0005\u0007\u001a\b\u001b\t\u001b\nင\u0006\u000bဂ\f\fင\u000b\rင\u0007\u000eင\b\u000fင\t\u0010င\n", new Object[]{"zzf", "zzg", zzas.zza, "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", zzar.class, "zzo", zzar.class, "zzp", "zzv", "zzu", "zzq", "zzr", "zzs", "zzt"});
        }
        if (i11 == 3) {
            return new zzal();
        }
        zzaj zzajVar = null;
        if (i11 == 4) {
            return new zzak(zzajVar);
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
        synchronized (zzal.class) {
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
