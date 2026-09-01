package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ktf extends fnf {
    private static final ktf zze;
    private static volatile mof zzf;
    private snf zza = qof.e;
    private int zzd;

    static {
        ktf ktfVar = new ktf();
        zze = ktfVar;
        fnf.l(ktf.class, ktfVar);
    }

    public static ktf v(pmf pmfVar) {
        return (ktf) fnf.n(zze, pmfVar);
    }

    public static etf w() {
        return (etf) zze.h();
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zze, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u001b\u0002\u000b", new Object[]{"zza", itf.class, "zzd"});
        }
        if (i2 == 3) {
            return new ktf();
        }
        if (i2 == 4) {
            return new etf(zze);
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
        synchronized (ktf.class) {
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

    public final void x(itf itfVar) {
        snf snfVarN = this.zza;
        if (!((fmf) snfVarN).a) {
            int size = snfVarN.size();
            snfVarN = snfVarN.n(size + size);
            this.zza = snfVarN;
        }
        snfVarN.add(itfVar);
    }

    public final void y(List list) {
        snf snfVarN = this.zza;
        if (!((fmf) snfVarN).a) {
            int size = snfVarN.size();
            snfVarN = snfVarN.n(size + size);
            this.zza = snfVarN;
        }
        cnf.b(list, snfVarN);
    }

    public final /* synthetic */ void z(int i) {
        this.zzd = i;
    }
}
