package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ltg extends ytf {
    private static final ltg zzc;
    private static volatile ouf zzd;
    private int zze;
    private String zzf = "";
    private isg zzg;

    static {
        ltg ltgVar = new ltg();
        zzc = ltgVar;
        ytf.j(ltg.class, ltgVar);
    }

    public static ltg u(hsf hsfVar, ptf ptfVar) {
        return (ltg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(ltg ltgVar, String str) {
        str.getClass();
        ltgVar.zzf = str;
    }

    public static /* synthetic */ void w(ltg ltgVar, isg isgVar) {
        isgVar.getClass();
        ltgVar.zzg = isgVar;
        ltgVar.zze |= 1;
    }

    public static ktg x() {
        return (ktg) zzc.o();
    }

    public static ltg y() {
        return zzc;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (jtg.a[i - 1]) {
            case 1:
                return new ltg();
            case 2:
                return new ktg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001Ȉ\u0002ဉ\u0000", new Object[]{"zze", "zzf", "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (ltg.class) {
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

    public final isg t() {
        isg isgVar = this.zzg;
        return isgVar == null ? isg.y() : isgVar;
    }

    public final String z() {
        return this.zzf;
    }
}
