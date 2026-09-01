package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zpg extends fnf {
    private static final zpg zzg;
    private static volatile mof zzh;
    private String zza = "";
    private int zzd;
    private int zze;
    private int zzf;

    static {
        zpg zpgVar = new zpg();
        zzg = zpgVar;
        fnf.l(zpg.class, zpgVar);
    }

    public static xpg v() {
        return (xpg) zzg.h();
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzg, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001Ȉ\u0002\f\u0003\u000b\u0004\f", new Object[]{"zza", "zzd", "zze", "zzf"});
        }
        if (i2 == 3) {
            return new zpg();
        }
        if (i2 == 4) {
            return new xpg(zzg);
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
        synchronized (zpg.class) {
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
        this.zza = str;
    }

    public final /* synthetic */ void x(int i) {
        this.zze = i;
    }

    public final void y(int i) {
        if (i != 1) {
            this.zzd = i - 2;
        } else {
            tnf.a();
            throw null;
        }
    }

    public final void z(int i) {
        if (i != 1) {
            this.zzf = i - 2;
        } else {
            tnf.a();
            throw null;
        }
    }
}
