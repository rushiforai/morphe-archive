package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class klg extends ytf {
    private static final klg zzc;
    private static volatile ouf zzd;
    private int zze;

    static {
        klg klgVar = new klg();
        zzc = klgVar;
        ytf.j(klg.class, klgVar);
    }

    public static jlg v() {
        return (jlg) zzc.o();
    }

    public static klg w() {
        return zzc;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (ilg.a[i - 1]) {
            case 1:
                return new klg();
            case 2:
                return new jlg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u000b", new Object[]{"zze"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (klg.class) {
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
        return this.zze;
    }
}
