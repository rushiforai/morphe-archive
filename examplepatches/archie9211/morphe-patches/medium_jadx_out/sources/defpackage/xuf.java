package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xuf extends ytf {
    private static final xuf zzc;
    private static volatile ouf zzd;
    private long zze;
    private int zzf;

    static {
        xuf xufVar = new xuf();
        zzc = xufVar;
        ytf.j(xuf.class, xufVar);
    }

    public static wuf x() {
        return (wuf) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (vuf.a[i - 1]) {
            case 1:
                return new xuf();
            case 2:
                return new wuf(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0002\u0002\u0004", new Object[]{"zze", "zzf"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (xuf.class) {
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

    public final long w() {
        return this.zze;
    }
}
