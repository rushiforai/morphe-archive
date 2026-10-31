package ads_mobile_sdk;

import b.t2;
import b.wc;
import java.io.InputStream;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class ze extends cu0 {
    private static final ze DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12525c = 1;
    private gn1 logs_ = gn1.f4008b;

    static {
        ze zeVar = new ze();
        DEFAULT_INSTANCE = zeVar;
        cu0.a(ze.class, zeVar);
    }

    public static ze o() {
        return DEFAULT_INSTANCE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", new Object[]{"logs_", new dn1(ft3.f3519d, ft3.f3521f, kv0.o())});
        }
        if (iA == 3) {
            return new ze();
        }
        if (iA != 4) {
            return null;
        }
        return new wc(DEFAULT_INSTANCE);
    }

    public final Map p() {
        return Collections.unmodifiableMap(this.logs_);
    }

    public static ze a(InputStream inputStream) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, com.google.crypto.tink.shaded.protobuf.k.a(inputStream), nl0.a());
        cu0.a(cu0VarA);
        return (ze) cu0VarA;
    }
}
