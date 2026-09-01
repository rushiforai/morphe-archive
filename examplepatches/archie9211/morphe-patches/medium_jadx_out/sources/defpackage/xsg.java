package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xsg extends ytf {
    private static final xsg zzc;
    private static volatile ouf zzd;
    private int zze;
    private duf zzf = puf.e;

    static {
        xsg xsgVar = new xsg();
        zzc = xsgVar;
        ytf.j(xsg.class, xsgVar);
    }

    public static void u(xsg xsgVar, vsg vsgVar) {
        duf dufVarE = xsgVar.zzf;
        if (!((puf) dufVarE).a) {
            puf pufVar = (puf) dufVarE;
            dufVarE = pufVar.e(pufVar.c << 1);
            xsgVar.zzf = dufVarE;
        }
        ((puf) dufVarE).add(vsgVar);
    }

    public static wsg v() {
        return (wsg) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (tsg.a[i - 1]) {
            case 1:
                return new xsg();
            case 2:
                return new wsg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u000b\u0002\u001b", new Object[]{"zze", "zzf", vsg.class});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (xsg.class) {
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
}
