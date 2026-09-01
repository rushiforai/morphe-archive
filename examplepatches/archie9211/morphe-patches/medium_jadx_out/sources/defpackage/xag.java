package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xag extends h5g {
    private static final xag zzb;
    private int zzd;
    private int zze = 0;
    private Object zzf;
    private int zzg;
    private int zzh;

    static {
        xag xagVar = new xag();
        zzb = xagVar;
        h5g.f(xag.class, xagVar);
    }

    public static /* synthetic */ void q(xag xagVar, int i) {
        xagVar.zzg = i - 1;
        xagVar.zzd |= 1;
    }

    public static wag r() {
        return (wag) zzb.k();
    }

    public static /* synthetic */ void t(xag xagVar, lbg lbgVar) {
        xagVar.zzh = lbgVar.zza();
        xagVar.zzd |= 2;
    }

    public static /* synthetic */ void u(xag xagVar, kcg kcgVar) {
        xagVar.zzf = kcgVar;
        xagVar.zze = 2;
    }

    public static /* synthetic */ void v(xag xagVar, zcg zcgVar) {
        xagVar.zzf = zcgVar;
        xagVar.zze = 4;
    }

    public static /* synthetic */ void w(xag xagVar, zdg zdgVar) {
        xagVar.zzf = zdgVar;
        xagVar.zze = 3;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0005\u0001\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001᠌\u0000\u0002<\u0000\u0003<\u0000\u0004<\u0000\u0005᠌\u0001", new Object[]{"zzf", "zze", "zzd", "zzg", y2g.c, kcg.class, zdg.class, zcg.class, "zzh", y2g.e});
        }
        if (i2 == 3) {
            return new xag();
        }
        if (i2 == 4) {
            return new wag(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }

    public final zcg s() {
        return this.zze == 4 ? (zcg) this.zzf : zcg.q();
    }
}
