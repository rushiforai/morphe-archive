package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzdu extends zzatu implements zzavg {
    private static final zzdu zzb;
    private static volatile zzavn zze;
    private float zzA;
    private float zzB;
    private float zzC;
    private float zzD;
    private boolean zzE;
    private int zzF;
    private int zzf;
    private float zzg;
    private float zzh;
    private float zzi;
    private float zzj;
    private float zzk;
    private float zzl;
    private float zzm;
    private float zzn;
    private float zzo;
    private float zzp;
    private float zzq;
    private float zzr;
    private int zzs;
    private int zzt;
    private int zzu;
    private float zzv;
    private float zzw;
    private float zzx;
    private float zzy;
    private float zzz;

    static {
        zzdu zzduVar = new zzdu();
        zzb = zzduVar;
        zzatu.zzaE(zzdu.class, zzduVar);
    }

    private zzdu() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u001a\u0000\u0001\u0001\u001a\u001a\u0000\u0000\u0000\u0001ခ\u0000\u0002ခ\u0001\u0003ခ\u0002\u0004ခ\u0003\u0005ခ\u0004\u0006ခ\u0005\u0007ခ\u0006\bခ\u0007\tခ\b\nခ\t\u000bခ\n\fခ\u000b\rင\f\u000eင\r\u000fင\u000e\u0010ခ\u000f\u0011ခ\u0010\u0012ခ\u0011\u0013ခ\u0012\u0014ခ\u0013\u0015ခ\u0014\u0016ခ\u0015\u0017ခ\u0016\u0018ခ\u0017\u0019ဇ\u0018\u001aင\u0019", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", "zzt", "zzu", "zzv", "zzw", "zzx", "zzy", "zzz", "zzA", "zzB", "zzC", "zzD", "zzE", "zzF"});
        }
        if (i11 == 3) {
            return new zzdu();
        }
        zzds zzdsVar = null;
        if (i11 == 4) {
            return new zzdt(zzdsVar);
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
        synchronized (zzdu.class) {
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
