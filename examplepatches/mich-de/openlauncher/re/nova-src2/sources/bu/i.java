package bu;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentelement.EmbeddedPaymentElement$Configuration;
import com.stripe.android.ui.core.Amount;
import hv.c3;
import hv.s2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import ps.e0;
import t70.j0;
import t70.m0;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodMetadata f18551a;

    /* renamed from: b, reason: collision with root package name */
    public final au.i f18552b;

    /* renamed from: c, reason: collision with root package name */
    public final EmbeddedPaymentElement$Configuration f18553c;

    /* renamed from: d, reason: collision with root package name */
    public final b0 f18554d;

    /* renamed from: e, reason: collision with root package name */
    public final ru.d f18555e;

    /* renamed from: f, reason: collision with root package name */
    public final i2 f18556f;

    /* renamed from: g, reason: collision with root package name */
    public final i2 f18557g;

    /* renamed from: h, reason: collision with root package name */
    public s2 f18558h;

    public i(PaymentMethodMetadata paymentMethodMetadata, au.i selectionHolder, EmbeddedPaymentElement$Configuration configuration, b0 onClickDelegate, ru.d eventReporter, j0 coroutineScope) {
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(selectionHolder, "selectionHolder");
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(onClickDelegate, "onClickDelegate");
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(coroutineScope, "coroutineScope");
        this.f18551a = paymentMethodMetadata;
        this.f18552b = selectionHolder;
        this.f18553c = configuration;
        this.f18554d = onClickDelegate;
        this.f18555e = eventReporter;
        i2 i2VarC = u1.c(new u(a(paymentMethodMetadata.f43092a, configuration), false, new c3(), false, configuration.f44124t == kt.j.f72208a, null, null));
        this.f18556f = i2VarC;
        this.f18557g = i2VarC;
        m0.t(coroutineScope, null, null, new a60.a(this, null, 28), 3);
    }

    public static ResolvableString a(StripeIntent stripeIntent, EmbeddedPaymentElement$Configuration embeddedPaymentElement$Configuration) {
        Intrinsics.g(stripeIntent, "<this>");
        boolean z11 = stripeIntent instanceof PaymentIntent;
        Amount amount = null;
        Long l9 = z11 ? ((PaymentIntent) stripeIntent).f43535c : null;
        String strO = e0.o(stripeIntent);
        if (l9 != null && strO != null) {
            amount = new Amount(l9.longValue(), strO);
        }
        String str = embeddedPaymentElement$Configuration.f44115i;
        int iOrdinal = embeddedPaymentElement$Configuration.f44124t.ordinal();
        if (iOrdinal == 0) {
            return str != null ? zg.a.H(str) : zg.a.G(2132019759);
        }
        if (iOrdinal != 1) {
            throw new NoWhenBranchMatchedException();
        }
        if (str != null) {
            return zg.a.H(str);
        }
        if (z11) {
            return amount != null ? amount.b() : zg.a.G(2132019925);
        }
        return zg.a.G(2132020010);
    }
}
