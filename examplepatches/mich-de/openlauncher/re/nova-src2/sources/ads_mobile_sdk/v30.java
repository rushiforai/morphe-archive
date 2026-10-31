package ads_mobile_sdk;

import b.t2;
import java.util.Objects;

/* loaded from: classes.dex */
public final class v30 extends cu0 {
    private static final v30 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10562c = 1;
    private int bitField0_;
    private String clickString_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        v30 v30Var = new v30();
        DEFAULT_INSTANCE = v30Var;
        cu0.a(v30.class, v30Var);
    }

    public static b.ib o() {
        return (b.ib) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဈ\u0000", new Object[]{"bitField0_", "clickString_"});
        }
        if (iA == 3) {
            return new v30();
        }
        if (iA != 4) {
            return null;
        }
        return new b.ib(DEFAULT_INSTANCE);
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 1;
        this.clickString_ = str;
    }
}
