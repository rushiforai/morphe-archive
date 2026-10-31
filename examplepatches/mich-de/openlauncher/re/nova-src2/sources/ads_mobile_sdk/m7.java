package ads_mobile_sdk;

import b.j6;
import b.t2;
import b.v5;

/* loaded from: classes.dex */
public final class m7 extends cu0 {
    private static final m7 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f7028c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f7029d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f7030e = 3;
    private int binaryName_;
    private int bitField0_;
    private int selectedExperimentIdsMemoizedSerializedSize = -1;
    private String versionNumber_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private j6 selectedExperimentIds_ = jb1.f5202e;

    static {
        m7 m7Var = new m7();
        DEFAULT_INSTANCE = m7Var;
        cu0.a(m7.class, m7Var);
    }

    public static v5 o() {
        return (v5) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0001\u0000\u0001ဌ\u0000\u0002ለ\u0001\u0003'", new Object[]{"bitField0_", "binaryName_", "versionNumber_", "selectedExperimentIds_"});
        }
        if (iA == 3) {
            return new m7();
        }
        if (iA != 4) {
            return null;
        }
        return new v5(DEFAULT_INSTANCE);
    }
}
