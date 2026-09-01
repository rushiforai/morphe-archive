package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aqf extends fnf {
    private static final aqf zzk;
    private static volatile mof zzl;
    private pmf zza;
    private String zzd;
    private pmf zze;
    private String zzf;
    private String zzg;
    private pmf zzh;
    private String zzi;
    private pmf zzj;

    static {
        aqf aqfVar = new aqf();
        zzk = aqfVar;
        fnf.l(aqf.class, aqfVar);
    }

    public aqf() {
        omf omfVar = pmf.b;
        this.zza = omfVar;
        this.zzd = "";
        this.zze = omfVar;
        this.zzf = "";
        this.zzg = "";
        this.zzh = omfVar;
        this.zzi = "";
        this.zzj = omfVar;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzk, "\u0000\b\u0000\u0000\u0001\b\b\u0000\u0000\u0000\u0001\n\u0002Ȉ\u0003\n\u0004Ȉ\u0005Ȉ\u0006\n\u0007Ȉ\b\n", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i2 == 3) {
            return new aqf();
        }
        if (i2 == 4) {
            return new rpf(zzk);
        }
        if (i2 == 5) {
            return zzk;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzl;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (aqf.class) {
            try {
                dnfVar = zzl;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzk);
                    zzl = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
