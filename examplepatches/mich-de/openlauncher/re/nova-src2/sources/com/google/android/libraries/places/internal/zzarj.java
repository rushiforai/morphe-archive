package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzarj extends zzatu implements zzavg {
    private static final zzarj zzb;
    private static volatile zzavn zze;
    private int zzf = 0;
    private Object zzg;

    static {
        zzarj zzarjVar = new zzarj();
        zzb = zzarjVar;
        zzatu.zzaE(zzarj.class, zzarjVar);
    }

    private zzarj() {
    }

    public static zzari zza() {
        return (zzari) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzarj zzarjVar, zzaki zzakiVar) {
        zzakiVar.getClass();
        zzarjVar.zzg = zzakiVar;
        zzarjVar.zzf = 1;
    }

    public static /* synthetic */ void zze(zzarj zzarjVar, zzamq zzamqVar) {
        zzamqVar.getClass();
        zzarjVar.zzg = zzamqVar;
        zzarjVar.zzf = 2;
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
            return new zzarj();
        }
        zzard zzardVar = null;
        if (i11 == 4) {
            return new zzari(zzardVar);
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
        synchronized (zzarj.class) {
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
