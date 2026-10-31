package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes.dex */
public final class td extends cu0 {
    private static final td DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9902c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9903d = 2;
    private b.k8 labels_;
    private b.k8 reasons_;
    private int labelsMemoizedSerializedSize = -1;
    private int reasonsMemoizedSerializedSize = -1;

    static {
        td tdVar = new td();
        DEFAULT_INSTANCE = tdVar;
        cu0.a(td.class, tdVar);
    }

    public td() {
        wm1 wm1Var = wm1.f11335e;
        this.labels_ = wm1Var;
        this.reasons_ = wm1Var;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0002\u0000\u0001%\u0002%", new Object[]{"labels_", "reasons_"});
        }
        if (iA == 3) {
            return new td();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
