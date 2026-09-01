package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ntf extends fnf {
    private static final ntf zzq;
    private static volatile mof zzr;
    private int zza;
    private int zzg;
    private boolean zzk;
    private boolean zzl;
    private String zzd = "";
    private String zze = "";
    private String zzf = "";
    private String zzh = "";
    private String zzi = "";
    private String zzj = "";
    private String zzm = "";
    private String zzn = "";
    private String zzo = "";
    private String zzp = "";

    static {
        ntf ntfVar = new ntf();
        zzq = ntfVar;
        fnf.l(ntf.class, ntfVar);
    }

    public static mtf v() {
        return (mtf) zzq.h();
    }

    public final /* synthetic */ void A(String str) {
        str.getClass();
        this.zzi = str;
    }

    public final /* synthetic */ void B(String str) {
        this.zzj = str;
    }

    public final /* synthetic */ void C(boolean z) {
        this.zzk = z;
    }

    public final /* synthetic */ void D(boolean z) {
        this.zzl = z;
    }

    public final /* synthetic */ void E(String str) {
        this.zzm = str;
    }

    public final /* synthetic */ void F(String str) {
        this.zza |= 1;
        this.zzn = str;
    }

    public final /* synthetic */ void G(int i) {
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
            return new rof(zzq, "\u0000\r\u0000\u0001\u0001\u000e\r\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003Ȉ\u0004\f\u0006Ȉ\u0007Ȉ\bȈ\t\u0007\n\u0007\u000bȈ\fለ\u0000\rለ\u0001\u000eለ\u0002", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp"});
        }
        if (i2 == 3) {
            return new ntf();
        }
        if (i2 == 4) {
            return new mtf(zzq);
        }
        if (i2 == 5) {
            return zzq;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzr;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (ntf.class) {
            try {
                dnfVar = zzr;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzq);
                    zzr = dnfVar;
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
        this.zzh = str;
    }
}
