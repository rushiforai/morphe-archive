package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dqf extends fnf {
    private static final dqf zzj;
    private static volatile mof zzk;
    private int zze;
    private int zzh;
    private int zzi;
    private String zza = "";
    private String zzd = "";
    private String zzf = "";
    private String zzg = "";

    static {
        dqf dqfVar = new dqf();
        zzj = dqfVar;
        fnf.l(dqf.class, dqfVar);
    }

    public static cqf v() {
        return (cqf) zzj.h();
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzj, "\u0000\u0007\u0000\u0000\u0001\u0007\u0007\u0000\u0000\u0000\u0001Ȉ\u0002\u0004\u0003Ȉ\u0004\u0004\u0005Ȉ\u0006Ȉ\u0007\u0004", new Object[]{"zza", "zze", "zzg", "zzh", "zzd", "zzf", "zzi"});
        }
        if (i2 == 3) {
            return new dqf();
        }
        if (i2 == 4) {
            return new cqf(zzj);
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
        synchronized (dqf.class) {
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

    public final /* synthetic */ void w(String str) {
        str.getClass();
        this.zza = str;
    }

    public final /* synthetic */ void x(int i) {
        this.zze = i;
    }

    public final /* synthetic */ void y(String str) {
        this.zzg = str;
    }

    public final /* synthetic */ void z(int i) {
        this.zzi = i;
    }
}
