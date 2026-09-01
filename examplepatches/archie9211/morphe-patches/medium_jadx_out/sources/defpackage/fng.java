package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fng extends ytf {
    private static final fng zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;

    static {
        fng fngVar = new fng();
        zzc = fngVar;
        ytf.j(fng.class, fngVar);
    }

    public static fng u(hsf hsfVar, ptf ptfVar) {
        return (fng) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static dng x() {
        return (dng) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (cng.a[i - 1]) {
            case 1:
                return new fng();
            case 2:
                return new dng(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0002\u0003\u0002\u0000\u0000\u0000\u0002\u000b\u0003\u000b", new Object[]{"zze", "zzf"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (fng.class) {
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

    public final int w() {
        return this.zzf;
    }
}
