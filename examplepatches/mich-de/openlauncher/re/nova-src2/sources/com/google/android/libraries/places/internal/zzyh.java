package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzyh extends zzatu implements zzavg {
    private static final zzyh zzb;
    private static volatile zzavn zze;
    private zzwz zzB;
    private int zzf;
    private long zzg;
    private long zzj;
    private long zzk;
    private long zzl;
    private int zzm;
    private int zzn;
    private long zzo;
    private long zzp;
    private int zzq;
    private int zzr;
    private long zzs;
    private zzxi zzt;
    private long zzu;
    private zzzf zzx;
    private zzzf zzy;
    private zzauc zzh = zzatu.zzax();
    private zzauc zzi = zzatu.zzax();
    private zzauc zzv = zzatu.zzax();
    private zzauc zzw = zzatu.zzax();
    private zzauc zzz = zzatu.zzax();
    private zzauc zzA = zzatu.zzax();

    static {
        zzyh zzyhVar = new zzyh();
        zzb = zzyhVar;
        zzatu.zzaE(zzyh.class, zzyhVar);
    }

    private zzyh() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0016\u0000\u0001\u0001\u0019\u0016\u0000\u0006\u0000\u0001စ\u0000\u0003\u001b\u0004\u001b\u0005ဂ\u0001\u0006ဂ\u0002\u0007ဂ\u0003\bင\u0004\tင\u0005\nဂ\u0006\u000bဂ\u0007\fင\b\rင\t\u000eဂ\n\u000fဉ\u000b\u0010ဂ\f\u0011\u001b\u0012\u001b\u0013ဉ\r\u0014ဉ\u000e\u0015\u001b\u0016\u001b\u0019ဉ\u000f", new Object[]{"zzf", "zzg", "zzh", zzyo.class, "zzi", zzyq.class, "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", "zzt", "zzu", "zzv", zzyy.class, "zzw", zzyy.class, "zzx", "zzy", "zzz", zzyf.class, "zzA", zzyf.class, "zzB"});
        }
        if (i11 == 3) {
            return new zzyh();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzyg(zzwvVar);
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
        synchronized (zzyh.class) {
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
