package ads_mobile_sdk;

import b.gc;
import b.j6;
import b.t2;

/* loaded from: classes.dex */
public final class xt extends cu0 {
    private static final xt DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11821c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f11822d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f11823e = 3;
    private int binaryName_;
    private int selectedExperimentIdsMemoizedSerializedSize = -1;
    private String versionNumber_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private j6 selectedExperimentIds_ = jb1.f5202e;

    static {
        xt xtVar = new xt();
        DEFAULT_INSTANCE = xtVar;
        cu0.a(xt.class, xtVar);
    }

    public static gc o() {
        return (gc) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0001\u0000\u0001\f\u0002Ȉ\u0003'", new Object[]{"binaryName_", "versionNumber_", "selectedExperimentIds_"});
        }
        if (iA == 3) {
            return new xt();
        }
        if (iA != 4) {
            return null;
        }
        return new gc(DEFAULT_INSTANCE);
    }
}
