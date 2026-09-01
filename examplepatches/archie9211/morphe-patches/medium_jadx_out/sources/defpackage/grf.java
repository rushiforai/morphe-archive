package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class grf extends fnf {
    private static final grf zzd;
    private static volatile mof zze;
    private pmf zza = pmf.b;

    static {
        grf grfVar = new grf();
        zzd = grfVar;
        fnf.l(grf.class, grfVar);
    }

    public static grf w() {
        return zzd;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzd, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\n", new Object[]{"zza"});
        }
        if (i2 == 3) {
            return new grf();
        }
        if (i2 == 4) {
            return new erf(zzd);
        }
        if (i2 == 5) {
            return zzd;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zze;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (grf.class) {
            try {
                dnfVar = zze;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzd);
                    zze = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final pmf v() {
        return this.zza;
    }

    public final /* synthetic */ void x(pmf pmfVar) {
        pmfVar.getClass();
        this.zza = pmfVar;
    }

    public final /* synthetic */ void y() {
        this.zza = zzd.zza;
    }
}
