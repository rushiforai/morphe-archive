package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hrg extends ytf {
    private static final hrg zzc;
    private static volatile ouf zzd;
    private int zze;
    private org zzf;

    static {
        hrg hrgVar = new hrg();
        zzc = hrgVar;
        ytf.j(hrg.class, hrgVar);
    }

    public static hrg t(hsf hsfVar, ptf ptfVar) {
        return (hrg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void u(hrg hrgVar, org orgVar) {
        hrgVar.zzf = orgVar;
        hrgVar.zze |= 1;
    }

    public static frg v() {
        return (frg) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (erg.a[i - 1]) {
            case 1:
                return new hrg();
            case 2:
                return new frg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဉ\u0000", new Object[]{"zze", "zzf"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (hrg.class) {
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

    public final org w() {
        org orgVar = this.zzf;
        return orgVar == null ? org.A() : orgVar;
    }
}
