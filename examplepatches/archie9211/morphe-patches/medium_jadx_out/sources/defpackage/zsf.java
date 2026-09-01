package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zsf extends fnf {
    private static final zsf zzf;
    private static volatile mof zzg;
    private String zza = "";
    private String zzd = "";
    private String zze = "";

    static {
        zsf zsfVar = new zsf();
        zzf = zsfVar;
        fnf.l(zsf.class, zsfVar);
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzf, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003Ȉ", new Object[]{"zza", "zzd", "zze"});
        }
        if (i2 == 3) {
            return new zsf();
        }
        if (i2 == 4) {
            return new rpf(zzf);
        }
        if (i2 == 5) {
            return zzf;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzg;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (zsf.class) {
            try {
                dnfVar = zzg;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzf);
                    zzg = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
