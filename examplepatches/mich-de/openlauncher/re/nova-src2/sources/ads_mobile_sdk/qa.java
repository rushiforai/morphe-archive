package ads_mobile_sdk;

import b.j8;
import b.n0;
import b.t2;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class qa extends cu0 {
    private static final qa DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f8535c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f8536d = 2;
    private int bitField0_;
    private gn1 extras_ = gn1.f4008b;
    private String format_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        qa qaVar = new qa();
        DEFAULT_INSTANCE = qaVar;
        cu0.a(qa.class, qaVar);
    }

    public static j8 q() {
        return (j8) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            n0 n0Var = ft3.f3519d;
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0001\u0000\u0000\u0001ለ\u0000\u00022", new Object[]{"bitField0_", "format_", "extras_", new dn1(n0Var, n0Var, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)});
        }
        if (iA == 3) {
            return new qa();
        }
        if (iA != 4) {
            return null;
        }
        return new j8();
    }

    public final Map o() {
        return Collections.unmodifiableMap(this.extras_);
    }

    public final String p() {
        return this.format_;
    }

    public final void b(String str) {
        this.bitField0_ |= 1;
        this.format_ = str;
    }
}
