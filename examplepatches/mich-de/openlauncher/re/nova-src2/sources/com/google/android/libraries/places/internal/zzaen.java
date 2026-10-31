package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzaen extends zzatu implements zzavg {
    private static final zzaen zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private int zzh;

    static {
        zzaen zzaenVar = new zzaen();
        zzb = zzaenVar;
        zzatu.zzaE(zzaen.class, zzaenVar);
    }

    private zzaen() {
    }

    public static zzaem zza() {
        return (zzaem) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzaen zzaenVar, int i5) {
        zzaenVar.zzf |= 1;
        zzaenVar.zzg = 1;
    }

    public static /* synthetic */ void zze(zzaen zzaenVar, int i5) {
        zzaenVar.zzf |= 2;
        zzaenVar.zzh = i5;
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
            return new zzaen();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzaem(zzaduVar);
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
        synchronized (zzaen.class) {
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
