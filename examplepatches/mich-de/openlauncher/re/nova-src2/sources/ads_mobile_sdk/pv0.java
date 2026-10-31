package ads_mobile_sdk;

import b.t2;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class pv0 extends cu0 {
    private static final pv0 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f8389c = 14;
    private int bitField0_;
    private kv0 gmaSdkExceptionMessage_;

    static {
        pv0 pv0Var = new pv0();
        DEFAULT_INSTANCE = pv0Var;
        cu0.a(pv0.class, pv0Var);
    }

    public static b.a8 o() {
        return (b.a8) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0001\u000e\u000e\u0001\u0000\u0000\u0000\u000eဉ\u0000", new Object[]{"bitField0_", "gmaSdkExceptionMessage_"});
        }
        if (iA == 3) {
            return new pv0();
        }
        if (iA != 4) {
            return null;
        }
        return new b.a8(DEFAULT_INSTANCE);
    }

    public final void a(kv0 kv0Var) {
        Objects.requireNonNull(kv0Var);
        this.gmaSdkExceptionMessage_ = kv0Var;
        this.bitField0_ |= 1;
    }
}
