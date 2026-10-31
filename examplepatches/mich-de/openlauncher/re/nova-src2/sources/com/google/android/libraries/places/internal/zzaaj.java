package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzaaj extends zzatu implements zzavg {
    private static final zzaaj zzb;
    private static volatile zzavn zze;
    private int zzf;
    private long zzg;
    private zzzw zzh;
    private zzzw zzi;
    private zzaas zzj;
    private zzaae zzk;
    private zzzm zzl;
    private zzaav zzm;
    private zzaax zzn;
    private zzaal zzo;
    private zzzi zzp;
    private zzzo zzq;
    private zzaah zzr;
    private zzaan zzs;
    private zzaap zzt;

    static {
        zzaaj zzaajVar = new zzaaj();
        zzb = zzaajVar;
        zzatu.zzaE(zzaaj.class, zzaajVar);
    }

    private zzaaj() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u000e\u0000\u0001\u0001\u000e\u000e\u0000\u0000\u0000\u0001ဂ\u0000\u0002ဉ\u0001\u0003ဉ\u0002\u0004ဉ\u0003\u0005ဉ\u0004\u0006ဉ\u0005\u0007ဉ\u0006\bဉ\u0007\tဉ\b\nဉ\t\u000bဉ\n\fဉ\u000b\rဉ\f\u000eဉ\r", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", "zzt"});
        }
        if (i11 == 3) {
            return new zzaaj();
        }
        zzzg zzzgVar = null;
        if (i11 == 4) {
            return new zzaai(zzzgVar);
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
        synchronized (zzaaj.class) {
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
