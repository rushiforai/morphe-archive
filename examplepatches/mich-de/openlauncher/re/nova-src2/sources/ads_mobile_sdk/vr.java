package ads_mobile_sdk;

import b.t2;
import java.util.Objects;

/* loaded from: classes.dex */
public final class vr extends cu0 {
    private static final vr DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10872c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10873d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f10874e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f10875f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f10876g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f10877h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f10878i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f10879j = 8;
    private int numPreloadedAds_;
    private int numPreloaders_;
    private int preloaderFormat_;
    private boolean preloaderInFlight_;
    private int preloaderMaxBufferSize_;
    private int preloaderNumAdsAvailable_;
    private String preloaderPreloadId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private int totalInflightAdLimit_;

    static {
        vr vrVar = new vr();
        DEFAULT_INSTANCE = vrVar;
        cu0.a(vr.class, vrVar);
    }

    public static b.pb o() {
        return (b.pb) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\b\u0000\u0000\u0001\b\b\u0000\u0000\u0000\u0001\u0004\u0002\u0004\u0003\u0004\u0004\f\u0005Ȉ\u0006\u0004\u0007\u0004\b\u0007", new Object[]{"totalInflightAdLimit_", "numPreloadedAds_", "numPreloaders_", "preloaderFormat_", "preloaderPreloadId_", "preloaderMaxBufferSize_", "preloaderNumAdsAvailable_", "preloaderInFlight_"});
        }
        if (iA == 3) {
            return new vr();
        }
        if (iA != 4) {
            return null;
        }
        return new b.pb(DEFAULT_INSTANCE);
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.preloaderPreloadId_ = str;
    }
}
