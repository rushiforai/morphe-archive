package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzzd extends zzatu implements zzavg {
    private static final zzzd zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private float zzh;

    static {
        zzzd zzzdVar = new zzzd();
        zzb = zzzdVar;
        zzatu.zzaE(zzzd.class, zzzdVar);
    }

    private zzzd() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0002\u0000\u0001\u0010\u0011\u0002\u0000\u0000\u0000\u0010᠌\u0000\u0011ခ\u0001", new Object[]{"zzf", "zzg", zzuo.zza, "zzh"});
        }
        if (i11 == 3) {
            return new zzzd();
        }
        zzwv zzwvVar = null;
        if (i11 == 4) {
            return new zzzc(zzwvVar);
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
        synchronized (zzzd.class) {
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
