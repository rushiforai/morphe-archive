package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o1g extends h5g {
    private static final o1g zzb;
    private int zzd = 0;
    private Object zze;

    static {
        o1g o1gVar = new o1g();
        zzb = o1gVar;
        h5g.f(o1g.class, o1gVar);
    }

    public static o1g q(byte[] bArr) {
        return (o1g) h5g.o(zzb, bArr);
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0002\u0001\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001;\u0000\u0002<\u0000", new Object[]{"zze", "zzd", y1g.class});
        }
        if (i2 == 3) {
            return new o1g();
        }
        if (i2 == 4) {
            return new l1g(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }

    public final y1g r() {
        return this.zzd == 2 ? (y1g) this.zze : y1g.q();
    }
}
