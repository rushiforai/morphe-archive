package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nqg extends ytf {
    private static final nqg zzc;
    private static volatile ouf zzd;
    private int zze;
    private tqg zzf;
    private int zzg;
    private int zzh;

    static {
        nqg nqgVar = new nqg();
        zzc = nqgVar;
        ytf.j(nqg.class, nqgVar);
    }

    public static nqg u(hsf hsfVar, ptf ptfVar) {
        return (nqg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void w(nqg nqgVar, tqg tqgVar) {
        nqgVar.zzf = tqgVar;
        nqgVar.zze |= 1;
    }

    public static lqg y() {
        return (lqg) zzc.o();
    }

    public static nqg z() {
        return zzc;
    }

    public final tqg A() {
        tqg tqgVar = this.zzf;
        return tqgVar == null ? tqg.y() : tqgVar;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (qqg.a[i - 1]) {
            case 1:
                return new nqg();
            case 2:
                return new lqg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0002\u000b\u0003\u000b", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (nqg.class) {
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
        return this.zzg;
    }

    public final int x() {
        return this.zzh;
    }
}
