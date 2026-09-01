package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tlg extends ytf {
    private static final tlg zzc;
    private static volatile ouf zzd;
    private int zze;
    private fmg zzf;
    private nqg zzg;

    static {
        tlg tlgVar = new tlg();
        zzc = tlgVar;
        ytf.j(tlg.class, tlgVar);
    }

    public static rlg t() {
        return (rlg) zzc.o();
    }

    public static tlg u(hsf hsfVar, ptf ptfVar) {
        return (tlg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(tlg tlgVar, fmg fmgVar) {
        tlgVar.zzf = fmgVar;
        tlgVar.zze |= 1;
    }

    public static /* synthetic */ void w(tlg tlgVar, nqg nqgVar) {
        tlgVar.zzg = nqgVar;
        tlgVar.zze |= 2;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (qlg.a[i - 1]) {
            case 1:
                return new tlg();
            case 2:
                return new rlg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001", new Object[]{"zze", "zzf", "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (tlg.class) {
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

    public final fmg x() {
        fmg fmgVar = this.zzf;
        return fmgVar == null ? fmg.x() : fmgVar;
    }

    public final nqg y() {
        nqg nqgVar = this.zzg;
        return nqgVar == null ? nqg.z() : nqgVar;
    }
}
