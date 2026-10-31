package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzafe extends zzatu implements zzavg {
    private static final zzafe zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private boolean zzk;
    private int zzm;
    private zzauc zzh = zzatu.zzax();
    private String zzi = b.f42142b;
    private String zzj = b.f42142b;
    private zzauc zzl = zzatu.zzax();

    static {
        zzafe zzafeVar = new zzafe();
        zzb = zzafeVar;
        zzatu.zzaE(zzafe.class, zzafeVar);
    }

    private zzafe() {
    }

    public static zzafd zza() {
        return (zzafd) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzafe zzafeVar, String str) {
        str.getClass();
        zzauc zzaucVar = zzafeVar.zzh;
        if (!zzaucVar.zzc()) {
            zzafeVar.zzh = zzatu.zzay(zzaucVar);
        }
        zzafeVar.zzh.add(str);
    }

    public static /* synthetic */ void zze(zzafe zzafeVar, int i5) {
        zzafeVar.zzf |= 16;
        zzafeVar.zzm = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0002\u0000\u0001င\u0000\u0002\u001a\u0003ဈ\u0001\u0004ဈ\u0002\u0005ဇ\u0003\u0006\u001a\u0007င\u0004", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm"});
        }
        if (i11 == 3) {
            return new zzafe();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzafd(zzaduVar);
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
        synchronized (zzafe.class) {
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
