package ks;

import ab.e0;
import android.os.LocaleList;
import com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext;
import com.stripe.android.paymentsheet.addresselement.f0;
import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import ps.i0;
import t70.y0;

/* loaded from: classes4.dex */
public final class e implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72198a;

    @Override // w60.a
    public final Object get() {
        switch (this.f72198a) {
            case 0:
                return null;
            case 1:
                a80.e eVar = y0.f88884a;
                a80.d dVar = a80.d.f488c;
                i0.i(dVar);
                return dVar;
            case 2:
                return Boolean.TRUE;
            case 3:
                return new f0(AutocompleteAppearanceContext.Link.f44708a);
            case 4:
                ir.a aVar = ir.a.f67993b;
                i0.i(aVar);
                return aVar;
            case 5:
                return EventReporter$Mode.f44778c;
            case 6:
                w4.g gVar = w4.g.f93750b;
                w4.g gVarF = w4.g.f(LocaleList.getAdjustedDefault());
                if (gVarF.d()) {
                    gVarF = null;
                }
                if (gVarF != null) {
                    return gVarF.b(0);
                }
                return null;
            case 7:
                return e0.U("PaymentSheet");
            default:
                return Boolean.FALSE;
        }
    }
}
