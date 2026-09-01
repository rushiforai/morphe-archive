package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class smg extends ytf {
    private static final smg zzc;
    private static volatile ouf zzd;
    private int zze;
    private wmg zzf;
    private int zzg;

    static {
        smg smgVar = new smg();
        zzc = smgVar;
        ytf.j(smg.class, smgVar);
    }

    public static smg u(hsf hsfVar, ptf ptfVar) {
        return (smg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void w(smg smgVar, wmg wmgVar) {
        smgVar.zzf = wmgVar;
        smgVar.zze |= 1;
    }

    public static rmg x() {
        return (rmg) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (qmg.a[i - 1]) {
            case 1:
                return new smg();
            case 2:
                return new rmg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002\u000b", new Object[]{"zze", "zzf", "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (smg.class) {
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

    public final wmg y() {
        wmg wmgVar = this.zzf;
        return wmgVar == null ? wmg.w() : wmgVar;
    }
}
