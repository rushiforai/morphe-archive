package ads_mobile_sdk;

import java.util.Optional;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes2.dex */
public final class of3 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f7910a;

    /* renamed from: b, reason: collision with root package name */
    public final z1 f7911b;

    /* renamed from: c, reason: collision with root package name */
    public final y2 f7912c;

    /* renamed from: d, reason: collision with root package name */
    public final b.a5 f7913d;

    /* renamed from: e, reason: collision with root package name */
    public final b.xa f7914e;

    /* renamed from: f, reason: collision with root package name */
    public final Optional f7915f;

    /* renamed from: g, reason: collision with root package name */
    public volatile t70.g2 f7916g;

    public of3(t70.j0 backgroundScope, z1 adConfiguration, y2 adEventEmitter, b.a5 rewardedEventEmitter, b.xa thirdPartyVideoEventEmitter, Optional nativeAdMapper) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(rewardedEventEmitter, "rewardedEventEmitter");
        Intrinsics.g(thirdPartyVideoEventEmitter, "thirdPartyVideoEventEmitter");
        Intrinsics.g(nativeAdMapper, "nativeAdMapper");
        this.f7910a = backgroundScope;
        this.f7911b = adConfiguration;
        this.f7912c = adEventEmitter;
        this.f7913d = rewardedEventEmitter;
        this.f7914e = thirdPartyVideoEventEmitter;
        this.f7915f = nativeAdMapper;
    }

    public final void a() {
        Continuation continuation = null;
        if (this.f7915f.isPresent()) {
            if (((b.f3) this.f7915f.get()).b() && this.f7911b.f12396p0 == y1.f11910g) {
                t70.j0 j0Var = this.f7910a;
                af3 af3Var = new af3(this, continuation, 1);
                EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var, "<this>");
                Intrinsics.g(context, "context");
                m0.t(j0Var, context, null, new ar.a(af3Var, null), 2);
            }
        } else if (this.f7911b.f12396p0 != y1.f11909f || this.f7916g != null) {
            t70.j0 j0Var2 = this.f7910a;
            af3 af3Var2 = new af3(this, continuation, 2);
            EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var2, "<this>");
            Intrinsics.g(context2, "context");
            m0.t(j0Var2, context2, null, new ar.a(af3Var2, null), 2);
        }
        t70.g2 g2Var = this.f7916g;
        if (g2Var != null) {
            g2Var.c(null);
        }
    }
}
