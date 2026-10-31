package ads_mobile_sdk;

import b.na;
import b.t2;

/* loaded from: classes.dex */
public final class tm1 extends cu0 {
    private static final tm1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10005c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10006d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f10007e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f10008f = 4;
    private int bitField0_;
    private float logSampleRate_;
    private String remoteCaptureServiceUrl_ = "https://pagead2.googlesyndication.com/pagead/ping?e=2&f=1";
    private long logBufferSize_ = 1000;
    private long logIntervalMs_ = 60000;

    static {
        tm1 tm1Var = new tm1();
        DEFAULT_INSTANCE = tm1Var;
        cu0.a(tm1.class, tm1Var);
    }

    public static tm1 o() {
        return DEFAULT_INSTANCE;
    }

    public static na t() {
        return (na) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဈ\u0000\u0002ခ\u0001\u0003ဂ\u0002\u0004ဂ\u0003", new Object[]{"bitField0_", "remoteCaptureServiceUrl_", "logSampleRate_", "logBufferSize_", "logIntervalMs_"});
        }
        if (iA == 3) {
            return new tm1();
        }
        if (iA != 4) {
            return null;
        }
        return new na(DEFAULT_INSTANCE);
    }

    public final long p() {
        return this.logBufferSize_;
    }

    public final long q() {
        return this.logIntervalMs_;
    }

    public final float r() {
        return this.logSampleRate_;
    }

    public final String s() {
        return this.remoteCaptureServiceUrl_;
    }

    public final void b(String str) {
        this.bitField0_ |= 1;
        this.remoteCaptureServiceUrl_ = str;
    }
}
