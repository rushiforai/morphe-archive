package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzzb extends zzatu implements zzavg {
    private static final zzzb zzb;
    private static volatile zzavn zze;
    private int zzA;
    private float zzB;
    private boolean zzC;
    private int zzf;
    private int zzg;
    private boolean zzh;
    private boolean zzi;
    private float zzj;
    private float zzk;
    private boolean zzl;
    private boolean zzm;
    private boolean zzn;
    private boolean zzo;
    private int zzp;
    private int zzq;
    private boolean zzr;
    private int zzs;
    private float zzt;
    private int zzu;
    private int zzv;
    private int zzw;
    private int zzx;
    private int zzy;
    private zzauc zzz = zzatu.zzax();

    static {
        zzzb zzzbVar = new zzzb();
        zzb = zzzbVar;
        zzatu.zzaE(zzzb.class, zzzbVar);
    }

    private zzzb() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            zzaty zzatyVar = zzza.zza;
            zzaty zzatyVar2 = zzun.zza;
            return zzatu.zzaB(zzb, "\u0001\u0017\u0000\u0001\u0001\u0017\u0017\u0000\u0001\u0000\u0001င\u0000\u0002ဇ\u0001\u0003ဇ\u0002\u0004ခ\u0003\u0005ခ\u0004\u0006ဇ\u0005\u0007ဇ\u0006\bဇ\u0007\tဇ\b\nင\t\u000bင\n\fဇ\u000b\r᠌\f\u000eခ\r\u000f᠌\u000e\u0010᠌\u000f\u0011᠌\u0010\u0012᠌\u0011\u0013᠌\u0012\u0014\u001b\u0015င\u0013\u0016ခ\u0014\u0017ဇ\u0015", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", zzatyVar, "zzt", "zzu", zzatyVar2, "zzv", zzatyVar2, "zzw", zzatyVar2, "zzx", zzatyVar2, "zzy", zzuo.zza, "zzz", zzyu.class, "zzA", "zzB", "zzC"});
        }
        if (i11 == 3) {
            return new zzzb();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzyz(zzwvVar);
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
        synchronized (zzzb.class) {
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
