package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oqf extends fnf {
    private static final oqf zzh;
    private static volatile mof zzi;
    private int zza;
    private zmf zzd;
    private dpf zze;
    private zmf zzf;
    private dpf zzg;

    static {
        oqf oqfVar = new oqf();
        zzh = oqfVar;
        fnf.l(oqf.class, oqfVar);
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzh, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0003ဉ\u0002\u0004ဉ\u0003", new Object[]{"zza", "zzd", "zze", "zzf", "zzg"});
        }
        if (i2 == 3) {
            return new oqf();
        }
        if (i2 == 4) {
            return new rpf(zzh);
        }
        if (i2 == 5) {
            return zzh;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzi;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (oqf.class) {
            try {
                dnfVar = zzi;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzh);
                    zzi = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
