package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class crg extends fnf {
    private static final crg zzh;
    private static volatile mof zzi;
    private int zza;
    private int zzd;
    private vqg zze;
    private pmf zzf;
    private pmf zzg;

    static {
        crg crgVar = new crg();
        zzh = crgVar;
        fnf.l(crg.class, crgVar);
    }

    public crg() {
        omf omfVar = pmf.b;
        this.zzf = omfVar;
        this.zzg = omfVar;
    }

    public static arg A() {
        return (arg) zzh.h();
    }

    public static crg B() {
        return zzh;
    }

    public static mof C() {
        return (mof) zzh.t(7);
    }

    public static crg z(pmf pmfVar, anf anfVar) {
        return (crg) fnf.o(zzh, pmfVar, anfVar);
    }

    public final /* synthetic */ void D(int i) {
        this.zzd = 0;
    }

    public final /* synthetic */ void E(vqg vqgVar) {
        this.zze = vqgVar;
        this.zza |= 1;
    }

    public final /* synthetic */ void F(pmf pmfVar) {
        pmfVar.getClass();
        this.zzf = pmfVar;
    }

    public final /* synthetic */ void G(omf omfVar) {
        omfVar.getClass();
        this.zzg = omfVar;
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
            return new crg();
        }
        if (i2 == 4) {
            return new arg(zzh);
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
        synchronized (crg.class) {
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

    public final vqg w() {
        vqg vqgVar = this.zze;
        return vqgVar == null ? vqg.z() : vqgVar;
    }

    public final pmf x() {
        return this.zzf;
    }

    public final pmf y() {
        return this.zzg;
    }
}
