package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes.dex */
public final class ts extends cu0 {
    private static final ts DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10044c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10045d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f10046e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f10047f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f10048g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f10049h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f10050i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f10051j = 8;

    /* renamed from: k, reason: collision with root package name */
    public static final int f10052k = 9;

    /* renamed from: l, reason: collision with root package name */
    public static final int f10053l = 10;

    /* renamed from: m, reason: collision with root package name */
    public static final int f10054m = 11;
    public static final int n = 12;
    private int bitField0_;
    private int compression_;
    private int downloadPriority_;
    private ss fallbackInstruction_;
    private boolean meteredAllowed_;
    private zs postProcess_;
    private boolean roamingAllowed_;
    private int type_;
    private String name_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String id_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private int state_ = 1;
    private String downloadPath_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String fallbackDownloadPath_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        ts tsVar = new ts();
        DEFAULT_INSTANCE = tsVar;
        cu0.a(ts.class, tsVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\f\u0000\u0001\u0001\f\f\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003᠌\u0002\u0004᠌\u0003\u0005ဇ\u0004\u0006ဈ\u0005\u0007ဇ\u0006\bင\u0007\t᠌\b\nဉ\t\u000bဈ\n\fဉ\u000b", new Object[]{"bitField0_", "name_", "id_", "type_", b8.a$6, "state_", b8.a$3, "meteredAllowed_", "downloadPath_", "roamingAllowed_", "downloadPriority_", "compression_", ad.a$20, "postProcess_", "fallbackDownloadPath_", "fallbackInstruction_"});
        }
        if (iA == 3) {
            return new ts();
        }
        if (iA != 4) {
            return null;
        }
        return new t(20);
    }
}
