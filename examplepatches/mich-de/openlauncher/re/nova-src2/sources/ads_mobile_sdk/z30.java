package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes.dex */
public final class z30 extends cu0 {
    private static final z30 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12436c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f12437d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f12438e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f12439f = 4;
    private int bitField0_;
    private y30 digests_;
    private long length_;
    private String url_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String fileBasename_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        z30 z30Var = new z30();
        DEFAULT_INSTANCE = z30Var;
        cu0.a(z30.class, z30Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဉ\u0001\u0003ဂ\u0002\u0004ဈ\u0003", new Object[]{"bitField0_", "url_", "digests_", "length_", "fileBasename_"});
        }
        if (iA == 3) {
            return new z30();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
