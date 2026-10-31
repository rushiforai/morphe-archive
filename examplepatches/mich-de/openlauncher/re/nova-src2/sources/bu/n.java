package bu;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;

/* loaded from: classes4.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodMetadata f18565a;

    /* renamed from: b, reason: collision with root package name */
    public final String f18566b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f18567c;

    /* renamed from: d, reason: collision with root package name */
    public final au.i f18568d;

    /* renamed from: e, reason: collision with root package name */
    public final au.g f18569e;

    /* renamed from: f, reason: collision with root package name */
    public final j0 f18570f;

    /* renamed from: g, reason: collision with root package name */
    public final i f18571g;

    /* renamed from: h, reason: collision with root package name */
    public final ru.d f18572h;

    public n(PaymentMethodMetadata paymentMethodMetadata, String paymentMethodCode, boolean z11, au.i embeddedSelectionHolder, au.g embeddedFormHelperFactory, j0 viewModelScope, i formActivityStateHelper, ru.d eventReporter) {
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(paymentMethodCode, "paymentMethodCode");
        Intrinsics.g(embeddedSelectionHolder, "embeddedSelectionHolder");
        Intrinsics.g(embeddedFormHelperFactory, "embeddedFormHelperFactory");
        Intrinsics.g(viewModelScope, "viewModelScope");
        Intrinsics.g(formActivityStateHelper, "formActivityStateHelper");
        Intrinsics.g(eventReporter, "eventReporter");
        this.f18565a = paymentMethodMetadata;
        this.f18566b = paymentMethodCode;
        this.f18567c = z11;
        this.f18568d = embeddedSelectionHolder;
        this.f18569e = embeddedFormHelperFactory;
        this.f18570f = viewModelScope;
        this.f18571g = formActivityStateHelper;
        this.f18572h = eventReporter;
    }
}
