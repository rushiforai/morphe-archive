package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzae extends zzatu implements zzavg {
    private static final zzae zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzco zzg;
    private boolean zzh;
    private zzauc zzi = zzatu.zzax();
    private zzauc zzj = zzatu.zzax();
    private int zzk;
    private int zzl;
    private int zzm;
    private int zzn;
    private long zzo;

    static {
        zzae zzaeVar = new zzae();
        zzb = zzaeVar;
        zzatu.zzaE(zzae.class, zzaeVar);
    }

    private zzae() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\t\u0000\u0001\u0001\t\t\u0000\u0002\u0000\u0001ဉ\u0000\u0002ဇ\u0001\u0003\u001b\u0004\u001b\u0005င\u0002\u0006င\u0003\u0007င\u0004\bင\u0005\tဂ\u0006", new Object[]{"zzf", "zzg", "zzh", "zzi", zzar.class, "zzj", zzar.class, "zzk", "zzl", "zzm", "zzn", "zzo"});
        }
        if (i11 == 3) {
            return new zzae();
        }
        zzac zzacVar = null;
        if (i11 == 4) {
            return new zzad(zzacVar);
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
        synchronized (zzae.class) {
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
