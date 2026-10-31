package ads_mobile_sdk;

import b.n0;
import b.t2;
import java.io.InputStream;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes2.dex */
public final class a70 extends cu0 {
    private static final a70 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f877c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f878d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f879e = 3;
    private int bitField0_;
    private gn1 concatenatedSignalsMap_ = gn1.f4008b;
    private pb2 patternMatchingFlag_;
    private uh2 preProcessingFlag_;

    static {
        a70 a70Var = new a70();
        DEFAULT_INSTANCE = a70Var;
        cu0.a(a70.class, a70Var);
    }

    public static a70 p() {
        return DEFAULT_INSTANCE;
    }

    public static b.id s() {
        return (b.id) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            n0 n0Var = ft3.f3519d;
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0001\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u00032", new Object[]{"bitField0_", "patternMatchingFlag_", "preProcessingFlag_", "concatenatedSignalsMap_", new dn1(n0Var, n0Var, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)});
        }
        if (iA == 3) {
            return new a70();
        }
        if (iA != 4) {
            return null;
        }
        return new b.id(DEFAULT_INSTANCE);
    }

    public final Map o() {
        return Collections.unmodifiableMap(this.concatenatedSignalsMap_);
    }

    public final pb2 q() {
        pb2 pb2Var = this.patternMatchingFlag_;
        return pb2Var == null ? pb2.o() : pb2Var;
    }

    public final uh2 r() {
        uh2 uh2Var = this.preProcessingFlag_;
        return uh2Var == null ? uh2.o() : uh2Var;
    }

    public final void a(pb2 pb2Var) {
        this.patternMatchingFlag_ = pb2Var;
        this.bitField0_ |= 1;
    }

    public final void a(uh2 uh2Var) {
        this.preProcessingFlag_ = uh2Var;
        this.bitField0_ |= 2;
    }

    public static a70 a(InputStream inputStream) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, com.google.crypto.tink.shaded.protobuf.k.a(inputStream), nl0.a());
        cu0.a(cu0VarA);
        return (a70) cu0VarA;
    }
}
