package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzaqz extends zzatu implements zzavg {
    private static final zzaua zzb = new zzaqt();
    private static final zzaqz zze;
    private static volatile zzavn zzf;
    private int zzg;
    private int zzn;
    private zzaqy zzo;
    private int zzp;
    private zzaqn zzq;
    private boolean zzr;
    private double zzs;
    private String zzh = b.f42142b;
    private String zzi = b.f42142b;
    private zzauc zzj = zzatu.zzax();
    private zzauc zzk = zzatu.zzax();
    private zzauc zzl = zzatu.zzax();
    private zzauc zzm = zzatu.zzax();
    private zzatz zzt = zzatu.zzau();

    static {
        zzaqz zzaqzVar = new zzaqz();
        zze = zzaqzVar;
        zzatu.zzaE(zzaqz.class, zzaqzVar);
    }

    private zzaqz() {
    }

    public static zzaqu zza() {
        return (zzaqu) zze.zzar();
    }

    public static zzaqz zzd() {
        return zze;
    }

    public static /* synthetic */ void zze(zzaqz zzaqzVar, String str) {
        str.getClass();
        zzaqzVar.zzh = str;
    }

    public static /* synthetic */ void zzg(zzaqz zzaqzVar, Iterable iterable) {
        zzauc zzaucVar = zzaqzVar.zzj;
        if (!zzaucVar.zzc()) {
            zzaqzVar.zzj = zzatu.zzay(zzaucVar);
        }
        zzart.zzam(iterable, zzaqzVar.zzj);
    }

    public static /* synthetic */ void zzh(zzaqz zzaqzVar, Iterable iterable) {
        zzauc zzaucVar = zzaqzVar.zzk;
        if (!zzaucVar.zzc()) {
            zzaqzVar.zzk = zzatu.zzay(zzaucVar);
        }
        zzart.zzam(iterable, zzaqzVar.zzk);
    }

    public static /* synthetic */ void zzi(zzaqz zzaqzVar, Iterable iterable) {
        zzauc zzaucVar = zzaqzVar.zzl;
        if (!zzaucVar.zzc()) {
            zzaqzVar.zzl = zzatu.zzay(zzaucVar);
        }
        zzart.zzam(iterable, zzaqzVar.zzl);
    }

    public static /* synthetic */ void zzj(zzaqz zzaqzVar, Iterable iterable) {
        zzauc zzaucVar = zzaqzVar.zzm;
        if (!zzaucVar.zzc()) {
            zzaqzVar.zzm = zzatu.zzay(zzaucVar);
        }
        zzart.zzam(iterable, zzaqzVar.zzm);
    }

    public static /* synthetic */ void zzl(zzaqz zzaqzVar, zzaqy zzaqyVar) {
        zzaqyVar.getClass();
        zzaqzVar.zzo = zzaqyVar;
        zzaqzVar.zzg |= 1;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zze, "\u0000\r\u0000\u0001\u0001\r\r\u0000\u0005\u0000\u0001Ȉ\u0002Ȉ\u0003Ț\u0004Ț\u0005Ț\u0006Ț\u0007\u0004\bဉ\u0000\t\f\nဉ\u0001\u000b\u0007\f\u0000\r,", new Object[]{"zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", "zzt"});
        }
        if (i11 == 3) {
            return new zzaqz();
        }
        zzaqt zzaqtVar = null;
        if (i11 == 4) {
            return new zzaqu(zzaqtVar);
        }
        if (i11 == 5) {
            return zze;
        }
        if (i11 != 6) {
            return null;
        }
        zzavn zzavnVar = zzf;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzaqz.class) {
            try {
                zzatpVar = zzf;
                if (zzatpVar == null) {
                    zzatpVar = new zzatp(zze);
                    zzf = zzatpVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return zzatpVar;
    }
}
