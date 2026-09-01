package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class glg extends ytf {
    private static final glg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private klg zzg;

    static {
        glg glgVar = new glg();
        zzc = glgVar;
        ytf.j(glg.class, glgVar);
    }

    public static glg u(hsf hsfVar, ptf ptfVar) {
        return (glg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void w(glg glgVar, klg klgVar) {
        glgVar.zzg = klgVar;
        glgVar.zze |= 1;
    }

    public static flg x() {
        return (flg) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (elg.a[i - 1]) {
            case 1:
                return new glg();
            case 2:
                return new flg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000", new Object[]{"zze", "zzf", "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (glg.class) {
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

    public final klg y() {
        klg klgVar = this.zzg;
        return klgVar == null ? klg.w() : klgVar;
    }
}
