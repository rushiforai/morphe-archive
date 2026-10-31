package ov;

import ab.e0;
import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.i;
import ps.i0;
import rw.e;
import s40.d;

/* loaded from: classes4.dex */
public final class b implements d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81029a;

    @Override // w60.a
    public final Object get() {
        switch (this.f81029a) {
            case 0:
                return Boolean.FALSE;
            case 1:
                return new rt.a(new su.b(), i.f44934a);
            case 2:
                return new e();
            case 3:
                return Boolean.FALSE;
            case 4:
                return e0.U("PaymentElement.Autocomplete");
            case 5:
                ir.a aVar = ir.a.f67993b;
                i0.i(aVar);
                return aVar;
            case 6:
                return Boolean.FALSE;
            case 7:
                return Boolean.FALSE;
            case 8:
                return new su.b();
            case 9:
                return EventReporter$Mode.f44777b;
            default:
                return e0.U("PaymentSheet");
        }
    }
}
