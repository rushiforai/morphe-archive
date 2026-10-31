package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzanm extends zzatu implements zzavg {
    private static final zzanm zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private double zzh;
    private int zzi;
    private int zzj;
    private int zzk;
    private zzawl zzl;

    static {
        zzanm zzanmVar = new zzanm();
        zzb = zzanmVar;
        zzatu.zzaE(zzanm.class, zzanmVar);
    }

    private zzanm() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001\f\u0002\u0000\u0003\u0004\u0004င\u0000\u0005င\u0001\u0006ဉ\u0002", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl"});
        }
        if (i11 == 3) {
            return new zzanm();
        }
        zzanj zzanjVar = null;
        if (i11 == 4) {
            return new zzanl(zzanjVar);
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
        synchronized (zzanm.class) {
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
