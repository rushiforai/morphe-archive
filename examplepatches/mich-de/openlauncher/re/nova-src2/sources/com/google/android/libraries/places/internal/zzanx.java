package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzanx extends zzatu implements zzavg {
    private static final zzanx zzb;
    private static volatile zzavn zze;
    private String zzf = b.f42142b;
    private int zzg;
    private int zzh;
    private boolean zzi;

    static {
        zzanx zzanxVar = new zzanx();
        zzb = zzanxVar;
        zzatu.zzaE(zzanx.class, zzanxVar);
    }

    private zzanx() {
    }

    public static zzanw zza() {
        return (zzanw) zzb.zzar();
    }

    public static zzanx zzd() {
        return zzb;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001Ȉ\u0002\u0004\u0003\u0004\u0004\u0007", new Object[]{"zzf", "zzg", "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new zzanx();
        }
        zzanv zzanvVar = null;
        if (i11 == 4) {
            return new zzanw(zzanvVar);
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
        synchronized (zzanx.class) {
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
