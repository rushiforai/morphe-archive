package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jpg extends ytf {
    private static final jpg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private zog zzg;
    private hsf zzh;
    private hsf zzi;

    static {
        jpg jpgVar = new jpg();
        zzc = jpgVar;
        ytf.j(jpg.class, jpgVar);
    }

    public jpg() {
        rsf rsfVar = hsf.b;
        this.zzh = rsfVar;
        this.zzi = rsfVar;
    }

    public static hpg A() {
        return (hpg) zzc.o();
    }

    public static jpg B() {
        return zzc;
    }

    public static ouf E() {
        return (ouf) zzc.d(7);
    }

    public static jpg u(hsf hsfVar, ptf ptfVar) {
        return (jpg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void w(jpg jpgVar, hsf hsfVar) {
        hsfVar.getClass();
        jpgVar.zzh = hsfVar;
    }

    public static /* synthetic */ void x(jpg jpgVar, zog zogVar) {
        jpgVar.zzg = zogVar;
        jpgVar.zze |= 1;
    }

    public static /* synthetic */ void z(jpg jpgVar, hsf hsfVar) {
        hsfVar.getClass();
        jpgVar.zzi = hsfVar;
    }

    public final hsf C() {
        return this.zzh;
    }

    public final hsf D() {
        return this.zzi;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (qpg.a[i - 1]) {
            case 1:
                return new jpg();
            case 2:
                return new hpg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n\u0004\n", new Object[]{"zze", "zzf", "zzg", "zzh", "zzi"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (jpg.class) {
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

    public final zog y() {
        zog zogVar = this.zzg;
        return zogVar == null ? zog.z() : zogVar;
    }
}
