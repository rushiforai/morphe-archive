package ads_mobile_sdk;

import b.e9;
import b.n0;
import b.t;
import b.t2;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class nb2 extends cu0 {
    private static final nb2 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f7513c = 9;

    /* renamed from: d, reason: collision with root package name */
    public static final int f7514d = 1;

    /* renamed from: e, reason: collision with root package name */
    public static final int f7515e = 11;

    /* renamed from: f, reason: collision with root package name */
    public static final int f7516f = 12;

    /* renamed from: g, reason: collision with root package name */
    public static final int f7517g = 2;

    /* renamed from: h, reason: collision with root package name */
    public static final int f7518h = 3;

    /* renamed from: i, reason: collision with root package name */
    public static final int f7519i = 4;

    /* renamed from: j, reason: collision with root package name */
    public static final int f7520j = 13;

    /* renamed from: k, reason: collision with root package name */
    public static final int f7521k = 5;

    /* renamed from: l, reason: collision with root package name */
    public static final int f7522l = 6;

    /* renamed from: m, reason: collision with root package name */
    public static final int f7523m = 7;
    public static final int n = 8;
    public static final int o = 10;

    /* renamed from: p, reason: collision with root package name */
    public static final int f7524p = 14;
    private boolean allowCompression_;
    private boolean allowCookies_;
    private e9 allowedKeys_;
    private e9 andRules_;
    private String baseUrl_;
    private int bitField0_;
    private e9 blobUrlKeys_;
    private e9 consoleLogs_;
    private e9 elseRules_;
    private int errorCode_;
    private String errorString_;
    private e9 includeSignals_;
    private vm1 pattern_;
    private gn1 include_ = gn1.f4008b;
    private String ruleLabel_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        nb2 nb2Var = new nb2();
        DEFAULT_INSTANCE = nb2Var;
        cu0.a(nb2.class, nb2Var);
    }

    public nb2() {
        in2 in2Var = in2.f4887e;
        this.andRules_ = in2Var;
        this.elseRules_ = in2Var;
        this.includeSignals_ = in2Var;
        this.blobUrlKeys_ = in2Var;
        this.allowedKeys_ = in2Var;
        this.consoleLogs_ = in2Var;
        this.errorString_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.baseUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final String A() {
        return this.ruleLabel_;
    }

    public final boolean B() {
        return (this.bitField0_ & 32) != 0;
    }

    public final boolean C() {
        return (this.bitField0_ & 16) != 0;
    }

    public final boolean D() {
        return (this.bitField0_ & 8) != 0;
    }

    public final boolean E() {
        return (this.bitField0_ & 4) != 0;
    }

    public final boolean F() {
        return (this.bitField0_ & 2) != 0;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            n0 n0Var = ft3.f3519d;
            return new ps2(DEFAULT_INSTANCE, "\u0004\u000e\u0000\u0001\u0001\u000e\u000e\u0001\u0006\u0000\u0001ဉ\u0001\u00022\u0003\u001b\u0004Ț\u0005Ț\u0006ለ\u0002\u0007င\u0003\bለ\u0004\tለ\u0000\nဇ\u0005\u000b\u001b\f\u001b\rȚ\u000eဇ\u0006", new Object[]{"bitField0_", "pattern_", "include_", new dn1(n0Var, n0Var, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), "includeSignals_", a41.class, "blobUrlKeys_", "consoleLogs_", "errorString_", "errorCode_", "baseUrl_", "ruleLabel_", "allowCookies_", "andRules_", nb2.class, "elseRules_", nb2.class, "allowedKeys_", "allowCompression_"});
        }
        if (iA == 3) {
            return new nb2();
        }
        if (iA != 4) {
            return null;
        }
        return new t(15);
    }

    public final boolean o() {
        return this.allowCookies_;
    }

    public final e9 p() {
        return this.allowedKeys_;
    }

    public final e9 q() {
        return this.andRules_;
    }

    public final String r() {
        return this.baseUrl_;
    }

    public final e9 s() {
        return this.blobUrlKeys_;
    }

    public final e9 t() {
        return this.consoleLogs_;
    }

    public final e9 u() {
        return this.elseRules_;
    }

    public final int v() {
        return this.errorCode_;
    }

    public final String w() {
        return this.errorString_;
    }

    public final Map x() {
        return Collections.unmodifiableMap(this.include_);
    }

    public final e9 y() {
        return this.includeSignals_;
    }

    public final vm1 z() {
        vm1 vm1Var = this.pattern_;
        return vm1Var == null ? vm1.p() : vm1Var;
    }
}
