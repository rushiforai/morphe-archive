package dt;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.z2;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.h3;

/* loaded from: classes4.dex */
public final class i extends ct.t {

    /* renamed from: a, reason: collision with root package name */
    public static final i f49452a = new i();

    @Override // ct.t
    public final void k(PaymentMethodMetadata paymentMethodMetadata, ct.p pVar, bt.e eVar) {
        if (h.f49448a.c(paymentMethodMetadata)) {
            IdentifierSpec.Companion.getClass();
            eVar.c(new h3(kw.z0.a("mandate"), 2132019702, ul.b.P(pVar.f47884g), 0.0f, 24));
        }
    }

    @Override // ct.t
    public final bt.g l(PaymentMethodMetadata paymentMethodMetadata) {
        z2 z2Var = PaymentMethod.Type.f43637g;
        return new bt.g("amazon_pay", null, 2132019932, 2131232246, false, null, 802);
    }
}
