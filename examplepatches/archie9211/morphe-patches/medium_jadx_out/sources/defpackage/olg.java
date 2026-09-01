package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class olg extends ytf {
    private static final olg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private xlg zzg;
    private gqg zzh;

    static {
        olg olgVar = new olg();
        zzc = olgVar;
        ytf.j(olg.class, olgVar);
    }

    public static ouf A() {
        return (ouf) zzc.d(7);
    }

    public static olg u(hsf hsfVar, ptf ptfVar) {
        return (olg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(olg olgVar, xlg xlgVar) {
        olgVar.zzg = xlgVar;
        olgVar.zze |= 1;
    }

    public static /* synthetic */ void w(olg olgVar, gqg gqgVar) {
        olgVar.zzh = gqgVar;
        olgVar.zze |= 2;
    }

    public static mlg x() {
        return (mlg) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (llg.a[i - 1]) {
            case 1:
                return new olg();
            case 2:
                return new mlg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003ဉ\u0001", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (olg.class) {
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

    public final xlg y() {
        xlg xlgVar = this.zzg;
        return xlgVar == null ? xlg.x() : xlgVar;
    }

    public final gqg z() {
        gqg gqgVar = this.zzh;
        return gqgVar == null ? gqg.y() : gqgVar;
    }
}
