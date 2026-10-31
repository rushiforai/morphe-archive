package ads_mobile_sdk;

import b.t0;
import b.t2;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class de extends cu0 {
    private static final de DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f2473c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f2474d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f2475e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f2476f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f2477g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f2478h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f2479i = 7;
    private int bitField0_;
    private long evtTime_;
    private long uptSignal_;
    private long vcdSignal_;
    private String adshieldVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String afmaVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String appIdSignal_ = "D";
    private String cerSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        de deVar = new de();
        DEFAULT_INSTANCE = deVar;
        cu0.a(de.class, deVar);
    }

    public static t0 o() {
        return (t0) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003ဂ\u0002\u0004ဈ\u0003\u0005ဂ\u0004\u0006ဂ\u0005\u0007ဈ\u0006", new Object[]{"bitField0_", "adshieldVersion_", "afmaVersion_", "evtTime_", "appIdSignal_", "vcdSignal_", "uptSignal_", "cerSignal_"});
        }
        if (iA == 3) {
            return new de();
        }
        if (iA != 4) {
            return null;
        }
        return new t0(DEFAULT_INSTANCE);
    }

    public final void p() {
        this.bitField0_ |= 1;
        this.adshieldVersion_ = "0.960507516";
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 2;
        this.afmaVersion_ = str;
    }

    public final void c(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 8;
        this.appIdSignal_ = str;
    }

    public final void d(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 64;
        this.cerSignal_ = str;
    }
}
