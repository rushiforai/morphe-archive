package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ssf extends fnf {
    private static final ssf zzk;
    private static volatile mof zzl;
    private int zza;
    private long zzd;
    private long zze;
    private int zzf;
    private long zzg;
    private int zzh;
    private int zzi;
    private int zzj;

    static {
        ssf ssfVar = new ssf();
        zzk = ssfVar;
        fnf.l(ssf.class, ssfVar);
    }

    public static ssf y(byte[] bArr) {
        return (ssf) fnf.p(zzk, bArr);
    }

    public final int A() {
        int i = this.zzi;
        int i2 = i != 0 ? i != 1 ? i != 2 ? 0 : 4 : 3 : 2;
        if (i2 == 0) {
            return 1;
        }
        return i2;
    }

    public final int B() {
        int i = this.zzj;
        int i2 = i != 0 ? i != 1 ? i != 2 ? 0 : 4 : 3 : 2;
        if (i2 == 0) {
            return 1;
        }
        return i2;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzk, "\u0004\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0000\u0000\u0001ဂ\u0000\u0002ဂ\u0001\u0003င\u0002\u0004ဂ\u0003\u0005ဌ\u0004\u0006ဌ\u0005\u0007ဌ\u0006", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i2 == 3) {
            return new ssf();
        }
        if (i2 == 4) {
            return new rpf(zzk);
        }
        if (i2 == 5) {
            return zzk;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzl;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (ssf.class) {
            try {
                dnfVar = zzl;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzk);
                    zzl = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final long v() {
        return this.zze;
    }

    public final int w() {
        return this.zzf;
    }

    public final long x() {
        return this.zzg;
    }

    public final int z() {
        int i = this.zzh;
        int i2 = i != 0 ? i != 1 ? i != 2 ? 0 : 4 : 3 : 2;
        if (i2 == 0) {
            return 1;
        }
        return i2;
    }
}
