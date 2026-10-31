package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzaqh extends zzatu implements zzavg {
    private static final zzaqh zzb;
    private static volatile zzavn zze;
    private int zzf;
    private String zzg = b.f42142b;
    private String zzh = b.f42142b;
    private zzaxs zzi;
    private zzaxs zzj;
    private double zzk;
    private zzalr zzl;
    private zzawl zzm;

    static {
        zzaqh zzaqhVar = new zzaqh();
        zzb = zzaqhVar;
        zzatu.zzaE(zzaqh.class, zzaqhVar);
    }

    private zzaqh() {
    }

    public final double zza() {
        return this.zzk;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0007\u0000\u0001\u0001\u000e\u0007\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0007\u0000\tဉ\u0000\fဉ\u0001\rဉ\u0002\u000eဉ\u0003", new Object[]{"zzf", "zzg", "zzh", "zzk", "zzi", "zzj", "zzl", "zzm"});
        }
        if (i11 == 3) {
            return new zzaqh();
        }
        zzaqf zzaqfVar = null;
        if (i11 == 4) {
            return new zzaqg(zzaqfVar);
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
        synchronized (zzaqh.class) {
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

    public final zzalr zzc() {
        zzalr zzalrVar = this.zzl;
        return zzalrVar == null ? zzalr.zzc() : zzalrVar;
    }

    public final zzawl zze() {
        zzawl zzawlVar = this.zzm;
        return zzawlVar == null ? zzawl.zzh() : zzawlVar;
    }

    public final zzaxs zzf() {
        zzaxs zzaxsVar = this.zzj;
        return zzaxsVar == null ? zzaxs.zze() : zzaxsVar;
    }

    public final zzaxs zzg() {
        zzaxs zzaxsVar = this.zzi;
        return zzaxsVar == null ? zzaxs.zze() : zzaxsVar;
    }

    public final String zzh() {
        return this.zzh;
    }

    public final boolean zzi() {
        return (this.zzf & 4) != 0;
    }

    public final boolean zzj() {
        return (this.zzf & 2) != 0;
    }

    public final boolean zzk() {
        return (this.zzf & 8) != 0;
    }

    public final boolean zzl() {
        return (this.zzf & 1) != 0;
    }
}
