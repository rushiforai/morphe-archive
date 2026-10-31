package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzapi extends zzatu implements zzavg {
    private static final zzapi zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzaxm zzg;

    static {
        zzapi zzapiVar = new zzapi();
        zzb = zzapiVar;
        zzatu.zzaE(zzapi.class, zzapiVar);
    }

    private zzapi() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဉ\u0000", new Object[]{"zzf", "zzg"});
        }
        if (i11 == 3) {
            return new zzapi();
        }
        zzaok zzaokVar = null;
        if (i11 == 4) {
            return new zzaph(zzaokVar);
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
        synchronized (zzapi.class) {
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

    public final zzaxm zzc() {
        zzaxm zzaxmVar = this.zzg;
        return zzaxmVar == null ? zzaxm.zzh() : zzaxmVar;
    }
}
