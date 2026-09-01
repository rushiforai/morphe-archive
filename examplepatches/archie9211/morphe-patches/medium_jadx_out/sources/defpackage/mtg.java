package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mtg extends ytf {
    public static final /* synthetic */ int a = 0;
    private static final mtg zzc;
    private static volatile ouf zzd;
    private String zze = "";
    private duf zzf = puf.e;

    static {
        mtg mtgVar = new mtg();
        zzc = mtgVar;
        ytf.j(mtg.class, mtgVar);
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (otg.a[i - 1]) {
            case 1:
                return new mtg();
            case 2:
                return new iog(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001Ȉ\u0002\u001b", new Object[]{"zze", "zzf", lsg.class});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (mtg.class) {
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
