package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zcg extends h5g {
    private static final zcg zzb;
    private int zzd;
    private q5g zze = z7g.e;
    private String zzf = "";
    private boolean zzg;

    static {
        zcg zcgVar = new zcg();
        zzb = zcgVar;
        h5g.f(zcg.class, zcgVar);
    }

    public static zcg q() {
        return zzb;
    }

    public static /* synthetic */ void r(zcg zcgVar, boolean z) {
        zcgVar.zzd |= 2;
        zcgVar.zzg = z;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0001\u0000\u0001\u001b\u0002ဈ\u0000\u0003ဇ\u0001", new Object[]{"zzd", "zze", vcg.class, "zzf", "zzg"});
        }
        if (i2 == 3) {
            return new zcg();
        }
        if (i2 == 4) {
            return new ncg(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
