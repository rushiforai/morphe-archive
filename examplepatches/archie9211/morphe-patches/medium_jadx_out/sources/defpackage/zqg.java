package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zqg extends fnf {
    private static final zqg zzl;
    private static volatile mof zzm;
    private int zza;
    private int zzd;
    private crg zze;
    private pmf zzf;
    private pmf zzg;
    private pmf zzh;
    private pmf zzi;
    private pmf zzj;
    private pmf zzk;

    static {
        zqg zqgVar = new zqg();
        zzl = zqgVar;
        fnf.l(zqg.class, zqgVar);
    }

    public zqg() {
        omf omfVar = pmf.b;
        this.zzf = omfVar;
        this.zzg = omfVar;
        this.zzh = omfVar;
        this.zzi = omfVar;
        this.zzj = omfVar;
        this.zzk = omfVar;
    }

    public static zqg D(pmf pmfVar, anf anfVar) {
        return (zqg) fnf.o(zzl, pmfVar, anfVar);
    }

    public static xqg E() {
        return (xqg) zzl.h();
    }

    public static mof F() {
        return (mof) zzl.t(7);
    }

    public final pmf A() {
        return this.zzi;
    }

    public final pmf B() {
        return this.zzj;
    }

    public final pmf C() {
        return this.zzk;
    }

    public final /* synthetic */ void G() {
        this.zzd = 0;
    }

    public final /* synthetic */ void H(crg crgVar) {
        this.zze = crgVar;
        this.zza |= 1;
    }

    public final /* synthetic */ void I(omf omfVar) {
        omfVar.getClass();
        this.zzf = omfVar;
    }

    public final /* synthetic */ void J(omf omfVar) {
        omfVar.getClass();
        this.zzg = omfVar;
    }

    public final /* synthetic */ void K(omf omfVar) {
        omfVar.getClass();
        this.zzh = omfVar;
    }

    public final /* synthetic */ void L(omf omfVar) {
        omfVar.getClass();
        this.zzi = omfVar;
    }

    public final /* synthetic */ void M(omf omfVar) {
        omfVar.getClass();
        this.zzj = omfVar;
    }

    public final /* synthetic */ void N(omf omfVar) {
        omfVar.getClass();
        this.zzk = omfVar;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzl, "\u0000\b\u0000\u0001\u0001\b\b\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n\u0004\n\u0005\n\u0006\n\u0007\n\b\n", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk"});
        }
        if (i2 == 3) {
            return new zqg();
        }
        if (i2 == 4) {
            return new xqg(zzl);
        }
        if (i2 == 5) {
            return zzl;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzm;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (zqg.class) {
            try {
                dnfVar = zzm;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzl);
                    zzm = dnfVar;
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

    public final crg w() {
        crg crgVar = this.zze;
        return crgVar == null ? crg.B() : crgVar;
    }

    public final pmf x() {
        return this.zzf;
    }

    public final pmf y() {
        return this.zzg;
    }

    public final pmf z() {
        return this.zzh;
    }
}
