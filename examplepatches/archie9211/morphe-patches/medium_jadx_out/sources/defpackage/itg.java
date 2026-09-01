package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class itg extends ytf {
    private static final itg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private ltg zzg;

    static {
        itg itgVar = new itg();
        zzc = itgVar;
        ytf.j(itg.class, itgVar);
    }

    public static itg u(hsf hsfVar, ptf ptfVar) {
        return (itg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(itg itgVar, ltg ltgVar) {
        itgVar.zzg = ltgVar;
        itgVar.zze |= 1;
    }

    public static htg w() {
        return (htg) zzc.o();
    }

    public static ouf y() {
        return (ouf) zzc.d(7);
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (gtg.a[i - 1]) {
            case 1:
                return new itg();
            case 2:
                return new htg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000", new Object[]{"zze", "zzf", "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (itg.class) {
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

    public final ltg x() {
        ltg ltgVar = this.zzg;
        return ltgVar == null ? ltg.y() : ltgVar;
    }
}
