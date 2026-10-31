package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class t42 {

    /* renamed from: a, reason: collision with root package name */
    public final z1 f9777a;

    /* renamed from: b, reason: collision with root package name */
    public final hv f9778b;

    /* renamed from: c, reason: collision with root package name */
    public final q22 f9779c;

    /* renamed from: d, reason: collision with root package name */
    public final n42 f9780d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f9781e;

    public t42(z1 adConfiguration, hv commonConfiguration, q22 networkConnectivityManager, n42 offlineDatabase, jr0 flags) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(networkConnectivityManager, "networkConnectivityManager");
        Intrinsics.g(offlineDatabase, "offlineDatabase");
        Intrinsics.g(flags, "flags");
        this.f9777a = adConfiguration;
        this.f9778b = commonConfiguration;
        this.f9779c = networkConnectivityManager;
        this.f9780d = offlineDatabase;
        this.f9781e = flags;
    }
}
