package ads_mobile_sdk;

import b.fd;
import b.t2;
import java.io.InputStream;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class zu1 extends cu0 {
    private static final zu1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12669c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f12670d = 2;
    private gn1 adUnitToUseMediaView_ = gn1.f4008b;
    private long appVersionCode_;

    static {
        zu1 zu1Var = new zu1();
        DEFAULT_INSTANCE = zu1Var;
        cu0.a(zu1.class, zu1Var);
    }

    public static zu1 q() {
        return DEFAULT_INSTANCE;
    }

    public static fd r() {
        return (fd) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0000\u0001\u0002\u0002\u0001\u0000\u0000\u0001\u0002\u00022", new Object[]{"appVersionCode_", "adUnitToUseMediaView_", new dn1(ft3.f3519d, ft3.f3518c, Boolean.FALSE)});
        }
        if (iA == 3) {
            return new zu1();
        }
        if (iA != 4) {
            return null;
        }
        return new fd(DEFAULT_INSTANCE);
    }

    public final Map o() {
        return Collections.unmodifiableMap(this.adUnitToUseMediaView_);
    }

    public final long p() {
        return this.appVersionCode_;
    }

    public static zu1 a(InputStream inputStream) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, com.google.crypto.tink.shaded.protobuf.k.a(inputStream), nl0.a());
        cu0.a(cu0VarA);
        return (zu1) cu0VarA;
    }
}
