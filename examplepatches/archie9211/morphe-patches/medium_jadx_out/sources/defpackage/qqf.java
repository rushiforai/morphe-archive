package defpackage;

import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class qqf extends fnf {
    private static final qqf zzj;
    private static volatile mof zzk;
    private int zza;
    private eqf zze;
    private ypf zzf;
    private gqf zzg;
    private String zzd = "";
    private String zzh = "";
    private String zzi = "";

    static {
        qqf qqfVar = new qqf();
        zzj = qqfVar;
        fnf.l(qqf.class, qqfVar);
    }

    public static pqf v() {
        return (pqf) zzj.h();
    }

    public final /* synthetic */ void w(String str) {
        str.getClass();
        this.zzd = str;
    }

    public final /* synthetic */ void x(ypf ypfVar) {
        this.zzf = ypfVar;
        this.zza |= 2;
    }

    public final /* synthetic */ void y(String str) {
        this.zzh = str;
    }

    public final /* synthetic */ void z(String str) {
        this.zzi = str;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzj, "\u0000\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001Ȉ\u0002ဉ\u0000\u0003ဉ\u0001\u0004ဉ\u0002\u0005Ȉ\u0006Ȉ", new Object[]{"zza", "zzd", eoLmc.epVXaJ, "zzf", "zzg", "zzh", "zzi"});
        }
        if (i2 == 3) {
            return new qqf();
        }
        if (i2 == 4) {
            return new pqf(zzj);
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
        synchronized (qqf.class) {
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
}
