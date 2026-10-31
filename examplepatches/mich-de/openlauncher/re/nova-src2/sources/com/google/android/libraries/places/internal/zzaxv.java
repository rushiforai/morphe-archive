package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzaxv extends zzatu implements zzavg {
    private static final zzaxv zzb;
    private static volatile zzavn zze;
    private String zzf = b.f42142b;
    private long zzg;
    private int zzh;

    static {
        zzaxv zzaxvVar = new zzaxv();
        zzb = zzaxvVar;
        zzatu.zzaE(zzaxv.class, zzaxvVar);
    }

    private zzaxv() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001Ȉ\u0002\u0002\u0003\u0004", new Object[]{"zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new zzaxv();
        }
        zzaxt zzaxtVar = null;
        if (i11 == 4) {
            return new zzaxu(zzaxtVar);
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
        synchronized (zzaxv.class) {
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
