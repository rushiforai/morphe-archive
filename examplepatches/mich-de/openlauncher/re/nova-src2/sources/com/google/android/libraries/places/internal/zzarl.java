package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzarl extends zzatu implements zzavg {
    private static final zzarl zzb;
    private static volatile zzavn zze;
    private int zzf = 0;
    private Object zzg;

    static {
        zzarl zzarlVar = new zzarl();
        zzb = zzarlVar;
        zzatu.zzaE(zzarl.class, zzarlVar);
    }

    private zzarl() {
    }

    public static zzark zza() {
        return (zzark) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzarl zzarlVar, zzaki zzakiVar) {
        zzakiVar.getClass();
        zzarlVar.zzg = zzakiVar;
        zzarlVar.zzf = 1;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0001\u0001\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001<\u0000", new Object[]{"zzg", "zzf", zzaki.class});
        }
        if (i11 == 3) {
            return new zzarl();
        }
        zzard zzardVar = null;
        if (i11 == 4) {
            return new zzark(zzardVar);
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
        synchronized (zzarl.class) {
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
