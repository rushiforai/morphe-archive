package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class edg extends h5g {
    private static final edg zzb;
    private int zzd;
    private int zze = 0;
    private Object zzf;
    private zbg zzg;
    private dcg zzh;

    static {
        edg edgVar = new edg();
        zzb = edgVar;
        h5g.f(edg.class, edgVar);
    }

    public static /* synthetic */ void q(edg edgVar, sdg sdgVar) {
        edgVar.zzf = sdgVar;
        edgVar.zze = 8;
    }

    public static /* synthetic */ void r(edg edgVar, udg udgVar) {
        edgVar.zzf = udgVar;
        edgVar.zze = 4;
    }

    public static bdg s() {
        return (bdg) zzb.k();
    }

    public static /* synthetic */ void t(edg edgVar, uag uagVar) {
        edgVar.zzf = uagVar;
        edgVar.zze = 2;
    }

    public static /* synthetic */ void u(edg edgVar, xag xagVar) {
        edgVar.zzf = xagVar;
        edgVar.zze = 3;
    }

    public static /* synthetic */ void v(edg edgVar, hbg hbgVar) {
        hbgVar.getClass();
        edgVar.zzf = hbgVar;
        edgVar.zze = 7;
    }

    public static /* synthetic */ void w(edg edgVar, qbg qbgVar) {
        edgVar.zzf = qbgVar;
        edgVar.zze = 5;
    }

    public static /* synthetic */ void x(edg edgVar, zbg zbgVar) {
        zbgVar.getClass();
        edgVar.zzg = zbgVar;
        edgVar.zzd |= 1;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\b\u0001\u0001\u0001\b\b\u0000\u0000\u0000\u0001ဉ\u0000\u0002<\u0000\u0003<\u0000\u0004<\u0000\u0005<\u0000\u0006ဉ\u0001\u0007<\u0000\b<\u0000", new Object[]{"zzf", "zze", "zzd", "zzg", uag.class, xag.class, udg.class, qbg.class, "zzh", hbg.class, sdg.class});
        }
        if (i2 == 3) {
            return new edg();
        }
        if (i2 == 4) {
            return new bdg(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
