package ads_mobile_sdk;

import b.d;
import b.e9;
import b.t2;

/* loaded from: classes.dex */
public final class mt extends cu0 {
    private static final mt DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f7331c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f7332d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f7333e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f7334f = 4;
    private int bitField0_;
    private int densityDpi_;
    private int heightPixels_;
    private e9 supportedAbi_ = in2.f4887e;
    private int widthPixels_;

    static {
        mt mtVar = new mt();
        DEFAULT_INSTANCE = mtVar;
        cu0.a(mt.class, mtVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0001\u0000\u0001င\u0000\u0002င\u0001\u0003င\u0002\u0004\u001a", new Object[]{"bitField0_", "densityDpi_", "widthPixels_", "heightPixels_", "supportedAbi_"});
        }
        if (iA == 3) {
            return new mt();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
