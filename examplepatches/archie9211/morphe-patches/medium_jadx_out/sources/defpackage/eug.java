package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eug extends ytf {
    private static final eug zzc;
    private static volatile ouf zzd;
    private int zze;
    private hsf zzf = hsf.b;

    static {
        eug eugVar = new eug();
        zzc = eugVar;
        ytf.j(eug.class, eugVar);
    }

    public static eug u(hsf hsfVar, ptf ptfVar) {
        return (eug) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(eug eugVar, rsf rsfVar) {
        rsfVar.getClass();
        eugVar.zzf = rsfVar;
    }

    public static cug w() {
        return (cug) zzc.o();
    }

    public static ouf y() {
        return (ouf) zzc.d(7);
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (gug.a[i - 1]) {
            case 1:
                return new eug();
            case 2:
                return new cug(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0001\u0003\u0002\u0000\u0000\u0000\u0001\u000b\u0003\n", new Object[]{"zze", "zzf"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (eug.class) {
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

    public final hsf x() {
        return this.zzf;
    }
}
