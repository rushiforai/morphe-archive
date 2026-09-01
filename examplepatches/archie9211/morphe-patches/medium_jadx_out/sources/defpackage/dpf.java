package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dpf extends fnf {
    private static final dpf zze;
    private static volatile mof zzf;
    private long zza;
    private int zzd;

    static {
        dpf dpfVar = new dpf();
        zze = dpfVar;
        fnf.l(dpf.class, dpfVar);
    }

    public static cpf x() {
        return (cpf) zze.h();
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zze, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0002\u0002\u0004", new Object[]{"zza", "zzd"});
        }
        if (i2 == 3) {
            return new dpf();
        }
        if (i2 == 4) {
            return new cpf(zze);
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
        synchronized (dpf.class) {
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

    public final long v() {
        return this.zza;
    }

    public final int w() {
        return this.zzd;
    }

    public final /* synthetic */ void y(long j) {
        this.zza = j;
    }

    public final /* synthetic */ void z(int i) {
        this.zzd = i;
    }
}
