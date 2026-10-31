package ads_mobile_sdk;

import b.n0;
import b.t2;
import java.io.InputStream;
import java.util.Collections;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class cq0 extends cu0 {
    private static final cq0 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f1973c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f1974d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f1975e = 8;

    /* renamed from: f, reason: collision with root package name */
    public static final int f1976f = 5;

    /* renamed from: g, reason: collision with root package name */
    public static final int f1977g = 6;

    /* renamed from: h, reason: collision with root package name */
    public static final int f1978h = 7;
    private int bitField0_;
    private iz consentState_;
    private boolean hasSdkInitializedPreviously_;
    private int sessionsSinceUpdate_;
    private gn1 storedSdkCoreData_ = gn1.f4008b;
    private String flagJson_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String cachedUserAgent_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        cq0 cq0Var = new cq0();
        DEFAULT_INSTANCE = cq0Var;
        cu0.a(cq0.class, cq0Var);
    }

    public static cq0 q() {
        return DEFAULT_INSTANCE;
    }

    public static b.l0 v() {
        return (b.l0) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            n0 n0Var = ft3.f3519d;
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0006\u0000\u0001\u0001\b\u0006\u0001\u0000\u0000\u0001ለ\u0000\u0002င\u0001\u00052\u0006ဉ\u0003\u0007ለ\u0004\bဇ\u0002", new Object[]{"bitField0_", "flagJson_", "sessionsSinceUpdate_", "storedSdkCoreData_", new dn1(n0Var, n0Var, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), "consentState_", "cachedUserAgent_", "hasSdkInitializedPreviously_"});
        }
        if (iA == 3) {
            return new cq0();
        }
        if (iA != 4) {
            return null;
        }
        return new b.l0(DEFAULT_INSTANCE);
    }

    public final String o() {
        return this.cachedUserAgent_;
    }

    public final iz p() {
        iz izVar = this.consentState_;
        return izVar == null ? iz.s() : izVar;
    }

    public final String r() {
        return this.flagJson_;
    }

    public final boolean s() {
        return this.hasSdkInitializedPreviously_;
    }

    public final int t() {
        return this.sessionsSinceUpdate_;
    }

    public final Map u() {
        return Collections.unmodifiableMap(this.storedSdkCoreData_);
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 16;
        this.cachedUserAgent_ = str;
    }

    public final void c(String str) {
        this.bitField0_ |= 1;
        this.flagJson_ = str;
    }

    public final void a(iz izVar) {
        Objects.requireNonNull(izVar);
        this.consentState_ = izVar;
        this.bitField0_ |= 8;
    }

    public static cq0 a(InputStream inputStream) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, com.google.crypto.tink.shaded.protobuf.k.a(inputStream), nl0.a());
        cu0.a(cu0VarA);
        return (cq0) cu0VarA;
    }
}
