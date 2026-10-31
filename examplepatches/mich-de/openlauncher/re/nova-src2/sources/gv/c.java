package gv;

import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements h {

    /* renamed from: a, reason: collision with root package name */
    public final su.a f57840a;

    /* renamed from: b, reason: collision with root package name */
    public final EventReporter$Mode f57841b;

    /* renamed from: c, reason: collision with root package name */
    public final w60.a f57842c;

    /* renamed from: d, reason: collision with root package name */
    public final br.a f57843d;

    public c(su.a cvcRecollectionHandler, EventReporter$Mode mode, w60.a analyticEventCallbackProvider, br.a linkGateFactory) {
        Intrinsics.g(cvcRecollectionHandler, "cvcRecollectionHandler");
        Intrinsics.g(mode, "mode");
        Intrinsics.g(analyticEventCallbackProvider, "analyticEventCallbackProvider");
        Intrinsics.g(linkGateFactory, "linkGateFactory");
        this.f57840a = cvcRecollectionHandler;
        this.f57841b = mode;
        this.f57842c = analyticEventCallbackProvider;
        this.f57843d = linkGateFactory;
    }
}
