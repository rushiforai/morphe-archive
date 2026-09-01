package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class srf extends fnf {
    private static final srf zzg;
    private static volatile mof zzh;
    private int zza;
    private ysf zze;
    private String zzd = "";
    private pmf zzf = pmf.b;

    static {
        srf srfVar = new srf();
        zzg = srfVar;
        fnf.l(srf.class, srfVar);
    }

    public static qrf v() {
        return (qrf) zzg.h();
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzg, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ለ\u0000\u0002ဉ\u0001\u0003ည\u0002", new Object[]{"zza", "zzd", "zze", "zzf"});
        }
        if (i2 == 3) {
            return new srf();
        }
        if (i2 == 4) {
            return new qrf(zzg);
        }
        if (i2 == 5) {
            return zzg;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzh;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (srf.class) {
            try {
                dnfVar = zzh;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzg);
                    zzh = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final /* synthetic */ void w(ysf ysfVar) {
        this.zze = ysfVar;
        this.zza |= 2;
    }

    public final /* synthetic */ void x(pmf pmfVar) {
        pmfVar.getClass();
        this.zza |= 4;
        this.zzf = pmfVar;
    }
}
