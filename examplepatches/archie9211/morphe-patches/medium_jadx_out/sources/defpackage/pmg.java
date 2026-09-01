package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pmg extends ytf {
    private static final pmg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private wmg zzg;
    private hsf zzh = hsf.b;

    static {
        pmg pmgVar = new pmg();
        zzc = pmgVar;
        ytf.j(pmg.class, pmgVar);
    }

    public static ouf A() {
        return (ouf) zzc.d(7);
    }

    public static pmg u(hsf hsfVar, ptf ptfVar) {
        return (pmg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(pmg pmgVar, rsf rsfVar) {
        rsfVar.getClass();
        pmgVar.zzh = rsfVar;
    }

    public static /* synthetic */ void w(pmg pmgVar, wmg wmgVar) {
        pmgVar.zzg = wmgVar;
        pmgVar.zze |= 1;
    }

    public static nmg x() {
        return (nmg) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (mmg.a[i - 1]) {
            case 1:
                return new pmg();
            case 2:
                return new nmg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (pmg.class) {
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

    public final wmg y() {
        wmg wmgVar = this.zzg;
        return wmgVar == null ? wmg.w() : wmgVar;
    }

    public final hsf z() {
        return this.zzh;
    }
}
