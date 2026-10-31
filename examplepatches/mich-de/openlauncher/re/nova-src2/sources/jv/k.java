package jv;

import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class k implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70087a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q f70088b;

    public /* synthetic */ k(q qVar, int i5) {
        this.f70087a = i5;
        this.f70088b = qVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f70087a) {
            case 0:
                this.f70088b.f70126g.invoke(new PaymentSelection.Link(null, null, null, 7), Boolean.FALSE);
                break;
            case 1:
                this.f70088b.f70126g.invoke(PaymentSelection.GooglePay.f44810a, Boolean.FALSE);
                break;
            case 2:
                this.f70088b.b(a1.f69990a);
                break;
            default:
                this.f70088b.b(w0.f70184a);
                break;
        }
        return Unit.f71706a;
    }
}
