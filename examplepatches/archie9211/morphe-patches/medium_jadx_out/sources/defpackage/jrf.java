package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jrf extends fnf {
    private static final jrf zzr;
    private static volatile mof zzs;
    private int zza;
    private String zzd = "";
    private String zze = "";
    private String zzf = "";
    private String zzg = "";
    private String zzh = "";
    private String zzi = "";
    private rnf zzj = aof.e;
    private pmf zzk = pmf.b;
    private orf zzl;
    private grf zzm;
    private trf zzn;
    private boolean zzo;
    private long zzp;
    private boolean zzq;

    static {
        jrf jrfVar = new jrf();
        zzr = jrfVar;
        fnf.l(jrf.class, jrfVar);
    }

    public static jrf G() {
        return zzr;
    }

    public final grf A() {
        grf grfVar = this.zzm;
        return grfVar == null ? grf.w() : grfVar;
    }

    public final boolean B() {
        return (this.zza & 512) != 0;
    }

    public final trf C() {
        trf trfVar = this.zzn;
        return trfVar == null ? trf.x() : trfVar;
    }

    public final boolean D() {
        return this.zzo;
    }

    public final long E() {
        return this.zzp;
    }

    public final boolean F() {
        return this.zzq;
    }

    public final /* synthetic */ void H(orf orfVar) {
        this.zzl = orfVar;
        this.zza |= 128;
    }

    public final /* synthetic */ void I(grf grfVar) {
        this.zzm = grfVar;
        this.zza |= 256;
    }

    public final /* synthetic */ void J(trf trfVar) {
        trfVar.getClass();
        this.zzn = trfVar;
        this.zza |= 512;
    }

    public final /* synthetic */ void K() {
        this.zzn = null;
        this.zza &= -513;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzr, "\u0004\u000e\u0000\u0001\u0001\u0010\u000e\u0000\u0001\u0000\u0001ለ\u0000\u0002ለ\u0001\u0003ለ\u0002\u0004ለ\u0003\u0005ለ\u0004\u0006ለ\u0005\u0007%\bည\u0006\u000bဉ\u0007\fဉ\b\rဉ\t\u000eဇ\n\u000fဂ\u000b\u0010ဇ\f", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq"});
        }
        if (i2 == 3) {
            return new jrf();
        }
        if (i2 == 4) {
            return new hrf(zzr);
        }
        if (i2 == 5) {
            return zzr;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzs;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (jrf.class) {
            try {
                dnfVar = zzs;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzr);
                    zzs = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final String v() {
        return this.zzf;
    }

    public final String w() {
        return this.zzh;
    }

    public final boolean x() {
        return (this.zza & 128) != 0;
    }

    public final orf y() {
        orf orfVar = this.zzl;
        return orfVar == null ? orf.B() : orfVar;
    }

    public final boolean z() {
        return (this.zza & 256) != 0;
    }
}
