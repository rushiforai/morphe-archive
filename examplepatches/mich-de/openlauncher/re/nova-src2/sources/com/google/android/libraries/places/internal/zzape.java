package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzape extends zzatu implements zzavg {
    private static final zzape zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzapd zzg;
    private zzapd zzh;

    static {
        zzape zzapeVar = new zzape();
        zzb = zzapeVar;
        zzatu.zzaE(zzape.class, zzapeVar);
    }

    private zzape() {
    }

    public final zzapd zza() {
        zzapd zzapdVar = this.zzh;
        return zzapdVar == null ? zzapd.zzf() : zzapdVar;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001", new Object[]{"zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new zzape();
        }
        zzaok zzaokVar = null;
        if (i11 == 4) {
            return new zzapb(zzaokVar);
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
        synchronized (zzape.class) {
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

    public final zzapd zzc() {
        zzapd zzapdVar = this.zzg;
        return zzapdVar == null ? zzapd.zzf() : zzapdVar;
    }

    public final boolean zze() {
        return (this.zzf & 2) != 0;
    }

    public final boolean zzf() {
        return (this.zzf & 1) != 0;
    }
}
