package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzxi extends zzatu implements zzavg {
    private static final zzxi zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzaub zzg = zzatu.zzaw();
    private zzaub zzh = zzatu.zzaw();
    private zzaub zzi = zzatu.zzaw();
    private zzaub zzj = zzatu.zzaw();
    private zzaub zzk = zzatu.zzaw();
    private int zzl;
    private int zzm;
    private int zzn;
    private int zzo;
    private int zzp;
    private zzwx zzq;
    private int zzr;

    static {
        zzxi zzxiVar = new zzxi();
        zzb = zzxiVar;
        zzatu.zzaE(zzxi.class, zzxiVar);
    }

    private zzxi() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\f\u0000\u0001\u0001\f\f\u0000\u0005\u0000\u0001\u0014\u0002\u0014\u0003\u0014\u0004\u0014\u0005\u0014\u0006င\u0000\u0007᠌\u0001\b᠌\u0002\t᠌\u0003\nင\u0004\u000bဉ\u0005\fင\u0006", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", zzxh.zza, "zzn", zzxg.zza, "zzo", zzxe.zza, "zzp", "zzq", "zzr"});
        }
        if (i11 == 3) {
            return new zzxi();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzxf(zzwvVar);
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
        synchronized (zzxi.class) {
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
