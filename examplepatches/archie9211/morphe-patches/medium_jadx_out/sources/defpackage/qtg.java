package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qtg extends ytf {
    private static final qtg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private ztg zzg;
    private hsf zzh = hsf.b;

    static {
        qtg qtgVar = new qtg();
        zzc = qtgVar;
        ytf.j(qtg.class, qtgVar);
    }

    public static qtg u(hsf hsfVar, ptf ptfVar) {
        return (qtg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(qtg qtgVar, rsf rsfVar) {
        rsfVar.getClass();
        qtgVar.zzh = rsfVar;
    }

    public static /* synthetic */ void w(qtg qtgVar, ztg ztgVar) {
        qtgVar.zzg = ztgVar;
        qtgVar.zze |= 1;
    }

    public static ptg x() {
        return (ptg) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (stg.a[i - 1]) {
            case 1:
                return new qtg();
            case 2:
                return new ptg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (qtg.class) {
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

    public final ztg y() {
        ztg ztgVar = this.zzg;
        return ztgVar == null ? ztg.w() : ztgVar;
    }

    public final hsf z() {
        return this.zzh;
    }
}
