package hv;

import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes4.dex */
public final class y implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60679a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b0 f60680b;

    public /* synthetic */ y(b0 b0Var, int i5) {
        this.f60679a = i5;
        this.f60680b = b0Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) throws Throwable {
        switch (this.f60679a) {
            case 0:
                this.f60680b.f60146f.invoke();
                break;
            case 1:
                String str = (String) obj;
                b0 b0Var = this.f60680b;
                yu.a aVar = (yu.a) b0Var.f60144d.invoke(str);
                List list = (List) b0Var.f60145e.invoke(str);
                zu.m mVar = (zu.m) b0Var.f60150j.invoke(str);
                w70.i2 i2Var = b0Var.f60155q;
                i2Var.k(null, b.a((b) i2Var.getValue(), str, aVar, list, null, false, mVar, 242));
                break;
            case 2:
                PaymentSelection paymentSelection = (PaymentSelection) obj;
                w70.i2 i2Var2 = this.f60680b.f60155q;
                i2Var2.k(null, b.a((b) i2Var2.getValue(), null, null, null, paymentSelection, false, null, 495));
                break;
            case 3:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                w70.i2 i2Var3 = this.f60680b.f60155q;
                i2Var3.k(null, b.a((b) i2Var3.getValue(), null, null, null, null, zBooleanValue, null, 479));
                break;
            default:
                b0 b0Var2 = this.f60680b;
                Object objY = t70.m0.y(b0Var2.f60152l, new androidx.room.c(b0Var2, null, 29), continuation);
                if (objY != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
        }
        return Unit.f71706a;
    }
}
