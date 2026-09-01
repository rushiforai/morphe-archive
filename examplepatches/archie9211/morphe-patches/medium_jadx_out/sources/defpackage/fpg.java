package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fpg extends ytf {
    private static final fpg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private jpg zzg;
    private hsf zzh = hsf.b;

    static {
        fpg fpgVar = new fpg();
        zzc = fpgVar;
        ytf.j(fpg.class, fpgVar);
    }

    public static ouf B() {
        return (ouf) zzc.d(7);
    }

    public static fpg u(hsf hsfVar, ptf ptfVar) {
        return (fpg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void w(fpg fpgVar, hsf hsfVar) {
        hsfVar.getClass();
        fpgVar.zzh = hsfVar;
    }

    public static /* synthetic */ void x(fpg fpgVar, jpg jpgVar) {
        fpgVar.zzg = jpgVar;
        fpgVar.zze |= 1;
    }

    public static dpg y() {
        return (dpg) zzc.o();
    }

    public final hsf A() {
        return this.zzh;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (gpg.a[i - 1]) {
            case 1:
                return new fpg();
            case 2:
                return new dpg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (fpg.class) {
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

    public final jpg z() {
        jpg jpgVar = this.zzg;
        return jpgVar == null ? jpg.B() : jpgVar;
    }
}
