package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzabb extends zzatu implements zzavg {
    private static final zzabb zzb;
    private static volatile zzavn zze;
    private int zzf;
    private String zzg = b.f42142b;
    private int zzh;
    private long zzi;

    static {
        zzabb zzabbVar = new zzabb();
        zzb = zzabbVar;
        zzatu.zzaE(zzabb.class, zzabbVar);
    }

    private zzabb() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဈ\u0000\u0002᠌\u0001\u0003ဂ\u0002", new Object[]{"zzf", "zzg", "zzh", zzaba.zza, "zzi"});
        }
        if (i11 == 3) {
            return new zzabb();
        }
        zzaay zzaayVar = null;
        if (i11 == 4) {
            return new zzaaz(zzaayVar);
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
        synchronized (zzabb.class) {
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
