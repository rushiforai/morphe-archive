package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class trg extends ytf {
    private static final trg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private xrg zzg;
    private hsf zzh = hsf.b;

    static {
        trg trgVar = new trg();
        zzc = trgVar;
        ytf.j(trg.class, trgVar);
    }

    public static ouf B() {
        return (ouf) zzc.d(7);
    }

    public static trg u(hsf hsfVar, ptf ptfVar) {
        return (trg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void w(trg trgVar, rsf rsfVar) {
        rsfVar.getClass();
        trgVar.zzh = rsfVar;
    }

    public static /* synthetic */ void x(trg trgVar, xrg xrgVar) {
        trgVar.zzg = xrgVar;
        trgVar.zze |= 1;
    }

    public static rrg y() {
        return (rrg) zzc.o();
    }

    public final hsf A() {
        return this.zzh;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (qrg.a[i - 1]) {
            case 1:
                return new trg();
            case 2:
                return new rrg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (trg.class) {
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

    public final xrg z() {
        xrg xrgVar = this.zzg;
        return xrgVar == null ? xrg.A() : xrgVar;
    }
}
