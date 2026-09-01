package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ksf extends fnf {
    private static final ksf zzo;
    private static volatile mof zzp;
    private int zza;
    private long zze;
    private int zzf;
    private pmf zzh;
    private String zzi;
    private String zzj;
    private pmf zzk;
    private String zzl;
    private String zzm;
    private String zzn;
    private String zzd = "";
    private snf zzg = qof.e;

    static {
        ksf ksfVar = new ksf();
        zzo = ksfVar;
        fnf.l(ksf.class, ksfVar);
    }

    public ksf() {
        omf omfVar = pmf.b;
        this.zzh = omfVar;
        this.zzi = "";
        this.zzj = "";
        this.zzk = omfVar;
        this.zzl = "";
        this.zzm = "";
        this.zzn = "";
    }

    public static ksf z() {
        return zzo;
    }

    public final int A() {
        int i;
        int i2 = this.zzf;
        if (i2 == 15) {
            i = 17;
        } else if (i2 != 16) {
            switch (i2) {
                case 0:
                    i = 2;
                    break;
                case 1:
                    i = 3;
                    break;
                case 2:
                    i = 4;
                    break;
                case 3:
                    i = 5;
                    break;
                case 4:
                    i = 6;
                    break;
                case 5:
                    i = 7;
                    break;
                case 6:
                    i = 8;
                    break;
                case 7:
                    i = 9;
                    break;
                case 8:
                    i = 10;
                    break;
                case 9:
                    i = 11;
                    break;
                case 10:
                    i = 12;
                    break;
                default:
                    i = 0;
                    break;
            }
        } else {
            i = 18;
        }
        if (i == 0) {
            return 1;
        }
        return i;
    }

    public final String v() {
        return this.zzd;
    }

    public final snf w() {
        return this.zzg;
    }

    public final pmf x() {
        return this.zzh;
    }

    public final pmf y() {
        return this.zzk;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzo, "\u0004\u000b\u0000\u0001\u0001\f\u000b\u0000\u0001\u0000\u0001ለ\u0000\u0002ဂ\u0001\u0004ဌ\u0002\u0005\u001b\u0006ည\u0003\u0007ለ\u0004\bለ\u0005\tည\u0006\nለ\u0007\u000bለ\b\fለ\t", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", msf.class, "zzh", "zzi", "zzj", "zzk", HrUBqHumRuLe.fPxZtdDApo, "zzm", "zzn"});
        }
        if (i2 == 3) {
            return new ksf();
        }
        if (i2 == 4) {
            return new rpf(zzo);
        }
        if (i2 == 5) {
            return zzo;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzp;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (ksf.class) {
            try {
                dnfVar = zzp;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzo);
                    zzp = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
