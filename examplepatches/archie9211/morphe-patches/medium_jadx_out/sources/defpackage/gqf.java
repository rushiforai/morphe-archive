package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gqf extends fnf {
    private static final gqf zze;
    private static volatile mof zzf;
    private String zza = "";
    private String zzd = "";

    static {
        gqf gqfVar = new gqf();
        zze = gqfVar;
        fnf.l(gqf.class, gqfVar);
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zze, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ", new Object[]{"zza", "zzd"});
        }
        if (i2 == 3) {
            return new gqf();
        }
        if (i2 == 4) {
            return new rpf(zze);
        }
        if (i2 == 5) {
            return zze;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzf;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (gqf.class) {
            try {
                dnfVar = zzf;
                if (dnfVar == null) {
                    dnfVar = new dnf(zze);
                    zzf = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
