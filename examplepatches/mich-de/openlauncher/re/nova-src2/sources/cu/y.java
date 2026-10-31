package cu;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;

/* loaded from: classes4.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final ru.d f47975a;

    /* renamed from: b, reason: collision with root package name */
    public final fv.k f47976b;

    /* renamed from: c, reason: collision with root package name */
    public final au.i f47977c;

    /* renamed from: d, reason: collision with root package name */
    public final ou.c f47978d;

    /* renamed from: e, reason: collision with root package name */
    public final w60.a f47979e;

    /* renamed from: f, reason: collision with root package name */
    public final PaymentMethodMetadata f47980f;

    /* renamed from: g, reason: collision with root package name */
    public final CoroutineContext f47981g;

    /* renamed from: h, reason: collision with root package name */
    public final CoroutineContext f47982h;

    /* renamed from: i, reason: collision with root package name */
    public final j0 f47983i;

    /* renamed from: j, reason: collision with root package name */
    public final s40.b f47984j;

    public y(ru.d eventReporter, fv.k customerRepository, au.i selectionHolder, ou.c customerStateHolder, w60.a manageNavigatorProvider, PaymentMethodMetadata paymentMethodMetadata, CoroutineContext workContext, CoroutineContext uiContext, j0 viewModelScope, s40.b bVar) {
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(customerRepository, "customerRepository");
        Intrinsics.g(selectionHolder, "selectionHolder");
        Intrinsics.g(customerStateHolder, "customerStateHolder");
        Intrinsics.g(manageNavigatorProvider, "manageNavigatorProvider");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(viewModelScope, "viewModelScope");
        this.f47975a = eventReporter;
        this.f47976b = customerRepository;
        this.f47977c = selectionHolder;
        this.f47978d = customerStateHolder;
        this.f47979e = manageNavigatorProvider;
        this.f47980f = paymentMethodMetadata;
        this.f47981g = workContext;
        this.f47982h = uiContext;
        this.f47983i = viewModelScope;
        this.f47984j = bVar;
    }
}
