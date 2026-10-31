package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzar extends zzatu implements zzavg {
    private static final zzar zzb;
    private static volatile zzavn zze;
    private boolean zzA;
    private boolean zzB;
    private int zzf;
    private boolean zzg;
    private long zzh;
    private long zzi;
    private int zzj;
    private float zzk;
    private float zzl;
    private boolean zzm;
    private float zzn;
    private double zzo;
    private int zzp;
    private long zzq;
    private float zzr;
    private float zzs;
    private float zzt;
    private float zzu;
    private float zzv;
    private float zzw;
    private float zzx;
    private float zzy;
    private boolean zzz;

    static {
        zzar zzarVar = new zzar();
        zzb = zzarVar;
        zzatu.zzaE(zzar.class, zzarVar);
    }

    private zzar() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            zzaty zzatyVar = zzaq.zza;
            return zzatu.zzaB(zzb, "\u0001\u0016\u0000\u0001\u0001\u0016\u0016\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဂ\u0001\u0003ဂ\u0002\u0004᠌\u0003\u0005ခ\u0004\u0006ခ\u0005\u0007ဇ\u0006\bခ\u0007\tက\b\n᠌\t\u000bဂ\n\fခ\u000b\rခ\f\u000eခ\r\u000fခ\u000e\u0010ခ\u000f\u0011ခ\u0010\u0012ခ\u0011\u0013ခ\u0012\u0014ဇ\u0013\u0015ဇ\u0014\u0016ဇ\u0015", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", zzatyVar, "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", zzatyVar, "zzq", "zzr", "zzs", "zzt", "zzu", "zzv", "zzw", "zzx", "zzy", "zzz", "zzA", "zzB"});
        }
        if (i11 == 3) {
            return new zzar();
        }
        zzao zzaoVar = null;
        if (i11 == 4) {
            return new zzap(zzaoVar);
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
        synchronized (zzar.class) {
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
