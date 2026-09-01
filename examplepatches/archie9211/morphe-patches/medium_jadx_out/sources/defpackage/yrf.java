package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yrf extends fnf {
    private static final yrf zzg;
    private static volatile mof zzh;
    private int zza;
    private trf zzd;
    private String zze = "";
    private String zzf = "";

    static {
        yrf yrfVar = new yrf();
        zzg = yrfVar;
        fnf.l(yrf.class, yrfVar);
    }

    public static wrf y() {
        return (wrf) zzg.h();
    }

    public static mof z() {
        return (mof) zzg.t(7);
    }

    public final /* synthetic */ void A(trf trfVar) {
        trfVar.getClass();
        this.zzd = trfVar;
        this.zza |= 1;
    }

    public final /* synthetic */ void B(String str) {
        this.zza |= 2;
        this.zze = "18.9.1";
    }

    public final /* synthetic */ void C(String str) {
        this.zza |= 4;
        this.zzf = str;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzg, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0002ለ\u0001\u0003ለ\u0002", new Object[]{"zza", "zzd", "zze", "zzf"});
        }
        if (i2 == 3) {
            return new yrf();
        }
        if (i2 == 4) {
            return new wrf(zzg);
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
        synchronized (yrf.class) {
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

    public final trf v() {
        trf trfVar = this.zzd;
        return trfVar == null ? trf.x() : trfVar;
    }

    public final String w() {
        return this.zze;
    }

    public final String x() {
        return this.zzf;
    }
}
