package bu;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import w70.i2;

/* loaded from: classes4.dex */
public final /* synthetic */ class j implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18559a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n f18560b;

    public /* synthetic */ j(n nVar, int i5) {
        this.f18559a = i5;
        this.f18560b = nVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Object value;
        Object value2;
        switch (this.f18559a) {
            case 0:
                ResolvableString resolvableString = (ResolvableString) obj;
                i2 i2Var = this.f18560b.f18571g.f18556f;
                do {
                    value = i2Var.getValue();
                } while (!i2Var.i(value, u.a((u) value, null, false, null, false, resolvableString, null, 95)));
            case 1:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                i2 i2Var2 = this.f18560b.f18571g.f18556f;
                do {
                    value2 = i2Var2.getValue();
                } while (!i2Var2.i(value2, u.a((u) value2, null, zBooleanValue, null, false, null, null, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE)));
            default:
                this.f18560b.f18568d.a((PaymentSelection) obj);
                break;
        }
        return Unit.f71706a;
    }
}
