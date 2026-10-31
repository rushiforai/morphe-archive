package cu;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import kotlin.jvm.internal.Intrinsics;
import ou.g2;

/* loaded from: classes4.dex */
public final class c implements h {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodMetadata f47923a;

    /* renamed from: b, reason: collision with root package name */
    public final ou.c f47924b;

    /* renamed from: c, reason: collision with root package name */
    public final au.i f47925c;

    /* renamed from: d, reason: collision with root package name */
    public final g2 f47926d;

    /* renamed from: e, reason: collision with root package name */
    public final ru.d f47927e;

    /* renamed from: f, reason: collision with root package name */
    public final w60.a f47928f;

    public c(PaymentMethodMetadata paymentMethodMetadata, ou.c customerStateHolder, au.i selectionHolder, g2 savedPaymentMethodMutator, ru.d eventReporter, w60.a manageNavigatorProvider) {
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(customerStateHolder, "customerStateHolder");
        Intrinsics.g(selectionHolder, "selectionHolder");
        Intrinsics.g(savedPaymentMethodMutator, "savedPaymentMethodMutator");
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(manageNavigatorProvider, "manageNavigatorProvider");
        this.f47923a = paymentMethodMetadata;
        this.f47924b = customerStateHolder;
        this.f47925c = selectionHolder;
        this.f47926d = savedPaymentMethodMutator;
        this.f47927e = eventReporter;
        this.f47928f = manageNavigatorProvider;
    }
}
