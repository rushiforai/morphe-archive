package com.google.android.libraries.places.internal;

import java.util.List;

/* loaded from: classes3.dex */
public final class zzarc extends zzatu implements zzavg {
    private static final zzarc zzb;
    private static volatile zzavn zze;
    private zzauc zzf = zzatu.zzax();
    private zzauc zzg = zzatu.zzax();

    static {
        zzarc zzarcVar = new zzarc();
        zzb = zzarcVar;
        zzatu.zzaE(zzarc.class, zzarcVar);
    }

    private zzarc() {
    }

    public static zzarc zzc() {
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
            return zzatu.zzaB(zzb, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0002\u0000\u0001\u001b\u0002\u001b", new Object[]{"zzf", zzaps.class, "zzg", zzaqs.class});
        }
        if (i11 == 3) {
            return new zzarc();
        }
        zzara zzaraVar = null;
        if (i11 == 4) {
            return new zzarb(zzaraVar);
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
        synchronized (zzarc.class) {
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

    public final List zzd() {
        return this.zzf;
    }
}
