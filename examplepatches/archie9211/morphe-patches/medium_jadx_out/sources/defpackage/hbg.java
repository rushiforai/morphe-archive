package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hbg extends h5g {
    private static final hbg zzb;

    static {
        hbg hbgVar = new hbg();
        zzb = hbgVar;
        h5g.f(hbg.class, hbgVar);
    }

    public static hbg q() {
        return zzb;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0000", null);
        }
        if (i2 == 3) {
            return new hbg();
        }
        if (i2 == 4) {
            return new l1g(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
