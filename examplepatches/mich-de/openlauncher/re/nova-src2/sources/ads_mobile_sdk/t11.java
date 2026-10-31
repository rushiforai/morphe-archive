package ads_mobile_sdk;

import a70.d;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class t11 {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f9754a;

    /* renamed from: b, reason: collision with root package name */
    public final b.m5 f9755b;

    /* renamed from: c, reason: collision with root package name */
    public final b.m5 f9756c;

    /* renamed from: d, reason: collision with root package name */
    public final b41 f9757d;

    /* renamed from: e, reason: collision with root package name */
    public final d f9758e;

    public t11(jr0 flags, b.m5 httpClientProvider, b.m5 m5Var, b41 initializationConfigWrapper) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(httpClientProvider, "httpClientProvider");
        Intrinsics.g(initializationConfigWrapper, "initializationConfigWrapper");
        this.f9754a = flags;
        this.f9755b = httpClientProvider;
        this.f9756c = m5Var;
        this.f9757d = initializationConfigWrapper;
        this.f9758e = LazyKt.a(new a3.e(this, 9));
    }
}
