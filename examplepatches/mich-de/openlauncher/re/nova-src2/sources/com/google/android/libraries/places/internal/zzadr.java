package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzadr extends zzatu implements zzavg {
    private static final zzadr zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private zzado zzh;
    private zzado zzi;
    private int zzj;
    private zzadt zzk;
    private zzacl zzl;

    static {
        zzadr zzadrVar = new zzadr();
        zzb = zzadrVar;
        zzatu.zzaE(zzadr.class, zzadrVar);
    }

    private zzadr() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001᠌\u0000\u0002ဉ\u0001\u0003ဉ\u0002\u0004᠌\u0003\u0005ဉ\u0004\u0006ဉ\u0005", new Object[]{"zzf", "zzg", zzadp.zza, "zzh", "zzi", "zzj", zzadq.zza, "zzk", "zzl"});
        }
        if (i11 == 3) {
            return new zzadr();
        }
        zzabf zzabfVar = null;
        if (i11 == 4) {
            return new zzadl(zzabfVar);
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
        synchronized (zzadr.class) {
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
