package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gqg extends ytf {
    private static final gqg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private tqg zzg;
    private hsf zzh = hsf.b;

    static {
        gqg gqgVar = new gqg();
        zzc = gqgVar;
        ytf.j(gqg.class, gqgVar);
    }

    public static ouf B() {
        return (ouf) zzc.d(7);
    }

    public static gqg u(hsf hsfVar, ptf ptfVar) {
        return (gqg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(gqg gqgVar, hsf hsfVar) {
        hsfVar.getClass();
        gqgVar.zzh = hsfVar;
    }

    public static /* synthetic */ void w(gqg gqgVar, tqg tqgVar) {
        gqgVar.zzg = tqgVar;
        gqgVar.zze |= 1;
    }

    public static eqg x() {
        return (eqg) zzc.o();
    }

    public static gqg y() {
        return zzc;
    }

    public final hsf A() {
        return this.zzh;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (kqg.a[i - 1]) {
            case 1:
                return new gqg();
            case 2:
                return new eqg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (gqg.class) {
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

    public final tqg z() {
        tqg tqgVar = this.zzg;
        return tqgVar == null ? tqg.y() : tqgVar;
    }
}
