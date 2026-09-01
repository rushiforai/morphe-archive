package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iqf extends fnf {
    private static final iqf zzj;
    private static volatile mof zzk;
    private int zza;
    private int zze;
    private int zzg;
    private int zzi;
    private String zzd = "";
    private String zzf = "";
    private String zzh = "";

    static {
        iqf iqfVar = new iqf();
        zzj = iqfVar;
        fnf.l(iqf.class, iqfVar);
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzj, "\u0000\u0007\u0000\u0000\u0001\u0007\u0007\u0000\u0000\u0000\u0001\u0004\u0002Ȉ\u0003\u0004\u0004Ȉ\u0005\u0004\u0006Ȉ\u0007\u0004", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi"});
        }
        if (i2 == 3) {
            return new iqf();
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
        synchronized (iqf.class) {
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
