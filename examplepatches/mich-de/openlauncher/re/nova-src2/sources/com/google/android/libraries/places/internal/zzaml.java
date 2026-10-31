package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzaml extends zzatu implements zzavg {
    private static final zzaml zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzamd zzg;
    private zzamd zzh;

    static {
        zzaml zzamlVar = new zzaml();
        zzb = zzamlVar;
        zzatu.zzaE(zzaml.class, zzamlVar);
    }

    private zzaml() {
    }

    public static zzaml zze() {
        return zzb;
    }

    public final zzamd zza() {
        zzamd zzamdVar = this.zzg;
        return zzamdVar == null ? zzamd.zzc() : zzamdVar;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001", new Object[]{"zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new zzaml();
        }
        zzalz zzalzVar = null;
        if (i11 == 4) {
            return new zzamk(zzalzVar);
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
        synchronized (zzaml.class) {
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

    public final zzamd zzc() {
        zzamd zzamdVar = this.zzh;
        return zzamdVar == null ? zzamd.zzc() : zzamdVar;
    }
}
