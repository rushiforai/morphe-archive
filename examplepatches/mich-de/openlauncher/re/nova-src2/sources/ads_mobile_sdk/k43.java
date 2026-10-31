package ads_mobile_sdk;

import b.t2;
import java.io.InputStream;

/* loaded from: classes.dex */
public final class k43 extends cu0 {
    private static final k43 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f5506c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f5507d = 2;
    private int bitField0_;
    private boolean isInstallReferrerReported_;
    private int totalInflightAdLimit_;

    static {
        k43 k43Var = new k43();
        DEFAULT_INSTANCE = k43Var;
        cu0.a(k43.class, k43Var);
    }

    public static k43 o() {
        return DEFAULT_INSTANCE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဇ\u0000\u0002င\u0001", new Object[]{"bitField0_", "isInstallReferrerReported_", "totalInflightAdLimit_"});
        }
        if (iA == 3) {
            return new k43();
        }
        if (iA != 4) {
            return null;
        }
        return new b.q4(DEFAULT_INSTANCE);
    }

    public final boolean p() {
        return this.isInstallReferrerReported_;
    }

    public final int q() {
        return this.totalInflightAdLimit_;
    }

    public static k43 a(InputStream inputStream) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, com.google.crypto.tink.shaded.protobuf.k.a(inputStream), nl0.a());
        cu0.a(cu0VarA);
        return (k43) cu0VarA;
    }
}
