package hv;

import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class a0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60104a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ kv.c f60105b;

    public /* synthetic */ a0(kv.c cVar, int i5) {
        this.f60104a = i5;
        this.f60105b = cVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f60104a) {
            case 0:
                List visiblePaymentMethods = (List) obj;
                List hiddenPaymentMethods = (List) obj2;
                Intrinsics.g(visiblePaymentMethods, "visiblePaymentMethods");
                Intrinsics.g(hiddenPaymentMethods, "hiddenPaymentMethods");
                kv.c cVar = this.f60105b;
                ru.d dVar = cVar.f72267b;
                gv.z0 z0Var = (gv.z0) cVar.l().getValue();
                if (z0Var == null || !cVar.f72272g) {
                    z0Var = null;
                }
                ((ru.a) dVar).l(visiblePaymentMethods, hiddenPaymentMethods, z0Var, false);
                break;
            case 1:
                PaymentSelection paymentSelection = (PaymentSelection) obj;
                boolean zBooleanValue = ((Boolean) obj2).booleanValue();
                kv.c cVar2 = this.f60105b;
                if (zBooleanValue) {
                    cVar2.n(paymentSelection);
                } else {
                    cVar2.t(paymentSelection);
                }
                break;
            case 2:
                PaymentSelection paymentSelection2 = (PaymentSelection) obj;
                boolean zBooleanValue2 = ((Boolean) obj2).booleanValue();
                kv.c cVar3 = this.f60105b;
                if (zBooleanValue2) {
                    cVar3.n(paymentSelection2);
                } else {
                    cVar3.t(paymentSelection2);
                }
                break;
            default:
                List visiblePaymentMethods2 = (List) obj;
                List hiddenPaymentMethods2 = (List) obj2;
                Intrinsics.g(visiblePaymentMethods2, "visiblePaymentMethods");
                Intrinsics.g(hiddenPaymentMethods2, "hiddenPaymentMethods");
                kv.c cVar4 = this.f60105b;
                ((ru.a) cVar4.f72267b).l(visiblePaymentMethods2, hiddenPaymentMethods2, (gv.z0) cVar4.l().getValue(), true);
                break;
        }
        return Unit.f71706a;
    }
}
