package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class trf extends fnf {
    private static final trf zzg;
    private static volatile mof zzh;
    private int zza;
    private pmf zzd;
    private pmf zze;
    private boolean zzf;

    static {
        trf trfVar = new trf();
        zzg = trfVar;
        fnf.l(trf.class, trfVar);
    }

    public trf() {
        omf omfVar = pmf.b;
        this.zzd = omfVar;
        this.zze = omfVar;
    }

    public static trf x() {
        return zzg;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzg, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\n\u0002\n\u0003ဇ\u0000", new Object[]{"zza", "zzd", "zze", "zzf"});
        }
        if (i2 == 3) {
            return new trf();
        }
        if (i2 == 4) {
            return new rpf(zzg);
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
        synchronized (trf.class) {
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

    public final pmf v() {
        return this.zzd;
    }

    public final pmf w() {
        return this.zze;
    }
}
