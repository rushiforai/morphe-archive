package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ung extends ytf {
    private static final ung zzc;
    private static volatile ouf zzd;
    private int zze;
    private hsf zzf = hsf.b;

    static {
        ung ungVar = new ung();
        zzc = ungVar;
        ytf.j(ung.class, ungVar);
    }

    public static ung u(hsf hsfVar, ptf ptfVar) {
        return (ung) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(ung ungVar, rsf rsfVar) {
        rsfVar.getClass();
        ungVar.zzf = rsfVar;
    }

    public static sng w() {
        return (sng) zzc.o();
    }

    public static ouf y() {
        return (ouf) zzc.d(7);
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (rng.a[i - 1]) {
            case 1:
                return new ung();
            case 2:
                return new sng(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002\n", new Object[]{"zze", "zzf"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (ung.class) {
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
