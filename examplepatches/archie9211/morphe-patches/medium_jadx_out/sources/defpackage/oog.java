package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oog extends ytf {
    private static final oog zzc;
    private static volatile ouf zzd;
    private int zze;
    private isg zzf;

    static {
        oog oogVar = new oog();
        zzc = oogVar;
        ytf.j(oog.class, oogVar);
    }

    public static mog t() {
        return (mog) zzc.o();
    }

    public static /* synthetic */ void u(oog oogVar, isg isgVar) {
        isgVar.getClass();
        oogVar.zzf = isgVar;
        oogVar.zze |= 1;
    }

    public static oog v() {
        return zzc;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (rog.a[i - 1]) {
            case 1:
                return new oog();
            case 2:
                return new mog(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0001\u0000\u0001\u0002\u0002\u0001\u0000\u0000\u0000\u0002ဉ\u0000", new Object[]{"zze", "zzf"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (oog.class) {
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

    public final isg w() {
        isg isgVar = this.zzf;
        return isgVar == null ? isg.y() : isgVar;
    }
}
