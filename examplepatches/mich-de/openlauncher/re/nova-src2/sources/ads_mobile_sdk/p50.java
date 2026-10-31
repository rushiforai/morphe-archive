package ads_mobile_sdk;

import b.d;
import b.e9;
import b.t2;

/* loaded from: classes.dex */
public final class p50 extends cu0 {
    private static final p50 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f8096c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f8097d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f8098e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f8099f = 4;
    private int bitField0_;
    private e9 importScriptUrls_;
    private e9 requestedUrls_;
    private String scopeUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String scriptUrl_;

    static {
        p50 p50Var = new p50();
        DEFAULT_INSTANCE = p50Var;
        cu0.a(p50.class, p50Var);
    }

    public p50() {
        in2 in2Var = in2.f4887e;
        this.requestedUrls_ = in2Var;
        this.importScriptUrls_ = in2Var;
        this.scriptUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0002\u0000\u0001ဈ\u0000\u0002\u001a\u0003\u001a\u0004ဈ\u0001", new Object[]{"bitField0_", "scopeUrl_", "requestedUrls_", "importScriptUrls_", "scriptUrl_"});
        }
        if (iA == 3) {
            return new p50();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
