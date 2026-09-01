package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ong extends ytf {
    private static final ong zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;

    static {
        ong ongVar = new ong();
        zzc = ongVar;
        ytf.j(ong.class, ongVar);
    }

    public static ong u(hsf hsfVar, ptf ptfVar) {
        return (ong) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static mng x() {
        return (mng) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (lng.a[i - 1]) {
            case 1:
                return new ong();
            case 2:
                return new mng(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002\u000b", new Object[]{"zzf", "zze"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (ong.class) {
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
