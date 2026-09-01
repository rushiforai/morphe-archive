package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class stf extends fnf {
    private static final stf zze;
    private static volatile mof zzf;
    private int zza = 0;
    private Object zzd;

    static {
        stf stfVar = new stf();
        zze = stfVar;
        fnf.l(stf.class, stfVar);
    }

    public static stf x(byte[] bArr) {
        return (stf) fnf.p(zze, bArr);
    }

    public static rtf y() {
        return (rtf) zze.h();
    }

    public final int A() {
        int i = this.zza;
        if (i == 0) {
            return 3;
        }
        int i2 = 1;
        if (i != 1) {
            i2 = 2;
            if (i != 2) {
                return 0;
            }
        }
        return i2;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zze, "\u0000\u0002\u0001\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001<\u0000\u0002<\u0000", new Object[]{"zzd", "zza", kqf.class, tqf.class});
        }
        if (i2 == 3) {
            return new stf();
        }
        if (i2 == 4) {
            return new rtf(zze);
        }
        if (i2 == 5) {
            return zze;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzf;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (stf.class) {
            try {
                dnfVar = zzf;
                if (dnfVar == null) {
                    dnfVar = new dnf(zze);
                    zzf = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final kqf v() {
        return this.zza == 1 ? (kqf) this.zzd : kqf.A();
    }

    public final tqf w() {
        return this.zza == 2 ? (tqf) this.zzd : tqf.v();
    }

    public final /* synthetic */ void z(kqf kqfVar) {
        this.zzd = kqfVar;
        this.zza = 1;
    }
}
