package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzaid extends zzatu implements zzavg {
    private static final zzaid zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private boolean zzi;
    private double zzj;
    private int zzk;
    private boolean zzm;
    private zzaho zzn;
    private String zzh = b.f42142b;
    private zzatz zzl = zzatu.zzau();

    static {
        zzaid zzaidVar = new zzaid();
        zzb = zzaidVar;
        zzatu.zzaE(zzaid.class, zzaidVar);
    }

    private zzaid() {
    }

    public static zzaib zza() {
        return (zzaib) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzaid zzaidVar, String str) {
        zzaidVar.zzf |= 2;
        zzaidVar.zzh = str;
    }

    public static /* synthetic */ void zze(zzaid zzaidVar, boolean z11) {
        zzaidVar.zzf |= 4;
        zzaidVar.zzi = z11;
    }

    public static /* synthetic */ void zzf(zzaid zzaidVar, double d5) {
        zzaidVar.zzf |= 8;
        zzaidVar.zzj = d5;
    }

    public static /* synthetic */ void zzg(zzaid zzaidVar, int i5) {
        zzaidVar.zzf |= 16;
        zzaidVar.zzk = i5;
    }

    public static /* synthetic */ void zzh(zzaid zzaidVar, Iterable iterable) {
        zzatz zzatzVar = zzaidVar.zzl;
        if (!zzatzVar.zzc()) {
            zzaidVar.zzl = zzatu.zzav(zzatzVar);
        }
        zzart.zzam(iterable, zzaidVar.zzl);
    }

    public static /* synthetic */ void zzi(zzaid zzaidVar, boolean z11) {
        zzaidVar.zzf |= 32;
        zzaidVar.zzm = z11;
    }

    public static /* synthetic */ void zzj(zzaid zzaidVar, zzaho zzahoVar) {
        zzahoVar.getClass();
        zzaidVar.zzn = zzahoVar;
        zzaidVar.zzf |= 64;
    }

    public static /* synthetic */ void zzk(zzaid zzaidVar, int i5) {
        zzaidVar.zzg = i5 - 1;
        zzaidVar.zzf |= 1;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\b\u0000\u0001\u0001\b\b\u0000\u0001\u0000\u0001᠌\u0000\u0002ဈ\u0001\u0003ဇ\u0002\u0004က\u0003\u0005င\u0004\u0006'\u0007ဇ\u0005\bဉ\u0006", new Object[]{"zzf", "zzg", zzaic.zza, "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn"});
        }
        if (i11 == 3) {
            return new zzaid();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzaib(zzaduVar);
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
        synchronized (zzaid.class) {
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
