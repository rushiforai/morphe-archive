package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wog extends fnf {
    private static final wog zze;
    private static volatile mof zzf;
    private int zza;
    private pmf zzd = pmf.b;

    static {
        wog wogVar = new wog();
        zze = wogVar;
        fnf.l(wog.class, wogVar);
    }

    public static mof A() {
        return (mof) zze.t(7);
    }

    public static wog x(pmf pmfVar, anf anfVar) {
        return (wog) fnf.o(zze, pmfVar, anfVar);
    }

    public static vog y() {
        return (vog) zze.h();
    }

    public static wog z() {
        return zze;
    }

    public final /* synthetic */ void B(omf omfVar) {
        omfVar.getClass();
        this.zzd = omfVar;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zze, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002\n", new Object[]{"zza", "zzd"});
        }
        if (i2 == 3) {
            return new wog();
        }
        if (i2 == 4) {
            return new vog(zze);
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
        synchronized (wog.class) {
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

    public final int v() {
        return this.zza;
    }

    public final pmf w() {
        return this.zzd;
    }
}
