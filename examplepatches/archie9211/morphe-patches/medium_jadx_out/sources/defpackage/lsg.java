package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lsg extends ytf {
    private static final lsg zzc;
    private static volatile ouf zzd;
    private int zzg;
    private boolean zzh;
    private String zze = "";
    private String zzf = "";
    private String zzi = "";

    static {
        lsg lsgVar = new lsg();
        zzc = lsgVar;
        ytf.j(lsg.class, lsgVar);
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (ksg.a[i - 1]) {
            case 1:
                return new lsg();
            case 2:
                return new iog(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0005\u0000\u0000\u0001\u0005\u0005\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003\u000b\u0004\u0007\u0005Ȉ", new Object[]{"zze", "zzf", "zzg", "zzh", "zzi"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (lsg.class) {
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
