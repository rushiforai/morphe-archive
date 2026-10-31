package ads_mobile_sdk;

import b.e9;
import b.ia;
import b.j6;
import b.t2;
import b.u6;

/* loaded from: classes.dex */
public final class ta extends cu0 {
    private static final ta DEFAULT_INSTANCE;
    private static final u6 allowedFormats_converter_ = new lm.e(8);

    /* renamed from: c, reason: collision with root package name */
    public static final int f9816c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9817d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9818e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f9819f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f9820g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f9821h = 6;
    private long adapterInitializationTimeoutMs_;
    private e9 allowedAdUnits_;
    private e9 allowedAdapterClasses_;
    private int allowedFormatsMemoizedSerializedSize;
    private j6 allowedFormats_ = jb1.f5202e;
    private e9 excludedAdapterClasses_;
    private e9 initializedAdapterClasses_;

    static {
        ta taVar = new ta();
        DEFAULT_INSTANCE = taVar;
        cu0.a(ta.class, taVar);
    }

    public ta() {
        in2 in2Var = in2.f4887e;
        this.allowedAdUnits_ = in2Var;
        this.allowedAdapterClasses_ = in2Var;
        this.excludedAdapterClasses_ = in2Var;
        this.initializedAdapterClasses_ = in2Var;
    }

    public static ia o() {
        return (ia) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0006\u0000\u0000\u0001\u0006\u0006\u0000\u0005\u0000\u0001\u0002\u0002,\u0003Ț\u0004Ț\u0005Ț\u0006Ț", new Object[]{"adapterInitializationTimeoutMs_", "allowedFormats_", "allowedAdUnits_", "allowedAdapterClasses_", "excludedAdapterClasses_", "initializedAdapterClasses_"});
        }
        if (iA == 3) {
            return new ta();
        }
        if (iA != 4) {
            return null;
        }
        return new ia();
    }
}
