package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vsg extends ytf {
    private static final vsg zzc;
    private static volatile ouf zzd;
    private String zze = "";
    private int zzf;
    private int zzg;
    private int zzh;

    static {
        vsg vsgVar = new vsg();
        zzc = vsgVar;
        ytf.j(vsg.class, vsgVar);
    }

    public static /* synthetic */ void u(vsg vsgVar, String str) {
        str.getClass();
        vsgVar.zze = str;
    }

    public static usg x() {
        return (usg) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (tsg.a[i - 1]) {
            case 1:
                return new vsg();
            case 2:
                return new usg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001Ȉ\u0002\f\u0003\u000b\u0004\f", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (vsg.class) {
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
}
