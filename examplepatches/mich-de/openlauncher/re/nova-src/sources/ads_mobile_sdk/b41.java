package ads_mobile_sdk;

import cw.l2;

/* loaded from: classes.dex */
public final class b41 {

    /* renamed from: a, reason: collision with root package name */
    public volatile x7.u f1261a;

    public final x7.u a() {
        ci3 ci3Var;
        x7.u uVar = this.f1261a;
        if (uVar == null) {
            mu0.b("InitializationConfig is requested but null. MobileAds.initialize() must be called first.", null);
            IllegalStateException illegalStateException = new IllegalStateException("InitializationConfig is requested but null. MobileAds.initialize() must be called first.");
            illegalStateException.printStackTrace();
            hq hqVar = gq.f4020a;
            if (hqVar == hq.f4479b || hqVar == hq.f4480c) {
                throw illegalStateException;
            }
            if (hqVar == hq.f4478a && (ci3Var = l2.f48204a) != null) {
                ci3Var.a("InitializationConfig is requested but null. MobileAds.initialize() must be called first.", (Throwable) illegalStateException);
                return uVar;
            }
        }
        return uVar;
    }
}
