package gs;

import a80.m;
import b10.k;
import com.stripe.android.core.StripeError;
import com.stripe.android.core.exception.APIException;
import fr.l;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import p6.j;
import t70.k0;
import t70.m0;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final l f57758a;

    /* renamed from: b, reason: collision with root package name */
    public final jt.a f57759b;

    /* renamed from: c, reason: collision with root package name */
    public final iu.f f57760c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f57761d;

    /* renamed from: e, reason: collision with root package name */
    public final xq.c f57762e;

    /* renamed from: f, reason: collision with root package name */
    public final ir.c f57763f;

    public b(l analyticsRequestExecutor, jt.a paymentAnalyticsRequestFactory, iu.f errorReporter, CoroutineContext workContext, xq.c logger, ir.c durationProvider) {
        Intrinsics.g(analyticsRequestExecutor, "analyticsRequestExecutor");
        Intrinsics.g(paymentAnalyticsRequestFactory, "paymentAnalyticsRequestFactory");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(durationProvider, "durationProvider");
        this.f57758a = analyticsRequestExecutor;
        this.f57759b = paymentAnalyticsRequestFactory;
        this.f57760c = errorReporter;
        this.f57761d = workContext;
        this.f57762e = logger;
        this.f57763f = durationProvider;
    }

    public final void a(g gVar, Map map) {
        this.f57762e.a("Link event: " + gVar.c() + " " + map);
        m0.t(k0.a(this.f57761d), null, null, new k(this, gVar, map, (Continuation) null, 14), 3);
    }

    public final void b(Throwable th2) {
        a(d.f57764b, MapsKt.m0(m.n("error_message", j.m(th2)), iu.a.a(th2)));
    }

    public final void c(h hVar) {
        String str;
        int iOrdinal = hVar.ordinal();
        if (iOrdinal == 0) {
            str = "requiresSignUp";
        } else if (iOrdinal == 1) {
            str = "requiresVerification";
        } else {
            if (iOrdinal != 2) {
                throw new NoWhenBranchMatchedException();
            }
            str = "verified";
        }
        Map mapN = m.n("sessionState", str);
        t2.c.L(this.f57760c, iu.e.f68090e, null, null, 6);
        a(d.n, mapN);
    }

    public final void d() {
        Duration durationA = ((ir.a) this.f57763f).a(ir.b.f67997c);
        a(d.f57774l, durationA != null ? b70.k.e0(new Pair("duration", Float.valueOf((float) Duration.p(durationA.f72041a, DurationUnit.f72046e)))) : null);
    }

    public final void e(Throwable th2) {
        StripeError stripeError;
        String str;
        Map mapN = null;
        if ((th2 instanceof APIException) && (stripeError = ((APIException) th2).f42563a) != null && (str = stripeError.f42551b) != null) {
            mapN = m.n("error_message", str);
        }
        if (mapN == null) {
            mapN = m.n("error_message", j.m(th2));
        }
        a(d.f57775m, MapsKt.m0(mapN, iu.a.a(th2)));
    }
}
