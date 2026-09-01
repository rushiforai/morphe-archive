package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zng extends ytf {
    private static final zng zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;

    static {
        zng zngVar = new zng();
        zzc = zngVar;
        ytf.j(zng.class, zngVar);
    }

    public static zng u(hsf hsfVar, ptf ptfVar) {
        return (zng) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static yng x() {
        return (yng) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (xng.a[i - 1]) {
            case 1:
                return new zng();
            case 2:
                return new yng(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002\u000b", new Object[]{"zze", "zzf"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (zng.class) {
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

    public final int w() {
        return this.zzf;
    }
}
