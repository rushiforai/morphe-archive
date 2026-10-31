package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzvn extends zzatu implements zzavg {
    private static final zzvn zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzatz zzg = zzatu.zzau();
    private zzatz zzh = zzatu.zzau();
    private int zzi;
    private int zzj;
    private long zzk;
    private int zzl;

    static {
        zzvn zzvnVar = new zzvn();
        zzb = zzvnVar;
        zzatu.zzaE(zzvn.class, zzvnVar);
    }

    private zzvn() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0002\u0000\u0001\u0016\u0002\u0016\u0003င\u0000\u0004င\u0001\u0005ဂ\u0002\u0006င\u0003", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl"});
        }
        if (i11 == 3) {
            return new zzvn();
        }
        zzvj zzvjVar = null;
        if (i11 == 4) {
            return new zzvm(zzvjVar);
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
        synchronized (zzvn.class) {
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
