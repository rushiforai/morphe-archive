package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tqf extends fnf {
    private static final tqf zzm;
    private static volatile mof zzn;
    private int zza;
    private int zzd;
    private int zze;
    private zmf zzh;
    private dpf zzi;
    private int zzj;
    private iqf zzk;
    private String zzf = "";
    private String zzg = "";
    private snf zzl = qof.e;

    static {
        tqf tqfVar = new tqf();
        zzm = tqfVar;
        fnf.l(tqf.class, tqfVar);
    }

    public static tqf v() {
        return zzm;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzm, "\u0000\t\u0000\u0001\u0001\u000b\t\u0000\u0001\u0000\u0001\u0004\u0003ဉ\u0000\u0004ဉ\u0001\u0005\f\u0007\u001b\b\f\tȈ\nȈ\u000bဉ\u0002", new Object[]{"zza", "zzd", "zzh", "zzi", "zzj", "zzl", nqf.class, "zze", "zzf", "zzg", "zzk"});
        }
        if (i2 == 3) {
            return new tqf();
        }
        if (i2 == 4) {
            return new rpf(zzm);
        }
        if (i2 == 5) {
            return zzm;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzn;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (tqf.class) {
            try {
                dnfVar = zzn;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzm);
                    zzn = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
