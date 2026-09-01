package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class osf extends fnf {
    private static final osf zzg;
    private static volatile mof zzh;
    private int zza;
    private String zzd = "";
    private String zze = "";
    private dsf zzf;

    static {
        osf osfVar = new osf();
        zzg = osfVar;
        fnf.l(osf.class, osfVar);
    }

    public static nsf v() {
        return (nsf) zzg.h();
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzg, "\u0004\u0003\u0000\u0001\u0002\u0004\u0003\u0000\u0000\u0000\u0002ለ\u0000\u0003ለ\u0001\u0004ဉ\u0002", new Object[]{"zza", "zzd", "zze", "zzf"});
        }
        if (i2 == 3) {
            return new osf();
        }
        if (i2 == 4) {
            return new nsf(zzg);
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
        synchronized (osf.class) {
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

    public final /* synthetic */ void w(String str) {
        str.getClass();
        this.zza |= 1;
        this.zzd = str;
    }

    public final /* synthetic */ void x(String str) {
        str.getClass();
        this.zza |= 2;
        this.zze = str;
    }

    public final /* synthetic */ void y(dsf dsfVar) {
        this.zzf = dsfVar;
        this.zza |= 4;
    }
}
