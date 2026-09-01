package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kog extends ytf {
    private static final kog zzc;
    private static volatile ouf zzd;

    static {
        kog kogVar = new kog();
        zzc = kogVar;
        ytf.j(kog.class, kogVar);
    }

    public static void t(hsf hsfVar, ptf ptfVar) {
    }

    public static kog u() {
        return zzc;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (hog.a[i - 1]) {
            case 1:
                return new kog();
            case 2:
                return new iog(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0000", null);
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (kog.class) {
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
