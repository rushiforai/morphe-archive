package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vsf extends fnf {
    private static final vsf zzl;
    private static volatile mof zzm;
    private int zza;
    private String zzd = "";
    private String zze = "";
    private pmf zzf;
    private pmf zzg;
    private pmf zzh;
    private qnf zzi;
    private int zzj;
    private int zzk;

    static {
        vsf vsfVar = new vsf();
        zzl = vsfVar;
        fnf.l(vsf.class, vsfVar);
    }

    public vsf() {
        omf omfVar = pmf.b;
        this.zzf = omfVar;
        this.zzg = omfVar;
        this.zzh = omfVar;
        this.zzi = gnf.e;
    }

    public static tsf B() {
        return (tsf) zzl.h();
    }

    public final pmf A() {
        return this.zzf;
    }

    public final /* synthetic */ void C() {
        this.zza &= -2;
        this.zzd = zzl.zzd;
    }

    public final /* synthetic */ void D() {
        this.zza &= -3;
        this.zze = zzl.zze;
    }

    public final /* synthetic */ void E(pmf pmfVar) {
        pmfVar.getClass();
        this.zza |= 4;
        this.zzf = pmfVar;
    }

    public final /* synthetic */ void F(pmf pmfVar) {
        pmfVar.getClass();
        this.zza |= 8;
        this.zzg = pmfVar;
    }

    public final /* synthetic */ void G(omf omfVar) {
        omfVar.getClass();
        this.zza |= 16;
        this.zzh = omfVar;
    }

    public final /* synthetic */ void H() {
        this.zzj = 2;
        this.zza |= 32;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzl, "\u0001\b\u0000\u0001\u0001\b\b\u0000\u0001\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003'\u0004᠌\u0005\u0005င\u0006\u0006ည\u0002\u0007ည\u0003\bည\u0004", new Object[]{"zza", "zzd", "zze", "zzi", "zzj", usf.a, "zzk", "zzf", "zzg", "zzh"});
        }
        if (i2 == 3) {
            return new vsf();
        }
        if (i2 == 4) {
            return new tsf(zzl);
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
        synchronized (vsf.class) {
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

    public final boolean v() {
        return (this.zza & 1) != 0;
    }

    public final String w() {
        return this.zzd;
    }

    public final boolean x() {
        return (this.zza & 2) != 0;
    }

    public final String y() {
        return this.zze;
    }

    public final boolean z() {
        return (this.zza & 4) != 0;
    }
}
