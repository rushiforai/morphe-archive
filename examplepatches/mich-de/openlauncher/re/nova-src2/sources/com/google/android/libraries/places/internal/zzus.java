package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzus extends zzatu implements zzavg {
    private static final zzus zzb;
    private static volatile zzavn zze;
    private int zzf;
    private zzuu zzh;
    private zzuw zzi;
    private zzali zzj;
    private zzvc zzk;
    private zzvi zzl;
    private zzve zzm;
    private zzuy zzn;
    private byte zzo = 2;
    private int zzg = 1;

    static {
        zzus zzusVar = new zzus();
        zzb = zzusVar;
        zzatu.zzaE(zzus.class, zzusVar);
    }

    private zzus() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return Byte.valueOf(this.zzo);
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\b\u0000\u0001\u0001\b\b\u0000\u0000\u0001\u0001᠌\u0000\u0002ဉ\u0001\u0003ဉ\u0002\u0004ᐉ\u0003\u0005ဉ\u0004\u0006ဉ\u0005\u0007ဉ\u0006\bဉ\u0007", new Object[]{"zzf", "zzg", zzur.zza, "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn"});
        }
        if (i11 == 3) {
            return new zzus();
        }
        zzup zzupVar = null;
        if (i11 == 4) {
            return new zzuq(zzupVar);
        }
        if (i11 == 5) {
            return zzb;
        }
        if (i11 != 6) {
            this.zzo = obj == null ? (byte) 0 : (byte) 1;
            return null;
        }
        zzavn zzavnVar = zze;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzus.class) {
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
