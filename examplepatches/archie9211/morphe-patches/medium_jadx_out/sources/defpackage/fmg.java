package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fmg extends ytf {
    private static final fmg zzc;
    private static volatile ouf zzd;
    private int zze;
    private lmg zzf;
    private int zzg;

    static {
        fmg fmgVar = new fmg();
        zzc = fmgVar;
        ytf.j(fmg.class, fmgVar);
    }

    public static /* synthetic */ void v(fmg fmgVar, lmg lmgVar) {
        fmgVar.zzf = lmgVar;
        fmgVar.zze |= 1;
    }

    public static emg w() {
        return (emg) zzc.o();
    }

    public static fmg x() {
        return zzc;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (zlg.a[i - 1]) {
            case 1:
                return new fmg();
            case 2:
                return new emg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002\u000b", new Object[]{"zze", "zzf", "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (fmg.class) {
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
        return this.zzg;
    }

    public final lmg y() {
        lmg lmgVar = this.zzf;
        return lmgVar == null ? lmg.w() : lmgVar;
    }
}
