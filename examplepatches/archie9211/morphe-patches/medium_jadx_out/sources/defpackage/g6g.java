package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g6g extends h5g {
    private static final g6g zzb;
    private q5g zzd = z7g.e;

    static {
        g6g g6gVar = new g6g();
        zzb = g6gVar;
        h5g.f(g6g.class, g6gVar);
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"zzd", kag.class});
        }
        if (i2 == 3) {
            return new g6g();
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
