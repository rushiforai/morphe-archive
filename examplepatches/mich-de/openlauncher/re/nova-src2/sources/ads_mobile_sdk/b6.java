package ads_mobile_sdk;

import b.t2;
import java.util.Objects;

/* loaded from: classes.dex */
public final class b6 extends cu0 {
    private static final b6 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f1275c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f1276d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f1277e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f1278f = 4;
    private int bitField0_;
    private long createTimeMs_;
    private int status_;
    private String filename_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String checksum_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        b6 b6Var = new b6();
        DEFAULT_INSTANCE = b6Var;
        cu0.a(b6.class, b6Var);
    }

    public static b.k s() {
        return (b.k) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ለ\u0000\u0002ဂ\u0001\u0003ለ\u0002\u0004ဌ\u0003", new Object[]{"bitField0_", "filename_", "createTimeMs_", "checksum_", "status_"});
        }
        if (iA == 3) {
            return new b6();
        }
        if (iA != 4) {
            return null;
        }
        return new b.k(DEFAULT_INSTANCE);
    }

    public final String o() {
        return this.checksum_;
    }

    public final long p() {
        return this.createTimeMs_;
    }

    public final String q() {
        return this.filename_;
    }

    public final z5 r() {
        int i5 = this.status_;
        z5 z5Var = i5 != 0 ? i5 != 1 ? i5 != 2 ? null : z5.READ : z5.AVAILABLE : z5.UNSPECIFIED;
        return z5Var == null ? z5.UNRECOGNIZED : z5Var;
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 4;
        this.checksum_ = str;
    }

    public final void c(String str) {
        this.bitField0_ |= 1;
        this.filename_ = str;
    }
}
