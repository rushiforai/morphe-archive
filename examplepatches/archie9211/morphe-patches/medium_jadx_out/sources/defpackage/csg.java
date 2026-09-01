package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class csg extends ytf {
    private static final csg zzc;
    private static volatile ouf zzd;
    private String zze = "";
    private hsf zzf = hsf.b;
    private int zzg;

    static {
        csg csgVar = new csg();
        zzc = csgVar;
        ytf.j(csg.class, csgVar);
    }

    public static asg t() {
        return (asg) zzc.o();
    }

    public static /* synthetic */ void u(csg csgVar, String str) {
        str.getClass();
        csgVar.zze = str;
    }

    public static /* synthetic */ void v(csg csgVar, hsf hsfVar) {
        hsfVar.getClass();
        csgVar.zzf = hsfVar;
    }

    public static csg y() {
        return zzc;
    }

    public final String A() {
        return this.zze;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (yrg.a[i - 1]) {
            case 1:
                return new csg();
            case 2:
                return new asg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001Ȉ\u0002\n\u0003\f", new Object[]{"zze", "zzf", "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (csg.class) {
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

    public final zrg x() {
        zrg zrgVarZza = zrg.zza(this.zzg);
        return zrgVarZza == null ? zrg.UNRECOGNIZED : zrgVarZza;
    }

    public final hsf z() {
        return this.zzf;
    }
}
