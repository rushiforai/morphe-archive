package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzaog extends zzatu implements zzavg {
    private static final zzaog zzb;
    private static volatile zzavn zze;
    private int zzg;
    private int zzh;
    private String zzf = b.f42142b;
    private zzauc zzi = zzatu.zzax();

    static {
        zzaog zzaogVar = new zzaog();
        zzb = zzaogVar;
        zzatu.zzaE(zzaog.class, zzaogVar);
    }

    private zzaog() {
    }

    public final int zza() {
        return this.zzh;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0001\u0000\u0001Ȉ\u0002\u0004\u0003\u0004\u0004\u001b", new Object[]{"zzf", "zzg", "zzh", "zzi", zzalr.class});
        }
        if (i11 == 3) {
            return new zzaog();
        }
        zzaoe zzaoeVar = null;
        if (i11 == 4) {
            return new zzaof(zzaoeVar);
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
        synchronized (zzaog.class) {
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

    public final int zzc() {
        return this.zzg;
    }

    public final String zze() {
        return this.zzf;
    }

    public final List zzf() {
        return this.zzi;
    }
}
