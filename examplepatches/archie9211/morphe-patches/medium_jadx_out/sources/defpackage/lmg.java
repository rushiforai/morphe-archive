package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lmg extends ytf {
    private static final lmg zzc;
    private static volatile ouf zzd;
    private int zze;

    static {
        lmg lmgVar = new lmg();
        zzc = lmgVar;
        ytf.j(lmg.class, lmgVar);
    }

    public static jmg v() {
        return (jmg) zzc.o();
    }

    public static lmg w() {
        return zzc;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (img.a[i - 1]) {
            case 1:
                return new lmg();
            case 2:
                return new jmg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u000b", new Object[]{"zze"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (lmg.class) {
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
}
