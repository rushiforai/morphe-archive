package ads_mobile_sdk;

import b.d;
import b.j6;
import b.t2;

/* loaded from: classes.dex */
public final class bt extends cu0 {
    private static final bt DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f1537c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f1538d = 2;
    private int bitField0_;
    private String encodingVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private j6 activeBlobIndex_ = jb1.f5202e;

    static {
        bt btVar = new bt();
        DEFAULT_INSTANCE = btVar;
        cu0.a(bt.class, btVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001ဈ\u0000\u0002\u0016", new Object[]{"bitField0_", "encodingVersion_", "activeBlobIndex_"});
        }
        if (iA == 3) {
            return new bt();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
