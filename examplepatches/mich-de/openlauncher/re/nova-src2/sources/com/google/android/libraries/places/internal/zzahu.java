package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzahu extends zzatu implements zzavg {
    private static final zzahu zzb;
    private static volatile zzavn zze;
    private zzaig zzA;
    private zzagp zzB;
    private int zzf;
    private int zzg;
    private zzafe zzj;
    private zzaij zzk;
    private zzagr zzl;
    private zzafo zzm;
    private zzagp zzn;
    private zzafq zzo;
    private zzagn zzp;
    private zzail zzq;
    private zzail zzr;
    private zzagt zzs;
    private zzaga zzt;
    private zzahw zzu;
    private zzahy zzv;
    private zzahj zzw;
    private zzagz zzx;
    private zzaia zzy;
    private zzaid zzz;
    private byte zzC = 2;
    private String zzh = b.f42142b;
    private String zzi = b.f42142b;

    static {
        zzahu zzahuVar = new zzahu();
        zzb = zzahuVar;
        zzatu.zzaE(zzahu.class, zzahuVar);
    }

    private zzahu() {
    }

    public static zzahs zza() {
        return (zzahs) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzahu zzahuVar, String str) {
        str.getClass();
        zzahuVar.zzf |= 2;
        zzahuVar.zzh = str;
    }

    public static /* synthetic */ void zze(zzahu zzahuVar, String str) {
        str.getClass();
        zzahuVar.zzf |= 4;
        zzahuVar.zzi = str;
    }

    public static /* synthetic */ void zzf(zzahu zzahuVar, zzagp zzagpVar) {
        zzagpVar.getClass();
        zzahuVar.zzn = zzagpVar;
        zzahuVar.zzf |= 128;
    }

    public static /* synthetic */ void zzg(zzahu zzahuVar, zzafq zzafqVar) {
        zzafqVar.getClass();
        zzahuVar.zzo = zzafqVar;
        zzahuVar.zzf |= 256;
    }

    public static /* synthetic */ void zzh(zzahu zzahuVar, zzaid zzaidVar) {
        zzaidVar.getClass();
        zzahuVar.zzz = zzaidVar;
        zzahuVar.zzf |= 524288;
    }

    public static /* synthetic */ void zzi(zzahu zzahuVar, zzaig zzaigVar) {
        zzaigVar.getClass();
        zzahuVar.zzA = zzaigVar;
        zzahuVar.zzf |= 1048576;
    }

    public static /* synthetic */ void zzj(zzahu zzahuVar, zzagp zzagpVar) {
        zzagpVar.getClass();
        zzahuVar.zzB = zzagpVar;
        zzahuVar.zzf |= 2097152;
    }

    public static /* synthetic */ void zzk(zzahu zzahuVar, int i5) {
        zzahuVar.zzg = i5 - 1;
        zzahuVar.zzf |= 1;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return Byte.valueOf(this.zzC);
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0016\u0000\u0001\u0001\u0016\u0016\u0000\u0000\u0004\u0001᠌\u0000\u0002ဈ\u0001\u0003ဈ\u0002\u0004ဉ\u0003\u0005ᐉ\u0004\u0006ᐉ\u0005\u0007ᐉ\u0006\bဉ\u0007\tᐉ\b\nဉ\t\u000bဉ\u000b\fဉ\n\rဉ\f\u000eဉ\r\u000fဉ\u000e\u0010ဉ\u000f\u0011ဉ\u0010\u0012ဉ\u0011\u0013ဉ\u0012\u0014ဉ\u0013\u0015ဉ\u0014\u0016ဉ\u0015", new Object[]{"zzf", "zzg", zzaht.zza, "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzr", "zzq", "zzs", "zzt", "zzu", "zzv", "zzw", "zzx", "zzy", "zzz", "zzA", "zzB"});
        }
        if (i11 == 3) {
            return new zzahu();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzahs(zzaduVar);
        }
        if (i11 == 5) {
            return zzb;
        }
        if (i11 != 6) {
            this.zzC = obj == null ? (byte) 0 : (byte) 1;
            return null;
        }
        zzavn zzavnVar = zze;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzahu.class) {
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
