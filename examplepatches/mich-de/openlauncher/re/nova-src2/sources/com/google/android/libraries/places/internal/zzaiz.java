package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzaiz extends zzatu implements zzavg {
    private static final zzaiz zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private int zzh;

    static {
        zzaiz zzaizVar = new zzaiz();
        zzb = zzaizVar;
        zzatu.zzaE(zzaiz.class, zzaizVar);
    }

    private zzaiz() {
    }

    public static zzaiy zza() {
        return (zzaiy) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzaiz zzaizVar, int i5) {
        zzaizVar.zzf |= 1;
        zzaizVar.zzg = i5;
    }

    public static /* synthetic */ void zze(zzaiz zzaizVar, int i5) {
        zzaizVar.zzf |= 2;
        zzaizVar.zzh = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001င\u0000\u0002င\u0001", new Object[]{"zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new zzaiz();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzaiy(zzaduVar);
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
        synchronized (zzaiz.class) {
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
