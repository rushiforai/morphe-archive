package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzvl extends zzatu implements zzavg {
    private static final zzvl zzb;
    private static volatile zzavn zze;
    private int zzf;
    private boolean zzg;
    private long zzh;
    private zzst zzi;
    private int zzj;

    static {
        zzvl zzvlVar = new zzvl();
        zzb = zzvlVar;
        zzatu.zzaE(zzvl.class, zzvlVar);
    }

    private zzvl() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဂ\u0001\u0003ဉ\u0002\u0004င\u0003", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i11 == 3) {
            return new zzvl();
        }
        zzvj zzvjVar = null;
        if (i11 == 4) {
            return new zzvk(zzvjVar);
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
        synchronized (zzvl.class) {
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
