package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xqf extends fnf {
    private static final xqf zzn;
    private static volatile mof zzo;
    private int zza;
    private int zzg;
    private boolean zzj;
    private boolean zzk;
    private String zzd = "";
    private String zze = "";
    private String zzf = "";
    private String zzh = "";
    private String zzi = "";
    private String zzl = "";
    private String zzm = "";

    static {
        xqf xqfVar = new xqf();
        zzn = xqfVar;
        fnf.l(xqf.class, xqfVar);
    }

    public static wqf v() {
        return (wqf) zzn.h();
    }

    public final /* synthetic */ void A(String str) {
        str.getClass();
        this.zzi = str;
    }

    public final /* synthetic */ void B(boolean z) {
        this.zzj = z;
    }

    public final /* synthetic */ void C(boolean z) {
        this.zzk = z;
    }

    public final /* synthetic */ void D(String str) {
        this.zzl = str;
    }

    public final /* synthetic */ void E(String str) {
        this.zza |= 2;
        this.zzm = str;
    }

    public final /* synthetic */ void F(int i) {
        this.zzg = i - 2;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzn, "\u0000\n\u0000\u0001\u0001\n\n\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003Ȉ\u0004\f\u0005ለ\u0000\u0006Ȉ\u0007\u0007\b\u0007\tȈ\nለ\u0001", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm"});
        }
        if (i2 == 3) {
            return new xqf();
        }
        if (i2 == 4) {
            return new wqf(zzn);
        }
        if (i2 == 5) {
            return zzn;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzo;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (xqf.class) {
            try {
                dnfVar = zzo;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzn);
                    zzo = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final /* synthetic */ void w(String str) {
        str.getClass();
        this.zzd = str;
    }

    public final /* synthetic */ void x(String str) {
        str.getClass();
        this.zze = str;
    }

    public final /* synthetic */ void y(String str) {
        this.zzf = "18.9.1";
    }

    public final /* synthetic */ void z(String str) {
        str.getClass();
        this.zza |= 1;
        this.zzh = str;
    }
}
