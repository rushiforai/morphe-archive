package ads_mobile_sdk;

import b.k1;
import b.t2;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class em1 extends cu0 {
    private static final em1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f2913c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f2914d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f2915e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f2916f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f2917g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f2918h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f2919i = 7;
    private int bitField0_;
    private long eventCount_;
    private long eventId_;
    private long runtimeMs_;
    private int status_;
    private String exceptionName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String stackTrace_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String debugInfo_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        em1 em1Var = new em1();
        DEFAULT_INSTANCE = em1Var;
        cu0.a(em1.class, em1Var);
    }

    public static k1 o() {
        return (k1) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0000\u0000\u0001ဂ\u0000\u0002ဂ\u0001\u0003᠌\u0002\u0004ဈ\u0003\u0005ဈ\u0004\u0006ဂ\u0005\u0007ဈ\u0006", new Object[]{"bitField0_", "eventId_", "runtimeMs_", "status_", ad.a$7, "exceptionName_", "stackTrace_", "eventCount_", "debugInfo_"});
        }
        if (iA == 3) {
            return new em1();
        }
        if (iA != 4) {
            return null;
        }
        return new k1(DEFAULT_INSTANCE);
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 64;
        this.debugInfo_ = str;
    }

    public final void c(String str) {
        this.bitField0_ |= 8;
        this.exceptionName_ = str;
    }

    public final void d(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 16;
        this.stackTrace_ = str;
    }
}
