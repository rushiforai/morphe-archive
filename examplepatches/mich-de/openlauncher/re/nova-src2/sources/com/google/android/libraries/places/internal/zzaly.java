package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzaly extends zzatu implements zzavg {
    private static final zzaly zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzalv zzh;
    private zzalx zzi;
    private zzaxp zzn;
    private int zzo;
    private boolean zzp;
    private String zzg = b.f42142b;
    private zzauc zzj = zzatu.zzax();
    private zzauc zzk = zzatu.zzax();
    private String zzl = b.f42142b;
    private String zzm = b.f42142b;
    private String zzq = b.f42142b;

    static {
        zzaly zzalyVar = new zzaly();
        zzb = zzalyVar;
        zzatu.zzaE(zzaly.class, zzalyVar);
    }

    private zzaly() {
    }

    public static zzalt zza() {
        return (zzalt) zzb.zzar();
    }

    public static zzaly zzd() {
        return zzb;
    }

    public static /* synthetic */ void zzf(zzaly zzalyVar, zzalv zzalvVar) {
        zzalvVar.getClass();
        zzalyVar.zzh = zzalvVar;
        zzalyVar.zzf |= 1;
    }

    public static /* synthetic */ void zzg(zzaly zzalyVar, zzalx zzalxVar) {
        zzalxVar.getClass();
        zzalyVar.zzi = zzalxVar;
        zzalyVar.zzf |= 2;
    }

    public static /* synthetic */ void zzh(zzaly zzalyVar, String str) {
        str.getClass();
        zzauc zzaucVar = zzalyVar.zzj;
        if (!zzaucVar.zzc()) {
            zzalyVar.zzj = zzatu.zzay(zzaucVar);
        }
        zzalyVar.zzj.add(str);
    }

    public static /* synthetic */ void zzi(zzaly zzalyVar, String str) {
        str.getClass();
        zzauc zzaucVar = zzalyVar.zzk;
        if (!zzaucVar.zzc()) {
            zzalyVar.zzk = zzatu.zzay(zzaucVar);
        }
        zzalyVar.zzk.add(str);
    }

    public static /* synthetic */ void zzk(zzaly zzalyVar, zzaxp zzaxpVar) {
        zzaxpVar.getClass();
        zzalyVar.zzn = zzaxpVar;
        zzalyVar.zzf |= 4;
    }

    public static /* synthetic */ void zzm(zzaly zzalyVar, String str) {
        str.getClass();
        zzalyVar.zzq = str;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u000b\u0000\u0001\u0001\u000b\u000b\u0000\u0002\u0000\u0001Ȉ\u0002ဉ\u0000\u0003ဉ\u0001\u0004Ț\u0005Ț\u0006Ȉ\u0007Ȉ\bဉ\u0002\t\u0004\n\u0007\u000bȈ", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq"});
        }
        if (i11 == 3) {
            return new zzaly();
        }
        zzals zzalsVar = null;
        if (i11 == 4) {
            return new zzalt(zzalsVar);
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
        synchronized (zzaly.class) {
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
