package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tqg extends ytf {
    private static final tqg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;

    static {
        tqg tqgVar = new tqg();
        zzc = tqgVar;
        ytf.j(tqg.class, tqgVar);
    }

    public static rqg x() {
        return (rqg) zzc.o();
    }

    public static tqg y() {
        return zzc;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (wqg.a[i - 1]) {
            case 1:
                return new tqg();
            case 2:
                return new rqg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\f\u0002\u000b", new Object[]{"zze", "zzf"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (tqg.class) {
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

    public final iqg w() {
        iqg iqgVarZza = iqg.zza(this.zze);
        return iqgVarZza == null ? iqg.UNRECOGNIZED : iqgVarZza;
    }
}
