package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzdd extends zzatu implements zzavg {
    private static final zzdd zzb;
    private static volatile zzavn zze;
    private int zzA;
    private float zzB;
    private int zzC;
    private float zzD;
    private float zzE;
    private int zzf;
    private int zzg;
    private int zzh;
    private int zzi;
    private int zzj;
    private int zzk;
    private float zzl;
    private int zzm;
    private int zzn;
    private float zzo;
    private int zzp;
    private int zzq;
    private int zzr;
    private int zzs;
    private float zzt;
    private float zzu;
    private float zzv;
    private int zzw;
    private float zzx;
    private int zzy;
    private int zzz;

    static {
        zzdd zzddVar = new zzdd();
        zzb = zzddVar;
        zzatu.zzaE(zzdd.class, zzddVar);
    }

    private zzdd() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0019\u0000\u0001\u0001\u0019\u0019\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003᠌\u0002\u0004᠌\u0003\u0005င\u0004\u0006ခ\u0005\u0007င\u0006\bင\u0007\tခ\b\nင\t\u000bင\n\fင\u000b\rင\f\u000eခ\r\u000fခ\u000e\u0010ခ\u000f\u0011င\u0010\u0012ခ\u0011\u0013င\u0012\u0014င\u0013\u0015င\u0014\u0016ခ\u0015\u0017င\u0016\u0018ခ\u0017\u0019ခ\u0018", new Object[]{"zzf", "zzg", zzcr.zza(), "zzh", zzcu.zza(), "zzi", zzdc.zza, "zzj", zzdb.zza, "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", "zzt", "zzu", "zzv", "zzw", "zzx", "zzy", "zzz", "zzA", "zzB", "zzC", "zzD", "zzE"});
        }
        if (i11 == 3) {
            return new zzdd();
        }
        zzcz zzczVar = null;
        if (i11 == 4) {
            return new zzda(zzczVar);
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
        synchronized (zzdd.class) {
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
