package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eog extends ytf {
    private static final eog zzc;
    private static volatile ouf zzd;
    private int zze;
    private hsf zzf = hsf.b;

    static {
        eog eogVar = new eog();
        zzc = eogVar;
        ytf.j(eog.class, eogVar);
    }

    public static eog u(hsf hsfVar, ptf ptfVar) {
        return (eog) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(eog eogVar, rsf rsfVar) {
        rsfVar.getClass();
        eogVar.zzf = rsfVar;
    }

    public static cog w() {
        return (cog) zzc.o();
    }

    public static ouf y() {
        return (ouf) zzc.d(7);
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (bog.a[i - 1]) {
            case 1:
                return new eog();
            case 2:
                return new cog(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002\n", new Object[]{"zze", "zzf"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (eog.class) {
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

    public final hsf x() {
        return this.zzf;
    }
}
