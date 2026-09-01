package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nog extends fnf {
    private static final nog zzh;
    private static volatile mof zzi;
    private int zza;
    private int zzd;
    private fog zze;
    private pmf zzf;
    private pmf zzg;

    static {
        nog nogVar = new nog();
        zzh = nogVar;
        fnf.l(nog.class, nogVar);
    }

    public nog() {
        omf omfVar = pmf.b;
        this.zzf = omfVar;
        this.zzg = omfVar;
    }

    public static log A() {
        return (log) zzh.h();
    }

    public static nog B() {
        return zzh;
    }

    public static mof C() {
        return (mof) zzh.t(7);
    }

    public static nog z(pmf pmfVar, anf anfVar) {
        return (nog) fnf.o(zzh, pmfVar, anfVar);
    }

    public final /* synthetic */ void D(fog fogVar) {
        this.zze = fogVar;
        this.zza |= 1;
    }

    public final /* synthetic */ void E(pmf pmfVar) {
        pmfVar.getClass();
        this.zzf = pmfVar;
    }

    public final /* synthetic */ void F(pmf pmfVar) {
        pmfVar.getClass();
        this.zzg = pmfVar;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzh, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n\u0004\n", new Object[]{"zza", "zzd", "zze", "zzf", "zzg"});
        }
        if (i2 == 3) {
            return new nog();
        }
        if (i2 == 4) {
            return new log(zzh);
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
        synchronized (nog.class) {
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

    public final int v() {
        return this.zzd;
    }

    public final fog w() {
        fog fogVar = this.zze;
        return fogVar == null ? fog.x() : fogVar;
    }

    public final pmf x() {
        return this.zzf;
    }

    public final pmf y() {
        return this.zzg;
    }
}
