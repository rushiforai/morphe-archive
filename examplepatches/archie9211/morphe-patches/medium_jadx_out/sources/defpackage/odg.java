package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class odg extends h5g {
    private static final odg zzb;
    private int zzd;
    private int zze;

    static {
        odg odgVar = new odg();
        zzb = odgVar;
        h5g.f(odg.class, odgVar);
    }

    public static kdg q() {
        return (kdg) zzb.k();
    }

    public static /* synthetic */ void r(odg odgVar, int i) {
        odgVar.zze = i - 1;
        odgVar.zzd |= 1;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001᠌\u0000", new Object[]{"zzd", "zze", y2g.i});
        }
        if (i2 == 3) {
            return new odg();
        }
        if (i2 == 4) {
            return new kdg(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
