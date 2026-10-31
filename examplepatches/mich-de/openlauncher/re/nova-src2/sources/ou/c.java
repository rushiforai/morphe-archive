package ou;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.state.CustomerState;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final h6.u0 f80803a;

    /* renamed from: b, reason: collision with root package name */
    public final w70.o1 f80804b;

    /* renamed from: c, reason: collision with root package name */
    public final uw.c f80805c;

    /* renamed from: d, reason: collision with root package name */
    public final w70.o1 f80806d;

    /* renamed from: e, reason: collision with root package name */
    public final uw.c f80807e;

    /* renamed from: f, reason: collision with root package name */
    public final uw.c f80808f;

    /* renamed from: g, reason: collision with root package name */
    public final uw.c f80809g;

    public c(uw.c cVar, h6.u0 savedStateHandle, w70.g2 selection) {
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        Intrinsics.g(selection, "selection");
        this.f80803a = savedStateHandle;
        w70.o1 o1VarB = savedStateHandle.b(null, "customer_info");
        this.f80804b = o1VarB;
        uw.c cVarU = ps.v.u(o1VarB, new nq.a(7));
        this.f80805c = cVarU;
        Object value = selection.getValue();
        PaymentSelection.Saved saved = value instanceof PaymentSelection.Saved ? (PaymentSelection.Saved) value : null;
        this.f80806d = savedStateHandle.b(saved != null ? saved.f44846a : null, "saved_selection");
        byte b11 = 0;
        this.f80807e = ps.v.j(o1VarB, cVar, new j00.k0(22, b11));
        this.f80808f = ps.v.j(cVarU, cVar, new j00.k0(23, b11));
        this.f80809g = ps.v.u(cVar, new nq.a(8));
    }

    public final void a(CustomerState customerState) {
        h6.u0 u0Var = this.f80803a;
        u0Var.d("customer_info", customerState);
        PaymentMethod paymentMethod = (PaymentMethod) this.f80806d.f93973a.getValue();
        Object obj = null;
        if (customerState != null) {
            Iterator it = customerState.f44956a.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Object next = it.next();
                if (Intrinsics.b(((PaymentMethod) next).f43569a, paymentMethod != null ? paymentMethod.f43569a : null)) {
                    obj = next;
                    break;
                }
            }
            obj = (PaymentMethod) obj;
        }
        u0Var.d("saved_selection", obj);
    }
}
