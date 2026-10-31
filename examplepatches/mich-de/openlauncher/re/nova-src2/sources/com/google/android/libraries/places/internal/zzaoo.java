package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzaoo extends zzatu implements zzavg {
    private static final zzaoo zzb;
    private static volatile zzavn zze;
    private String zzf = b.f42142b;
    private String zzg = b.f42142b;
    private zzauc zzh = zzatu.zzax();
    private String zzi = b.f42142b;

    static {
        zzaoo zzaooVar = new zzaoo();
        zzb = zzaooVar;
        zzatu.zzaE(zzaoo.class, zzaooVar);
    }

    private zzaoo() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0001\u0000\u0001Ȉ\u0002Ȉ\u0003Ț\u0004Ȉ", new Object[]{"zzf", "zzg", "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new zzaoo();
        }
        zzaok zzaokVar = null;
        if (i11 == 4) {
            return new zzaon(zzaokVar);
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
        synchronized (zzaoo.class) {
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

    public final String zzc() {
        return this.zzf;
    }

    public final String zzd() {
        return this.zzg;
    }

    public final List zze() {
        return this.zzh;
    }
}
