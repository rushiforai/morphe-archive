package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzali extends zzatu implements zzavg {
    private static final zzali zzb;
    private static volatile zzavn zze;
    private int zzf;
    private int zzg;
    private zzakm zzh;
    private zzakm zzi;
    private int zzk;
    private int zzl;
    private int zzm;
    private int zzn;
    private int zzo;
    private zzakm zzp;
    private zzakp zzq;
    private zzakv zzr;
    private int zzs;
    private int zzt;
    private zzaks zzu;
    private byte zzv = 2;
    private zzauc zzj = zzatu.zzax();

    static {
        zzali zzaliVar = new zzali();
        zzb = zzaliVar;
        zzatu.zzaE(zzali.class, zzaliVar);
    }

    private zzali() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return Byte.valueOf(this.zzv);
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001\u000f\u0000\u0001\u0002\u0010\u000f\u0000\u0001\u0001\u0002ᔄ\u0000\u0003ဉ\u0001\u0004ဉ\u0002\u0005\u001b\u0006င\u0003\u0007င\u0004\bင\u0005\tင\u0006\nင\u0007\u000bဉ\b\fဉ\t\rဉ\n\u000eင\u000b\u000fင\f\u0010ဉ\r", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzj", zzalf.class, "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", "zzt", "zzu"});
        }
        if (i11 == 3) {
            return new zzali();
        }
        zzalg zzalgVar = null;
        if (i11 == 4) {
            return new zzalh(zzalgVar);
        }
        if (i11 == 5) {
            return zzb;
        }
        if (i11 != 6) {
            this.zzv = obj == null ? (byte) 0 : (byte) 1;
            return null;
        }
        zzavn zzavnVar = zze;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzali.class) {
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
