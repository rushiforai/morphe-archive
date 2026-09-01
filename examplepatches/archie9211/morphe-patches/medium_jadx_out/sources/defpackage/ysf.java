package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ysf extends fnf {
    private static final ysf zzf;
    private static volatile mof zzg;
    private int zza;
    private String zzd = "";
    private snf zze = qof.e;

    static {
        ysf ysfVar = new ysf();
        zzf = ysfVar;
        fnf.l(ysf.class, ysfVar);
    }

    public static ysf w(omf omfVar) {
        return (ysf) fnf.n(zzf, omfVar);
    }

    public static ysf x(byte[] bArr) {
        return (ysf) fnf.p(zzf, bArr);
    }

    public static wsf y() {
        return (wsf) zzf.h();
    }

    public final void A(vsf vsfVar) {
        snf snfVarN = this.zze;
        if (!((fmf) snfVarN).a) {
            int size = snfVarN.size();
            snfVarN = snfVarN.n(size + size);
            this.zze = snfVarN;
        }
        snfVarN.add(vsfVar);
    }

    public final void B(ArrayList arrayList) {
        snf snfVarN = this.zze;
        if (!((fmf) snfVarN).a) {
            int size = snfVarN.size();
            snfVarN = snfVarN.n(size + size);
            this.zze = snfVarN;
        }
        cnf.b(arrayList, snfVarN);
    }

    public final void C() {
        this.zze = qof.e;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzf, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u001b\u0002ဈ\u0000", new Object[]{"zza", "zze", vsf.class, "zzd"});
        }
        if (i2 == 3) {
            return new ysf();
        }
        if (i2 == 4) {
            return new wsf(zzf);
        }
        if (i2 == 5) {
            return zzf;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzg;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (ysf.class) {
            try {
                dnfVar = zzg;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzf);
                    zzg = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final snf v() {
        return this.zze;
    }

    public final /* synthetic */ void z(String str) {
        str.getClass();
        this.zza |= 1;
        this.zzd = str;
    }
}
