package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzc extends zzatu implements zzavg {
    private static final zzc zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzco zzg;
    private zzai zzh;
    private zzj zzi;
    private zzl zzj;
    private zzg zzk;
    private zzu zzl;
    private zze zzm;
    private zzp zzn;
    private zzaa zzo;
    private zzy zzp;
    private zzr zzq;
    private zzw zzr;

    static {
        zzc zzcVar = new zzc();
        zzb = zzcVar;
        zzatu.zzaE(zzc.class, zzcVar);
    }

    private zzc() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\f\u0000\u0001\u0001\f\f\u0000\u0000\u0000\u0001ဉ\u0001\u0002ဉ\u0002\u0003ဉ\u0003\u0004ဉ\u0004\u0005ဉ\u0005\u0006ဉ\u0006\u0007ဉ\u0007\bဉ\b\tဉ\t\nဉ\u0000\u000bဉ\n\fဉ\u000b", new Object[]{"zzf", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzg", "zzq", "zzr"});
        }
        if (i11 == 3) {
            return new zzc();
        }
        zza zzaVar = null;
        if (i11 == 4) {
            return new zzb(zzaVar);
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
        synchronized (zzc.class) {
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
