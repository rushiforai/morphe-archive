package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzaig extends zzatu implements zzavg {
    private static final zzaig zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private zzauc zzh = zzatu.zzax();
    private zzauc zzi = zzatu.zzax();
    private zzauc zzj = zzatu.zzax();
    private zzauc zzk = zzatu.zzax();
    private int zzl;
    private zzaho zzm;

    static {
        zzaig zzaigVar = new zzaig();
        zzb = zzaigVar;
        zzatu.zzaE(zzaig.class, zzaigVar);
    }

    private zzaig() {
    }

    public static zzaie zza() {
        return (zzaie) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzaig zzaigVar, Iterable iterable) {
        zzauc zzaucVar = zzaigVar.zzh;
        if (!zzaucVar.zzc()) {
            zzaigVar.zzh = zzatu.zzay(zzaucVar);
        }
        zzart.zzam(iterable, zzaigVar.zzh);
    }

    public static /* synthetic */ void zze(zzaig zzaigVar, Iterable iterable) {
        zzauc zzaucVar = zzaigVar.zzi;
        if (!zzaucVar.zzc()) {
            zzaigVar.zzi = zzatu.zzay(zzaucVar);
        }
        zzart.zzam(iterable, zzaigVar.zzi);
    }

    public static /* synthetic */ void zzf(zzaig zzaigVar, Iterable iterable) {
        zzauc zzaucVar = zzaigVar.zzj;
        if (!zzaucVar.zzc()) {
            zzaigVar.zzj = zzatu.zzay(zzaucVar);
        }
        zzart.zzam(iterable, zzaigVar.zzj);
    }

    public static /* synthetic */ void zzg(zzaig zzaigVar, Iterable iterable) {
        zzauc zzaucVar = zzaigVar.zzk;
        if (!zzaucVar.zzc()) {
            zzaigVar.zzk = zzatu.zzay(zzaucVar);
        }
        zzart.zzam(iterable, zzaigVar.zzk);
    }

    public static /* synthetic */ void zzh(zzaig zzaigVar, int i5) {
        zzaigVar.zzf |= 2;
        zzaigVar.zzl = i5;
    }

    public static /* synthetic */ void zzi(zzaig zzaigVar, zzaho zzahoVar) {
        zzahoVar.getClass();
        zzaigVar.zzm = zzahoVar;
        zzaigVar.zzf |= 4;
    }

    public static /* synthetic */ void zzj(zzaig zzaigVar, int i5) {
        zzaigVar.zzg = i5 - 1;
        zzaigVar.zzf |= 1;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0004\u0000\u0001᠌\u0000\u0002\u001a\u0003\u001a\u0004\u001a\u0005\u001a\u0006င\u0001\u0007ဉ\u0002", new Object[]{"zzf", "zzg", zzaif.zza, "zzh", "zzi", "zzj", "zzk", "zzl", "zzm"});
        }
        if (i11 == 3) {
            return new zzaig();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzaie(zzaduVar);
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
        synchronized (zzaig.class) {
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
