package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzajg extends zzatu implements zzavg {
    private static final zzajg zzb;
    private static volatile zzavn zze;
    private int zzf;
    private long zzg;
    private int zzh;

    static {
        zzajg zzajgVar = new zzajg();
        zzb = zzajgVar;
        zzatu.zzaE(zzajg.class, zzajgVar);
    }

    private zzajg() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဂ\u0000\u0002ဏ\u0001", new Object[]{"zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new zzajg();
        }
        zzaje zzajeVar = null;
        if (i11 == 4) {
            return new zzajf(zzajeVar);
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
        synchronized (zzajg.class) {
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
