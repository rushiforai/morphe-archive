package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class r92 extends cu0 {
    private static final r92 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f8986c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f8987d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f8988e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f8989f = 4;
    private int bitField0_;
    private long expirationTimestampMs_;
    private long generationTimestampMs_;
    private sq signature_ = sq.f9634b;
    private xn3 vmId_;

    static {
        r92 r92Var = new r92();
        DEFAULT_INSTANCE = r92Var;
        cu0.a(r92.class, r92Var);
    }

    public static r92 o() {
        return DEFAULT_INSTANCE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဉ\u0000\u0002ည\u0001\u0003ဂ\u0002\u0004ဂ\u0003", new Object[]{"bitField0_", "vmId_", "signature_", "generationTimestampMs_", "expirationTimestampMs_"});
        }
        if (iA == 3) {
            return new r92();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }

    public final long p() {
        return this.expirationTimestampMs_;
    }

    public final sq q() {
        return this.signature_;
    }

    public final xn3 r() {
        xn3 xn3Var = this.vmId_;
        return xn3Var == null ? xn3.o() : xn3Var;
    }
}
