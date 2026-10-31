package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzalx extends zzatu implements zzavg {
    private static final zzalx zzb;
    private static volatile zzavn zze;
    private int zzf = 0;
    private Object zzg;

    static {
        zzalx zzalxVar = new zzalx();
        zzb = zzalxVar;
        zzatu.zzaE(zzalx.class, zzalxVar);
    }

    private zzalx() {
    }

    public static zzalw zza() {
        return (zzalw) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzalx zzalxVar, zzaki zzakiVar) {
        zzakiVar.getClass();
        zzalxVar.zzg = zzakiVar;
        zzalxVar.zzf = 1;
    }

    public static /* synthetic */ void zze(zzalx zzalxVar, zzamq zzamqVar) {
        zzamqVar.getClass();
        zzalxVar.zzg = zzamqVar;
        zzalxVar.zzf = 2;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0002\u0001\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001<\u0000\u0002<\u0000", new Object[]{"zzg", "zzf", zzaki.class, zzamq.class});
        }
        if (i11 == 3) {
            return new zzalx();
        }
        zzals zzalsVar = null;
        if (i11 == 4) {
            return new zzalw(zzalsVar);
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
        synchronized (zzalx.class) {
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
