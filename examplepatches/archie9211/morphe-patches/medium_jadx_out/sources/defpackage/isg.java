package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class isg extends ytf {
    private static final isg zzc;
    private static volatile ouf zzd;
    private String zze = "";
    private hsf zzf = hsf.b;
    private int zzg;

    static {
        isg isgVar = new isg();
        zzc = isgVar;
        ytf.j(isg.class, isgVar);
    }

    public static hsg t() {
        return (hsg) zzc.o();
    }

    public static isg u(byte[] bArr, ptf ptfVar) {
        return (isg) ytf.i(zzc, bArr, ptfVar);
    }

    public static /* synthetic */ void v(isg isgVar, String str) {
        str.getClass();
        isgVar.zze = str;
    }

    public static /* synthetic */ void w(isg isgVar, hsf hsfVar) {
        hsfVar.getClass();
        isgVar.zzf = hsfVar;
    }

    public static isg y() {
        return zzc;
    }

    public final hsf A() {
        return this.zzf;
    }

    public final String B() {
        return this.zze;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (gsg.a[i - 1]) {
            case 1:
                return new isg();
            case 2:
                return new hsg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001Ȉ\u0002\n\u0003\f", new Object[]{"zze", "zzf", "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (isg.class) {
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

    public final ntg z() {
        ntg ntgVarZza = ntg.zza(this.zzg);
        return ntgVarZza == null ? ntg.UNRECOGNIZED : ntgVarZza;
    }
}
