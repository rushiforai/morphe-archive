package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class orf extends fnf {
    private static final orf zzj;
    private static volatile mof zzk;
    private pmf zza;
    private String zzd;
    private long zze;
    private pmf zzf;
    private String zzg;
    private String zzh;
    private boolean zzi;

    static {
        orf orfVar = new orf();
        zzj = orfVar;
        fnf.l(orf.class, orfVar);
    }

    public orf() {
        omf omfVar = pmf.b;
        this.zza = omfVar;
        this.zzd = "";
        this.zzf = omfVar;
        this.zzg = "";
        this.zzh = "";
    }

    public static orf B() {
        return zzj;
    }

    public final String A() {
        return this.zzh;
    }

    public final /* synthetic */ void C(String str) {
        str.getClass();
        this.zzd = str;
    }

    public final /* synthetic */ void D() {
        this.zzd = zzj.zzd;
    }

    public final /* synthetic */ void E(pmf pmfVar) {
        pmfVar.getClass();
        this.zzf = pmfVar;
    }

    public final /* synthetic */ void F() {
        this.zzf = zzj.zzf;
    }

    public final /* synthetic */ void G(String str) {
        str.getClass();
        this.zzg = str;
    }

    public final /* synthetic */ void H() {
        this.zzg = zzj.zzg;
    }

    public final /* synthetic */ void I(String str) {
        str.getClass();
        this.zzh = str;
    }

    public final /* synthetic */ void J() {
        this.zzh = zzj.zzh;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzj, "\u0004\u0007\u0000\u0000\u0001\u0007\u0007\u0000\u0000\u0000\u0001\n\u0002Ȉ\u0003\u0002\u0004\n\u0005Ȉ\u0006Ȉ\u0007\u0007", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi"});
        }
        if (i2 == 3) {
            return new orf();
        }
        if (i2 == 4) {
            return new mrf(zzj);
        }
        if (i2 == 5) {
            return zzj;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzk;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (orf.class) {
            try {
                dnfVar = zzk;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzj);
                    zzk = dnfVar;
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

    public final String w() {
        return this.zzd;
    }

    public final long x() {
        return this.zze;
    }

    public final pmf y() {
        return this.zzf;
    }

    public final String z() {
        return this.zzg;
    }
}
