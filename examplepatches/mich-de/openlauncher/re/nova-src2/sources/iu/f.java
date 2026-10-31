package iu;

import b70.h;
import com.stripe.android.core.exception.StripeException;
import fr.l;
import java.util.Map;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final l f68111a;

    /* renamed from: b, reason: collision with root package name */
    public final fr.c f68112b;

    public f(l analyticsRequestExecutor, fr.c analyticsRequestFactory) {
        Intrinsics.g(analyticsRequestExecutor, "analyticsRequestExecutor");
        Intrinsics.g(analyticsRequestFactory, "analyticsRequestFactory");
        this.f68111a = analyticsRequestExecutor;
        this.f68112b = analyticsRequestFactory;
    }

    public final void a(b errorEvent, StripeException stripeException, Map additionalNonPiiParams) {
        Intrinsics.g(errorEvent, "errorEvent");
        Intrinsics.g(additionalNonPiiParams, "additionalNonPiiParams");
        this.f68111a.a(this.f68112b.a(errorEvent, MapsKt.m0(stripeException == null ? h.f17594a : a.b(stripeException), additionalNonPiiParams)));
    }
}
