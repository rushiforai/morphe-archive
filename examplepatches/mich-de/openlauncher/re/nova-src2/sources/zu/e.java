package zu;

import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.Unit;
import kotlin.coroutines.Continuation;

/* loaded from: classes4.dex */
public final class e implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f98602a;

    public e(m mVar) {
        this.f98602a = mVar;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        this.f98602a.f98624p.invoke((PaymentSelection.New.USBankAccount) obj);
        return Unit.f71706a;
    }
}
