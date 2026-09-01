package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class blg extends ytf {
    private static final blg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private hsf zzg = hsf.b;
    private klg zzh;

    static {
        blg blgVar = new blg();
        zzc = blgVar;
        ytf.j(blg.class, blgVar);
    }

    public static ouf A() {
        return (ouf) zzc.d(7);
    }

    public static blg u(hsf hsfVar, ptf ptfVar) {
        return (blg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(blg blgVar, rsf rsfVar) {
        rsfVar.getClass();
        blgVar.zzg = rsfVar;
    }

    public static /* synthetic */ void w(blg blgVar, klg klgVar) {
        blgVar.zzh = klgVar;
        blgVar.zze |= 1;
    }

    public static zkg x() {
        return (zkg) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (ykg.a[i - 1]) {
            case 1:
                return new blg();
            case 2:
                return new zkg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002\n\u0003ဉ\u0000", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (blg.class) {
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

    public final klg y() {
        klg klgVar = this.zzh;
        return klgVar == null ? klg.w() : klgVar;
    }

    public final hsf z() {
        return this.zzg;
    }
}
