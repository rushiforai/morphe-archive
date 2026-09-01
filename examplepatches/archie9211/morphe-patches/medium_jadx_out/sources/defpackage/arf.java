package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class arf extends fnf {
    private static final arf zzi;
    private static volatile mof zzj;
    private int zza;
    private String zzd = "";
    private pmf zze;
    private String zzf;
    private String zzg;
    private pmf zzh;

    static {
        arf arfVar = new arf();
        zzi = arfVar;
        fnf.l(arf.class, arfVar);
    }

    public arf() {
        omf omfVar = pmf.b;
        this.zze = omfVar;
        this.zzf = "";
        this.zzg = "";
        this.zzh = omfVar;
    }

    public static zqf A() {
        return (zqf) zzi.h();
    }

    public static mof B() {
        return (mof) zzi.t(7);
    }

    public final /* synthetic */ void C(String str) {
        str.getClass();
        this.zza |= 1;
        this.zzd = str;
    }

    public final /* synthetic */ void D(pmf pmfVar) {
        pmfVar.getClass();
        this.zza |= 2;
        this.zze = pmfVar;
    }

    public final /* synthetic */ void E(String str) {
        str.getClass();
        this.zza |= 4;
        this.zzf = str;
    }

    public final /* synthetic */ void F(String str) {
        str.getClass();
        this.zza |= 8;
        this.zzg = str;
    }

    public final /* synthetic */ void G(pmf pmfVar) {
        pmfVar.getClass();
        this.zza |= 16;
        this.zzh = pmfVar;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzi, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001ለ\u0000\u0002ည\u0001\u0003ለ\u0002\u0004ለ\u0003\u0005ည\u0004", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh"});
        }
        if (i2 == 3) {
            return new arf();
        }
        if (i2 == 4) {
            return new zqf(zzi);
        }
        if (i2 == 5) {
            return zzi;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzj;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (arf.class) {
            try {
                dnfVar = zzj;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzi);
                    zzj = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final String v() {
        return this.zzd;
    }

    public final pmf w() {
        return this.zze;
    }

    public final String x() {
        return this.zzf;
    }

    public final String y() {
        return this.zzg;
    }

    public final pmf z() {
        return this.zzh;
    }
}
