package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v2g extends h5g {
    private static final v2g zzb;
    private int zzd;
    private String zze = "";

    static {
        v2g v2gVar = new v2g();
        zzb = v2gVar;
        h5g.f(v2g.class, v2gVar);
    }

    public static s2g q() {
        return (s2g) zzb.k();
    }

    public static /* synthetic */ void r(v2g v2gVar, String str) {
        v2gVar.zzd |= 1;
        v2gVar.zze = str;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဈ\u0000", new Object[]{"zzd", "zze"});
        }
        if (i2 == 3) {
            return new v2g();
        }
        if (i2 == 4) {
            return new s2g(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
