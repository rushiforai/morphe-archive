package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzaav extends zzatu implements zzavg {
    private static final zzaav zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private int zzh;
    private String zzi = b.f42142b;

    static {
        zzaav zzaavVar = new zzaav();
        zzb = zzaavVar;
        zzatu.zzaE(zzaav.class, zzaavVar);
    }

    private zzaav() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001᠌\u0000\u0002င\u0001\u0003ဈ\u0002", new Object[]{"zzf", "zzg", zzaau.zza, "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new zzaav();
        }
        zzzg zzzgVar = null;
        if (i11 == 4) {
            return new zzaat(zzzgVar);
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
        synchronized (zzaav.class) {
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
