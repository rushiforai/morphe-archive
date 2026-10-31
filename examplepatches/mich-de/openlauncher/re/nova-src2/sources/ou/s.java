package ou;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.Unit;
import kotlin.coroutines.Continuation;

/* loaded from: classes4.dex */
public final class s implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t f80972a;

    public s(t tVar) {
        this.f80972a = tVar;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        PaymentSelection paymentSelection = (PaymentSelection) obj;
        t tVar = this.f80972a;
        ResolvableString resolvableStringD = paymentSelection != null ? paymentSelection.d(tVar.f80976b, ((Boolean) tVar.f80978d.invoke()).booleanValue()) : null;
        PaymentSelection.Saved saved = paymentSelection instanceof PaymentSelection.Saved ? (PaymentSelection.Saved) paymentSelection : null;
        boolean z11 = false;
        if (saved != null && saved.f44846a.f43573e == PaymentMethod.Type.f43642l) {
            z11 = true;
        }
        tVar.a(resolvableStringD, z11);
        return Unit.f71706a;
    }
}
