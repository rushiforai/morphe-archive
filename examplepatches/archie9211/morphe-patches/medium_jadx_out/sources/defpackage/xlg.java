package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xlg extends ytf {
    private static final xlg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private lmg zzg;
    private hsf zzh = hsf.b;

    static {
        xlg xlgVar = new xlg();
        zzc = xlgVar;
        ytf.j(xlg.class, xlgVar);
    }

    public static /* synthetic */ void u(xlg xlgVar, rsf rsfVar) {
        rsfVar.getClass();
        xlgVar.zzh = rsfVar;
    }

    public static /* synthetic */ void v(xlg xlgVar, lmg lmgVar) {
        xlgVar.zzg = lmgVar;
        xlgVar.zze |= 1;
    }

    public static vlg w() {
        return (vlg) zzc.o();
    }

    public static xlg x() {
        return zzc;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (ulg.a[i - 1]) {
            case 1:
                return new xlg();
            case 2:
                return new vlg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (xlg.class) {
                    try {
                        wtfVar = zzd;
                        if (wtfVar == null) {
                            wtfVar = new wtf();
                            zzd = wtfVar;
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                    break;
                }
                return wtfVar;
            case 6:
                return (byte) 1;
            default:
                throw null;
        }
    }

    public final int t() {
        return this.zzf;
    }

    public final lmg y() {
        lmg lmgVar = this.zzg;
        return lmgVar == null ? lmg.w() : lmgVar;
    }

    public final hsf z() {
        return this.zzh;
    }
}
