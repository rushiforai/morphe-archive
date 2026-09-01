package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uag extends h5g {
    private static final uag zzb;
    private int zzd;
    private int zze = 0;
    private Object zzf;
    private int zzg;
    private fbg zzh;
    private int zzi;

    static {
        uag uagVar = new uag();
        zzb = uagVar;
        h5g.f(uag.class, uagVar);
    }

    public static /* synthetic */ void q(uag uagVar, zcg zcgVar) {
        uagVar.zzf = zcgVar;
        uagVar.zze = 7;
    }

    public static /* synthetic */ void r(uag uagVar, zdg zdgVar) {
        uagVar.zzf = zdgVar;
        uagVar.zze = 6;
    }

    public static /* synthetic */ void s(uag uagVar, int i) {
        uagVar.zzg = i - 1;
        uagVar.zzd |= 1;
    }

    public static sag t() {
        return (sag) zzb.k();
    }

    public static uag u(byte[] bArr) {
        return (uag) h5g.o(zzb, bArr);
    }

    public static /* synthetic */ void w(uag uagVar, lbg lbgVar) {
        uagVar.zzi = lbgVar.zza();
        uagVar.zzd |= 4;
    }

    public static /* synthetic */ void x(uag uagVar, fbg fbgVar) {
        uagVar.zzh = fbgVar;
        uagVar.zzd |= 2;
    }

    public static /* synthetic */ void y(uag uagVar, kcg kcgVar) {
        uagVar.zzf = kcgVar;
        uagVar.zze = 4;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0006\u0001\u0001\u0001\u0007\u0006\u0000\u0000\u0000\u0001᠌\u0000\u0002ဉ\u0001\u0004<\u0000\u0005᠌\u0002\u0006<\u0000\u0007<\u0000", new Object[]{"zzf", "zze", "zzd", "zzg", y2g.c, "zzh", kcg.class, "zzi", y2g.e, zdg.class, zcg.class});
        }
        if (i2 == 3) {
            return new uag();
        }
        if (i2 == 4) {
            return new sag(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }

    public final zcg v() {
        return this.zze == 7 ? (zcg) this.zzf : zcg.q();
    }
}
