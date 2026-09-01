package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uog extends ytf {
    private static final uog zzc;
    private static volatile ouf zzd;
    private int zze;
    private zog zzf;

    static {
        uog uogVar = new uog();
        zzc = uogVar;
        ytf.j(uog.class, uogVar);
    }

    public static sog t() {
        return (sog) zzc.o();
    }

    public static uog u(hsf hsfVar, ptf ptfVar) {
        return (uog) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(uog uogVar, zog zogVar) {
        uogVar.zzf = zogVar;
        uogVar.zze |= 1;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (xog.a[i - 1]) {
            case 1:
                return new uog();
            case 2:
                return new sog(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဉ\u0000", new Object[]{"zze", "zzf"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (uog.class) {
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

    public final zog w() {
        zog zogVar = this.zzf;
        return zogVar == null ? zog.z() : zogVar;
    }
}
