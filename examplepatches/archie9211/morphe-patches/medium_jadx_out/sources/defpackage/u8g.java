package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u8g extends h5g {
    private static final u8g zzb;
    private v6g zzd = v6g.b;

    static {
        u8g u8gVar = new u8g();
        zzb = u8gVar;
        h5g.f(u8g.class, u8gVar);
    }

    public static q8g q() {
        return (q8g) zzb.k();
    }

    public static v6g r(u8g u8gVar) {
        v6g v6gVar = u8gVar.zzd;
        if (v6gVar.a) {
            return v6gVar;
        }
        v6g v6gVarA = v6gVar.a();
        u8gVar.zzd = v6gVarA;
        return v6gVarA;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", new Object[]{"zzd", s8g.a});
        }
        if (i2 == 3) {
            return new u8g();
        }
        if (i2 == 4) {
            return new q8g(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
