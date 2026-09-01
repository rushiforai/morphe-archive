package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nqf extends fnf {
    private static final nqf zzj;
    private static volatile mof zzk;
    private int zza;
    private int zzd = 0;
    private Object zze;
    private oqf zzf;
    private int zzg;
    private dqf zzh;
    private iqf zzi;

    static {
        nqf nqfVar = new nqf();
        zzj = nqfVar;
        fnf.l(nqf.class, nqfVar);
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzj, "\u0000.\u0001\u0001\u0001..\u0000\u0000\u0000\u0001ဉ\u0000\u0002\f\u0003ဉ\u0001\u0004?\u0000\u0005?\u0000\u0006?\u0000\u0007?\u0000\b?\u0000\t?\u0000\n?\u0000\u000b?\u0000\f?\u0000\r?\u0000\u000e?\u0000\u000f?\u0000\u0010?\u0000\u0011?\u0000\u0012?\u0000\u0013?\u0000\u0014?\u0000\u0015?\u0000\u0016?\u0000\u0017?\u0000\u0018?\u0000\u0019ဉ\u0002\u001a?\u0000\u001b?\u0000\u001c?\u0000\u001d?\u0000\u001e?\u0000\u001f?\u0000 ?\u0000!?\u0000\"?\u0000#?\u0000$?\u0000%?\u0000&?\u0000'?\u0000(?\u0000)?\u0000*?\u0000+?\u0000,?\u0000-?\u0000.?\u0000", new Object[]{"zze", "zzd", "zza", "zzf", "zzg", "zzh", "zzi"});
        }
        if (i2 == 3) {
            return new nqf();
        }
        if (i2 == 4) {
            return new rpf(zzj);
        }
        if (i2 == 5) {
            return zzj;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzk;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (nqf.class) {
            try {
                dnfVar = zzk;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzj);
                    zzk = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
