package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tog extends fnf {
    private static final tog zzg;
    private static volatile mof zzh;
    private int zza;
    private int zzd;
    private pmf zze = pmf.b;
    private wog zzf;

    static {
        tog togVar = new tog();
        zzg = togVar;
        fnf.l(tog.class, togVar);
    }

    public static mof A() {
        return (mof) zzg.t(7);
    }

    public static tog y(pmf pmfVar, anf anfVar) {
        return (tog) fnf.o(zzg, pmfVar, anfVar);
    }

    public static qog z() {
        return (qog) zzg.h();
    }

    public final /* synthetic */ void B(omf omfVar) {
        omfVar.getClass();
        this.zze = omfVar;
    }

    public final /* synthetic */ void C(wog wogVar) {
        this.zzf = wogVar;
        this.zza |= 1;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzg, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002\n\u0003ဉ\u0000", new Object[]{"zza", "zzd", "zze", "zzf"});
        }
        if (i2 == 3) {
            return new tog();
        }
        if (i2 == 4) {
            return new qog(zzg);
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
        synchronized (tog.class) {
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

    public final int v() {
        return this.zzd;
    }

    public final pmf w() {
        return this.zze;
    }

    public final wog x() {
        wog wogVar = this.zzf;
        return wogVar == null ? wog.z() : wogVar;
    }
}
