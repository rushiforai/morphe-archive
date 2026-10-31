package ads_mobile_sdk;

import b.e4;
import b.n0;
import b.t2;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class iz extends cu0 {
    private static final iz DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f5055c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f5056d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f5057e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f5058f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f5059g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f5060h = 6;
    private int bitField0_;
    private ax consentAllowlist_;
    private pb2 patternMatchingFlag_;
    private uh2 preProcessingFlag_;
    private gn1 concatenatedSignalsMap_ = gn1.f4008b;
    private String consentStringJson_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String consentStateJson_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        iz izVar = new iz();
        DEFAULT_INSTANCE = izVar;
        cu0.a(iz.class, izVar);
    }

    public static iz s() {
        return DEFAULT_INSTANCE;
    }

    public static e4 w() {
        return (e4) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            n0 n0Var = ft3.f3519d;
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0001\u0000\u0000\u0001ለ\u0000\u0002ለ\u0001\u0003ဉ\u0002\u0004ဉ\u0003\u00052\u0006ဉ\u0004", new Object[]{"bitField0_", "consentStringJson_", "consentStateJson_", "patternMatchingFlag_", "preProcessingFlag_", "concatenatedSignalsMap_", new dn1(n0Var, n0Var, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), "consentAllowlist_"});
        }
        if (iA == 3) {
            return new iz();
        }
        if (iA != 4) {
            return null;
        }
        return new e4(DEFAULT_INSTANCE);
    }

    public final void b(String str) {
        this.bitField0_ |= 2;
        this.consentStateJson_ = str;
    }

    public final void c(String str) {
        this.bitField0_ |= 1;
        this.consentStringJson_ = str;
    }

    public final Map o() {
        return Collections.unmodifiableMap(this.concatenatedSignalsMap_);
    }

    public final ax p() {
        ax axVar = this.consentAllowlist_;
        return axVar == null ? ax.r() : axVar;
    }

    public final String q() {
        return this.consentStateJson_;
    }

    public final String r() {
        return this.consentStringJson_;
    }

    public final pb2 t() {
        pb2 pb2Var = this.patternMatchingFlag_;
        return pb2Var == null ? pb2.o() : pb2Var;
    }

    public final uh2 u() {
        uh2 uh2Var = this.preProcessingFlag_;
        return uh2Var == null ? uh2.o() : uh2Var;
    }

    public final boolean v() {
        return (this.bitField0_ & 4) != 0;
    }

    public final void a(ax axVar) {
        this.consentAllowlist_ = axVar;
        this.bitField0_ |= 16;
    }
}
