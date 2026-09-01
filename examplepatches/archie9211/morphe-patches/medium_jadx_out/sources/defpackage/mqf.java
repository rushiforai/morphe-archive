package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mqf extends fnf {
    private static final mqf zzg;
    private static volatile mof zzh;
    private int zza;
    private snf zzd;
    private snf zze;
    private aqf zzf;

    static {
        mqf mqfVar = new mqf();
        zzg = mqfVar;
        fnf.l(mqf.class, mqfVar);
    }

    public mqf() {
        qof qofVar = qof.e;
        this.zzd = qofVar;
        this.zze = qofVar;
    }

    public static lqf x() {
        return (lqf) zzg.h();
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzg, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0002\u0000\u0001\u001b\u0002\u001b\u0003ဉ\u0000", new Object[]{"zza", "zzd", kqf.class, "zze", tqf.class, "zzf"});
        }
        if (i2 == 3) {
            return new mqf();
        }
        if (i2 == 4) {
            return new lqf(zzg);
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
        synchronized (mqf.class) {
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

    public final int v() {
        return this.zzd.size();
    }

    public final int w() {
        return this.zze.size();
    }

    public final void y(kqf kqfVar) {
        kqfVar.getClass();
        snf snfVarN = this.zzd;
        if (!((fmf) snfVarN).a) {
            int size = snfVarN.size();
            snfVarN = snfVarN.n(size + size);
            this.zzd = snfVarN;
        }
        snfVarN.add(kqfVar);
    }

    public final void z(tqf tqfVar) {
        tqfVar.getClass();
        snf snfVarN = this.zze;
        if (!((fmf) snfVarN).a) {
            int size = snfVarN.size();
            snfVarN = snfVarN.n(size + size);
            this.zze = snfVarN;
        }
        snfVarN.add(tqfVar);
    }
}
