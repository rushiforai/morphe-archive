package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbt extends zzatu implements zzavg {
    private static final zzbt zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzcd zzg;
    private long zzh;
    private long zzi;
    private boolean zzj;
    private int zzk;
    private int zzl;

    static {
        zzbt zzbtVar = new zzbt();
        zzb = zzbtVar;
        zzatu.zzaE(zzbt.class, zzbtVar);
    }

    private zzbt() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဂ\u0001\u0003ဂ\u0002\u0004ဇ\u0003\u0005င\u0004\u0006င\u0005", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl"});
        }
        if (i11 == 3) {
            return new zzbt();
        }
        zzbp zzbpVar = null;
        if (i11 == 4) {
            return new zzbs(zzbpVar);
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
        synchronized (zzbt.class) {
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
