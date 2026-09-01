package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aqg extends fnf {
    private static final aqg zze;
    private static volatile mof zzf;
    private int zza;
    private snf zzd = qof.e;

    static {
        aqg aqgVar = new aqg();
        zze = aqgVar;
        fnf.l(aqg.class, aqgVar);
    }

    public static vpg v() {
        return (vpg) zze.h();
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zze, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u000b\u0002\u001b", new Object[]{"zza", "zzd", zpg.class});
        }
        if (i2 == 3) {
            return new aqg();
        }
        if (i2 == 4) {
            return new vpg(zze);
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
        synchronized (aqg.class) {
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

    public final /* synthetic */ void w(int i) {
        this.zza = i;
    }

    public final void x(zpg zpgVar) {
        snf snfVarN = this.zzd;
        if (!((fmf) snfVarN).a) {
            int size = snfVarN.size();
            snfVarN = snfVarN.n(size + size);
            this.zzd = snfVarN;
        }
        snfVarN.add(zpgVar);
    }
}
