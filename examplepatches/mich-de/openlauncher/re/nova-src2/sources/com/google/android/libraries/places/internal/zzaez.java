package com.google.android.libraries.places.internal;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;

/* loaded from: classes3.dex */
public final class zzaez extends zzatu implements zzavg {
    private static final zzaez zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private int zzh;
    private int zzi;
    private int zzj;
    private int zzk;
    private zzaen zzl;
    private zzaeg zzm;
    private zzaeb zzn;
    private zzaip zzo;
    private zzaei zzp;
    private zzael zzq;
    private zzair zzr;
    private zzaiz zzs;
    private zzaiv zzt;
    private int zzu;

    static {
        zzaez zzaezVar = new zzaez();
        zzb = zzaezVar;
        zzatu.zzaE(zzaez.class, zzaezVar);
    }

    private zzaez() {
    }

    public static zzaeu zza() {
        return (zzaeu) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzaez zzaezVar, int i5) {
        zzaezVar.zzf |= 4;
        zzaezVar.zzi = i5;
    }

    public static /* synthetic */ void zze(zzaez zzaezVar, zzaen zzaenVar) {
        zzaenVar.getClass();
        zzaezVar.zzl = zzaenVar;
        zzaezVar.zzf |= 32;
    }

    public static /* synthetic */ void zzf(zzaez zzaezVar, zzaeb zzaebVar) {
        zzaebVar.getClass();
        zzaezVar.zzn = zzaebVar;
        zzaezVar.zzf |= 128;
    }

    public static /* synthetic */ void zzg(zzaez zzaezVar, zzaei zzaeiVar) {
        zzaeiVar.getClass();
        zzaezVar.zzp = zzaeiVar;
        zzaezVar.zzf |= EventBridgeChannel.QUEUE_CAPACITY;
    }

    public static /* synthetic */ void zzh(zzaez zzaezVar, zzaiz zzaizVar) {
        zzaizVar.getClass();
        zzaezVar.zzs = zzaizVar;
        zzaezVar.zzf |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
    }

    public static /* synthetic */ void zzi(zzaez zzaezVar, int i5) {
        zzaezVar.zzg = i5 - 1;
        zzaezVar.zzf |= 1;
    }

    public static /* synthetic */ void zzj(zzaez zzaezVar, int i5) {
        zzaezVar.zzh = i5 - 1;
        zzaezVar.zzf |= 2;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u000f\u0000\u0001\u0001\u000f\u000f\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003င\u0002\u0004᠌\u0003\u0005᠌\u0004\u0006ဉ\u0005\u0007ဉ\u0006\bဉ\u0007\tဉ\b\nဉ\t\u000bဉ\n\fဉ\u000b\rဉ\f\u000eဉ\r\u000f᠌\u000e", new Object[]{"zzf", "zzg", zzaew.zza, "zzh", zzaey.zza, "zzi", "zzj", zzaev.zza, "zzk", zzaet.zza, "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", "zzt", "zzu", zzaex.zza});
        }
        if (i11 == 3) {
            return new zzaez();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzaeu(zzaduVar);
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
        synchronized (zzaez.class) {
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
