package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ftg extends ytf {
    private static final ftg zzc;
    private static volatile ouf zzd;
    private String zze = "";

    static {
        ftg ftgVar = new ftg();
        zzc = ftgVar;
        ytf.j(ftg.class, ftgVar);
    }

    public static etg t() {
        return (etg) zzc.o();
    }

    public static ftg u(hsf hsfVar, ptf ptfVar) {
        return (ftg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(ftg ftgVar, String str) {
        str.getClass();
        ftgVar.zze = str;
    }

    public static ftg w() {
        return zzc;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (dtg.a[i - 1]) {
            case 1:
                return new ftg();
            case 2:
                return new etg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001Ȉ", new Object[]{"zze"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (ftg.class) {
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

    public final String x() {
        return this.zze;
    }
}
