package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jog extends fnf {
    private static final jog zzg;
    private static volatile mof zzh;
    private int zza;
    private int zzd;
    private nog zze;
    private pmf zzf = pmf.b;

    static {
        jog jogVar = new jog();
        zzg = jogVar;
        fnf.l(jog.class, jogVar);
    }

    public static mof A() {
        return (mof) zzg.t(7);
    }

    public static jog y(pmf pmfVar, anf anfVar) {
        return (jog) fnf.o(zzg, pmfVar, anfVar);
    }

    public static gog z() {
        return (gog) zzg.h();
    }

    public final /* synthetic */ void B(nog nogVar) {
        this.zze = nogVar;
        this.zza |= 1;
    }

    public final /* synthetic */ void C(omf omfVar) {
        omfVar.getClass();
        this.zzf = omfVar;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzg, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"zza", "zzd", "zze", "zzf"});
        }
        if (i2 == 3) {
            return new jog();
        }
        if (i2 == 4) {
            return new gog(zzg);
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
        synchronized (jog.class) {
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

    public final nog w() {
        nog nogVar = this.zze;
        return nogVar == null ? nog.B() : nogVar;
    }

    public final pmf x() {
        return this.zzf;
    }
}
