package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzzm extends zzatu implements zzavg {
    private static final zzzm zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzh;
    private String zzg = b.f42142b;
    private zzauc zzi = zzatu.zzax();

    static {
        zzzm zzzmVar = new zzzm();
        zzb = zzzmVar;
        zzatu.zzaE(zzzm.class, zzzmVar);
    }

    private zzzm() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0001\u0000\u0001ဈ\u0000\u0002င\u0001\u0003\u001b", new Object[]{"zzf", "zzg", "zzh", "zzi", zzzl.class});
        }
        if (i11 == 3) {
            return new zzzm();
        }
        zzzg zzzgVar = null;
        if (i11 == 4) {
            return new zzzj(zzzgVar);
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
        synchronized (zzzm.class) {
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
