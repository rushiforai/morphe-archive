package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m2g extends h5g {
    private static final m2g zzb;
    private int zzd;
    private int zze;
    private String zzf = "";

    static {
        m2g m2gVar = new m2g();
        zzb = m2gVar;
        h5g.f(m2g.class, m2gVar);
    }

    public static m2g r(byte[] bArr) {
        return (m2g) h5g.o(zzb, bArr);
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001င\u0000\u0002ဈ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i2 == 3) {
            return new m2g();
        }
        if (i2 == 4) {
            return new l1g(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }

    public final int q() {
        return this.zze;
    }

    public final String s() {
        return this.zzf;
    }
}
