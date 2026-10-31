package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class kx2 {

    /* renamed from: a, reason: collision with root package name */
    public final z1 f6012a;

    /* renamed from: b, reason: collision with root package name */
    public final hv f6013b;

    /* renamed from: c, reason: collision with root package name */
    public final jx2 f6014c;

    public kx2(z1 adConfiguration, hv commonConfiguration, jx2 retryingUrlPinger) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(retryingUrlPinger, "retryingUrlPinger");
        this.f6012a = adConfiguration;
        this.f6013b = commonConfiguration;
        this.f6014c = retryingUrlPinger;
    }
}
