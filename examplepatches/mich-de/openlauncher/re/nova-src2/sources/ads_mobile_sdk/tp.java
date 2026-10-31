package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes2.dex */
public final class tp extends cu0 {
    private static final tp DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10020c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10021d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f10022e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f10023f = 7;

    /* renamed from: g, reason: collision with root package name */
    public static final int f10024g = 8;

    /* renamed from: h, reason: collision with root package name */
    public static final int f10025h = 4;

    /* renamed from: i, reason: collision with root package name */
    public static final int f10026i = 5;

    /* renamed from: j, reason: collision with root package name */
    public static final int f10027j = 6;

    /* renamed from: k, reason: collision with root package name */
    public static final int f10028k = 9;

    /* renamed from: l, reason: collision with root package name */
    public static final int f10029l = 11;

    /* renamed from: m, reason: collision with root package name */
    public static final int f10030m = 10;
    private int backoffStep_;
    private int bitField0_;
    private long cacheTimestamp_;
    private sp error_;
    private float executionCredit_;
    private int failedExecutions_;
    private boolean isFromPrebid_;
    private boolean isPublisherCreated_;
    private long lastExecutionTimestamp_;
    private int skippedExecutions_;
    private String javascriptLibraryName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String buyerGeneratedRequestData_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        tp tpVar = new tp();
        DEFAULT_INSTANCE = tpVar;
        cu0.a(tp.class, tpVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u000b\u0000\u0001\u0001\u000b\u000b\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003ဂ\u0002\u0004င\u0005\u0005င\u0006\u0006င\u0007\u0007ဂ\u0003\bခ\u0004\tဇ\b\nဉ\n\u000bဇ\t", new Object[]{"bitField0_", "javascriptLibraryName_", "buyerGeneratedRequestData_", "cacheTimestamp_", "failedExecutions_", "skippedExecutions_", "backoffStep_", "lastExecutionTimestamp_", "executionCredit_", "isPublisherCreated_", "error_", "isFromPrebid_"});
        }
        if (iA == 3) {
            return new tp();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
