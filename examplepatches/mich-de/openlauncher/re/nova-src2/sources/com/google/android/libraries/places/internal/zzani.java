package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzani extends zzatu implements zzavg {
    private static final zzani zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzauc zzg = zzatu.zzax();
    private zzauc zzh = zzatu.zzax();
    private zzauc zzi = zzatu.zzax();
    private zzamx zzj;

    static {
        zzani zzaniVar = new zzani();
        zzb = zzaniVar;
        zzatu.zzaE(zzani.class, zzaniVar);
    }

    private zzani() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0003\u0000\u0001\u001b\u0002\u001b\u0003\u001b\u0004ဉ\u0000", new Object[]{"zzf", "zzg", zzaqh.class, "zzh", zzaog.class, "zzi", zzanh.class, "zzj"});
        }
        if (i11 == 3) {
            return new zzani();
        }
        zzamu zzamuVar = null;
        if (i11 == 4) {
            return new zzamv(zzamuVar);
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
        synchronized (zzani.class) {
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
