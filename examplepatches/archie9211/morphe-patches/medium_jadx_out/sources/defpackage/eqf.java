package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eqf extends fnf {
    private static final eqf zzi;
    private static volatile mof zzj;
    private String zza = "";
    private String zzd = "";
    private String zze = "";
    private String zzf = "";
    private String zzg = "";
    private String zzh = "";

    static {
        eqf eqfVar = new eqf();
        zzi = eqfVar;
        fnf.l(eqf.class, eqfVar);
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzi, "\u0000\u0006\u0000\u0000\u0001\u0006\u0006\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003Ȉ\u0004Ȉ\u0005Ȉ\u0006Ȉ", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh"});
        }
        if (i2 == 3) {
            return new eqf();
        }
        if (i2 == 4) {
            return new rpf(zzi);
        }
        if (i2 == 5) {
            return zzi;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzj;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (eqf.class) {
            try {
                dnfVar = zzj;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzi);
                    zzj = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
