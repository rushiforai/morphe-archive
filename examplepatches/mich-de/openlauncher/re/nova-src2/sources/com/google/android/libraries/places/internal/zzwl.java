package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzwl extends zzatu implements zzavg {
    private static final zzwl zzb;
    private static volatile zzavn zze;
    private int zzA;
    private int zzf;
    private int zzg;
    private int zzh;
    private int zzi;
    private int zzj;
    private int zzk;
    private int zzl;
    private int zzm;
    private int zzn;
    private int zzo;
    private int zzp;
    private int zzq;
    private int zzr;
    private int zzs;
    private int zzt;
    private int zzu;
    private zzws zzv;
    private zzwu zzw;
    private zzwi zzx;
    private zzwn zzy;
    private zzwp zzz;

    static {
        zzwl zzwlVar = new zzwl();
        zzb = zzwlVar;
        zzatu.zzaE(zzwl.class, zzwlVar);
    }

    private zzwl() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0015\u0000\u0001\u0001\u0015\u0015\u0000\u0000\u0000\u0001ဋ\u0001\u0002ဋ\u0002\u0003ဋ\u0003\u0004ဋ\u0004\u0005ဋ\u0005\u0006ဋ\u0006\u0007ဋ\u0007\bဋ\b\tဋ\t\nဋ\n\u000bဋ\u000b\fဋ\f\rဋ\r\u000eဋ\u000e\u000fဉ\u000f\u0010ဋ\u0000\u0011ဉ\u0010\u0012ဉ\u0011\u0013ဉ\u0012\u0014ဉ\u0013\u0015᠌\u0014", new Object[]{"zzf", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", "zzt", "zzu", "zzv", "zzg", "zzw", "zzx", "zzy", "zzz", "zzA", zzwk.zza});
        }
        if (i11 == 3) {
            return new zzwl();
        }
        zzwg zzwgVar = null;
        if (i11 == 4) {
            return new zzwj(zzwgVar);
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
        synchronized (zzwl.class) {
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
