package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xrg extends ytf {
    private static final xrg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private org zzg;
    private hsf zzh = hsf.b;

    static {
        xrg xrgVar = new xrg();
        zzc = xrgVar;
        ytf.j(xrg.class, xrgVar);
    }

    public static xrg A() {
        return zzc;
    }

    public static ouf C() {
        return (ouf) zzc.d(7);
    }

    public static xrg u(hsf hsfVar, ptf ptfVar) {
        return (xrg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void w(xrg xrgVar, rsf rsfVar) {
        rsfVar.getClass();
        xrgVar.zzh = rsfVar;
    }

    public static /* synthetic */ void x(xrg xrgVar, org orgVar) {
        xrgVar.zzg = orgVar;
        xrgVar.zze |= 1;
    }

    public static wrg z() {
        return (wrg) zzc.o();
    }

    public final hsf B() {
        return this.zzh;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (vrg.a[i - 1]) {
            case 1:
                return new xrg();
            case 2:
                return new wrg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (xrg.class) {
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

    public final org y() {
        org orgVar = this.zzg;
        return orgVar == null ? org.A() : orgVar;
    }
}
