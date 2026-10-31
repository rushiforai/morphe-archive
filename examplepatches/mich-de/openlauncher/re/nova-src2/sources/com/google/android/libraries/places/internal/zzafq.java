package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzafq extends zzatu implements zzavg {
    private static final zzafq zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzwf zzh;
    private zzafe zzi;
    private byte zzj = 2;
    private String zzg = b.f42142b;

    static {
        zzafq zzafqVar = new zzafq();
        zzb = zzafqVar;
        zzatu.zzaE(zzafq.class, zzafqVar);
    }

    private zzafq() {
    }

    public static zzafp zza() {
        return (zzafp) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzafq zzafqVar, zzafe zzafeVar) {
        zzafqVar.zzi = zzafeVar;
        zzafqVar.zzf |= 4;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return Byte.valueOf(this.zzj);
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0001\u0001ဈ\u0000\u0002ᐉ\u0001\u0003ဉ\u0002", new Object[]{"zzf", "zzg", "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new zzafq();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzafp(zzaduVar);
        }
        if (i11 == 5) {
            return zzb;
        }
        if (i11 != 6) {
            this.zzj = obj == null ? (byte) 0 : (byte) 1;
            return null;
        }
        zzavn zzavnVar = zze;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzafq.class) {
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
