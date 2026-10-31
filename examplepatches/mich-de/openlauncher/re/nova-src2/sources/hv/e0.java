package hv;

import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e0 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60217a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i0 f60218b;

    public /* synthetic */ e0(i0 i0Var, int i5) {
        this.f60217a = i5;
        this.f60218b = i0Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        Object value;
        Object value2;
        Object value3;
        Object value4;
        Object value5;
        Object value6;
        switch (this.f60217a) {
            case 0:
                List list = (List) obj;
                w70.i2 i2Var = this.f60218b.f60317p;
                do {
                    value = i2Var.getValue();
                } while (!i2Var.i(value, h4.a((h4) value, list, null, false, false, false, false, 62)));
            case 1:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                w70.i2 i2Var2 = this.f60218b.f60317p;
                do {
                    value2 = i2Var2.getValue();
                } while (!i2Var2.i(value2, h4.a((h4) value2, null, null, zBooleanValue, false, false, false, 59)));
            case 2:
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                w70.i2 i2Var3 = this.f60218b.f60317p;
                do {
                    value3 = i2Var3.getValue();
                } while (!i2Var3.i(value3, h4.a((h4) value3, null, null, false, false, zBooleanValue2, false, 47)));
            case 3:
                boolean zBooleanValue3 = ((Boolean) obj).booleanValue();
                w70.i2 i2Var4 = this.f60218b.f60317p;
                do {
                    value4 = i2Var4.getValue();
                } while (!i2Var4.i(value4, h4.a((h4) value4, null, null, false, false, false, zBooleanValue3, 31)));
            case 4:
                boolean zBooleanValue4 = ((Boolean) obj).booleanValue();
                w70.i2 i2Var5 = this.f60218b.f60317p;
                do {
                    value5 = i2Var5.getValue();
                } while (!i2Var5.i(value5, h4.a((h4) value5, null, null, false, zBooleanValue4, false, false, 55)));
            case 5:
                PaymentSelection paymentSelection = (PaymentSelection) obj;
                w70.i2 i2Var6 = this.f60218b.o;
                if (!Intrinsics.b(paymentSelection, i2Var6.getValue())) {
                    i2Var6.j(paymentSelection);
                }
                break;
            case 6:
                ou.h0 h0Var = (ou.h0) obj;
                w70.i2 i2Var7 = this.f60218b.f60317p;
                do {
                    value6 = i2Var7.getValue();
                } while (!i2Var7.i(value6, h4.a((h4) value6, null, h0Var, false, false, false, false, 61)));
            default:
                if (((Boolean) obj).booleanValue()) {
                    i0 i0Var = this.f60218b;
                    i0Var.f60315l.invoke(i0Var.o.getValue(), Boolean.FALSE);
                }
                break;
        }
        return Unit.f71706a;
    }
}
