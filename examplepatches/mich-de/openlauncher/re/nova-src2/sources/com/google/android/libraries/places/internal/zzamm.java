package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzamm extends zzatu implements zzavg {
    private static final zzamm zzb;
    private static volatile zzavn zze;
    private int zzf = 0;
    private Object zzg;

    static {
        zzamm zzammVar = new zzamm();
        zzb = zzammVar;
        zzatu.zzaE(zzamm.class, zzammVar);
    }

    private zzamm() {
    }

    public final zzamf zza() {
        return this.zzf == 1 ? (zzamf) this.zzg : zzamf.zze();
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0002\u0001\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001<\u0000\u0002<\u0000", new Object[]{"zzg", "zzf", zzamf.class, zzamh.class});
        }
        if (i11 == 3) {
            return new zzamm();
        }
        zzalz zzalzVar = null;
        if (i11 == 4) {
            return new zzamb(zzalzVar);
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
        synchronized (zzamm.class) {
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

    public final boolean zzd() {
        return this.zzf == 1;
    }
}
