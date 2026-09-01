package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y1g extends h5g {
    private static final y1g zzb;
    private int zzd;
    private String zze = "";

    static {
        y1g y1gVar = new y1g();
        zzb = y1gVar;
        h5g.f(y1g.class, y1gVar);
    }

    public static y1g q() {
        return zzb;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0001\u0000\u0001\u0002\u0002\u0001\u0000\u0000\u0000\u0002ဈ\u0000", new Object[]{"zzd", "zze"});
        }
        if (i2 == 3) {
            return new y1g();
        }
        if (i2 == 4) {
            return new l1g(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }

    public final String r() {
        return this.zze;
    }
}
