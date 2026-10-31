package ads_mobile_sdk;

import b.t2;
import java.io.InputStream;

/* loaded from: classes.dex */
public final class ba1 extends cu0 {
    private static final ba1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f1334c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f1335d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f1336e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f1337f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f1338g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f1339h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f1340i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f1341j = 8;

    /* renamed from: k, reason: collision with root package name */
    public static final int f1342k = 9;
    private int gesture_;
    private boolean isGloballyAllowlisted_;
    private boolean isLinkedDevice_;
    private boolean isTestMode_;
    private long networkExtrasExpirationSecs_;
    private String networkExtras_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String deviceIdForDebugging_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String debugAdUnitId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String uiStorage_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        ba1 ba1Var = new ba1();
        DEFAULT_INSTANCE = ba1Var;
        cu0.a(ba1.class, ba1Var);
    }

    public static ba1 p() {
        return DEFAULT_INSTANCE;
    }

    public static b.m y() {
        return (b.m) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\t\u0000\u0000\u0001\t\t\u0000\u0000\u0000\u0001\u0007\u0002\u0007\u0003\f\u0004Ȉ\u0005\u0002\u0006Ȉ\u0007Ȉ\bȈ\t\u0007", new Object[]{"isTestMode_", "isLinkedDevice_", "gesture_", "networkExtras_", "networkExtrasExpirationSecs_", "deviceIdForDebugging_", "debugAdUnitId_", "uiStorage_", "isGloballyAllowlisted_"});
        }
        if (iA == 3) {
            return new ba1();
        }
        if (iA != 4) {
            return null;
        }
        return new b.m(DEFAULT_INSTANCE);
    }

    public final void e(String str) {
        this.uiStorage_ = str;
    }

    public final String o() {
        return this.debugAdUnitId_;
    }

    public final String q() {
        return this.deviceIdForDebugging_;
    }

    public final int r$1() {
        int i5 = this.gesture_;
        int i11 = i5 != 0 ? i5 != 1 ? i5 != 2 ? 0 : 3 : 2 : 1;
        if (i11 == 0) {
            return 4;
        }
        return i11;
    }

    public final boolean s() {
        return this.isGloballyAllowlisted_;
    }

    public final boolean t() {
        return this.isLinkedDevice_;
    }

    public final boolean u() {
        return this.isTestMode_;
    }

    public final String v() {
        return this.networkExtras_;
    }

    public final long w() {
        return this.networkExtrasExpirationSecs_;
    }

    public final String x() {
        return this.uiStorage_;
    }

    public final void b(String str) {
        this.debugAdUnitId_ = str;
    }

    public final void c(String str) {
        this.deviceIdForDebugging_ = str;
    }

    public final void d(String str) {
        this.networkExtras_ = str;
    }

    public static ba1 a(InputStream inputStream) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, com.google.crypto.tink.shaded.protobuf.k.a(inputStream), nl0.a());
        cu0.a(cu0VarA);
        return (ba1) cu0VarA;
    }
}
