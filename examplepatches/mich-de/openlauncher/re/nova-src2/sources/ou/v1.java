package ou;

import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.Unit;
import kotlin.coroutines.Continuation;

/* loaded from: classes4.dex */
public final class v1 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g2 f80995a;

    public v1(g2 g2Var) {
        this.f80995a = g2Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        PaymentSelection paymentSelection = (PaymentSelection) obj;
        if (paymentSelection instanceof PaymentSelection.Saved) {
            c cVar = this.f80995a.f80889i;
            cVar.f80803a.d("saved_selection", ((PaymentSelection.Saved) paymentSelection).f44846a);
        }
        return Unit.f71706a;
    }
}
