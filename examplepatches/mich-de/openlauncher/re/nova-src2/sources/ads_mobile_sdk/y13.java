package ads_mobile_sdk;

import b.t2;
import java.io.InputStream;
import java.util.Objects;

/* loaded from: classes.dex */
public final class y13 extends cu0 {
    private static final y13 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11919c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f11920d = 2;
    private int bitField0_;
    private String cachedSdkCore_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private long lastUpdateTimeMs_;

    static {
        y13 y13Var = new y13();
        DEFAULT_INSTANCE = y13Var;
        cu0.a(y13.class, y13Var);
    }

    public static y13 p() {
        return DEFAULT_INSTANCE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ለ\u0000\u0002ဂ\u0001", new Object[]{"bitField0_", "cachedSdkCore_", "lastUpdateTimeMs_"});
        }
        if (iA == 3) {
            return new y13();
        }
        if (iA != 4) {
            return null;
        }
        return new b.jc(DEFAULT_INSTANCE);
    }

    public final String o() {
        return this.cachedSdkCore_;
    }

    public final long q() {
        return this.lastUpdateTimeMs_;
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 1;
        this.cachedSdkCore_ = str;
    }

    public static y13 a(InputStream inputStream) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, com.google.crypto.tink.shaded.protobuf.k.a(inputStream), nl0.a());
        cu0.a(cu0VarA);
        return (y13) cu0VarA;
    }
}
