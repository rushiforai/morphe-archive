package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class p92 extends cu0 {
    private static final p92 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f8139c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f8140d = 2;
    private int bitField0_;
    private sq encryptedProgram_ = sq.f9634b;
    private r92 metadata_;

    static {
        p92 p92Var = new p92();
        DEFAULT_INSTANCE = p92Var;
        cu0.a(p92.class, p92Var);
    }

    public static p92 o() {
        return DEFAULT_INSTANCE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ည\u0001", new Object[]{"bitField0_", "metadata_", "encryptedProgram_"});
        }
        if (iA == 3) {
            return new p92();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }

    public final sq p() {
        return this.encryptedProgram_;
    }

    public final r92 q() {
        r92 r92Var = this.metadata_;
        return r92Var == null ? r92.o() : r92Var;
    }

    public final boolean r() {
        return (this.bitField0_ & 2) != 0;
    }

    public final boolean s() {
        return (this.bitField0_ & 1) != 0;
    }
}
