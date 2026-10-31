package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzvr extends zzatu implements zzavg {
    private static final zzvr zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzco zzg;
    private zzvn zzh;
    private zzauc zzi = zzatu.zzax();
    private int zzj;
    private int zzk;

    static {
        zzvr zzvrVar = new zzvr();
        zzb = zzvrVar;
        zzatu.zzaE(zzvr.class, zzvrVar);
    }

    private zzvr() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0001\u0000\u0001ဉ\u0001\u0002\u001b\u0003᠌\u0002\u0004᠌\u0003\u0005ဉ\u0000", new Object[]{"zzf", "zzh", "zzi", zzvl.class, "zzj", zzvq.zza, "zzk", zzvp.zza, "zzg"});
        }
        if (i11 == 3) {
            return new zzvr();
        }
        zzvj zzvjVar = null;
        if (i11 == 4) {
            return new zzvo(zzvjVar);
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
        synchronized (zzvr.class) {
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
