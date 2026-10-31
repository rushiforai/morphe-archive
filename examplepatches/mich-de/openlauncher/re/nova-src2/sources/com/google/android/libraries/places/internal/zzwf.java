package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzwf extends zzatu implements zzavg {
    private static final zzwf zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzwd zzg;
    private zzwd zzh;
    private byte zzi = 2;

    static {
        zzwf zzwfVar = new zzwf();
        zzb = zzwfVar;
        zzatu.zzaE(zzwf.class, zzwfVar);
    }

    private zzwf() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return Byte.valueOf(this.zzi);
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0002\u0001ᐉ\u0000\u0002ᐉ\u0001", new Object[]{"zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new zzwf();
        }
        zzwb zzwbVar = null;
        if (i11 == 4) {
            return new zzwe(zzwbVar);
        }
        if (i11 == 5) {
            return zzb;
        }
        if (i11 != 6) {
            this.zzi = obj == null ? (byte) 0 : (byte) 1;
            return null;
        }
        zzavn zzavnVar = zze;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzwf.class) {
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
