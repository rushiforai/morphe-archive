package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kag extends h5g {
    private static final kag zzb;
    private int zzd = 0;
    private Object zze;

    static {
        kag kagVar = new kag();
        zzb = kagVar;
        h5g.f(kag.class, kagVar);
    }

    public static z9g q() {
        return (z9g) zzb.k();
    }

    public static kag r() {
        return zzb;
    }

    public static /* synthetic */ void s(String str, kag kagVar) {
        str.getClass();
        kagVar.zzd = 3;
        kagVar.zze = str;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0000\u0006\u0001\u0000\u0001\u0006\u0006\u0000\u0000\u0000\u0001?\u0000\u00023\u0000\u0003Ȼ\u0000\u0004:\u0000\u0005<\u0000\u0006<\u0000", new Object[]{"zze", "zzd", u8g.class, g6g.class});
        }
        if (i2 == 3) {
            return new kag();
        }
        if (i2 == 4) {
            return new z9g(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
