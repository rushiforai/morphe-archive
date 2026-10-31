package hv;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i0 {

    /* renamed from: a, reason: collision with root package name */
    public final w70.g2 f60304a;

    /* renamed from: b, reason: collision with root package name */
    public final w70.g2 f60305b;

    /* renamed from: c, reason: collision with root package name */
    public final w70.g2 f60306c;

    /* renamed from: d, reason: collision with root package name */
    public final w70.g2 f60307d;

    /* renamed from: e, reason: collision with root package name */
    public final bu.q f60308e;

    /* renamed from: f, reason: collision with root package name */
    public final w70.g2 f60309f;

    /* renamed from: g, reason: collision with root package name */
    public final uw.c f60310g;

    /* renamed from: h, reason: collision with root package name */
    public final w70.g2 f60311h;

    /* renamed from: i, reason: collision with root package name */
    public final w70.g2 f60312i;

    /* renamed from: j, reason: collision with root package name */
    public final e00.q4 f60313j;

    /* renamed from: k, reason: collision with root package name */
    public final bu.m f60314k;

    /* renamed from: l, reason: collision with root package name */
    public final a0 f60315l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f60316m;
    public final y70.d n;
    public final w70.i2 o;

    /* renamed from: p, reason: collision with root package name */
    public final w70.i2 f60317p;

    /* renamed from: q, reason: collision with root package name */
    public final w70.i2 f60318q;

    public i0(uw.c paymentOptionsItems, w70.i2 editing, uw.c canEdit, uw.c canRemove, bu.q qVar, w70.o1 isProcessing, uw.c cVar, w70.o1 currentSelection, w70.o1 mostRecentlySelectedSavedPaymentMethod, e00.q4 q4Var, bu.m mVar, a0 a0Var, boolean z11) {
        Intrinsics.g(paymentOptionsItems, "paymentOptionsItems");
        Intrinsics.g(editing, "editing");
        Intrinsics.g(canEdit, "canEdit");
        Intrinsics.g(canRemove, "canRemove");
        Intrinsics.g(isProcessing, "isProcessing");
        Intrinsics.g(currentSelection, "currentSelection");
        Intrinsics.g(mostRecentlySelectedSavedPaymentMethod, "mostRecentlySelectedSavedPaymentMethod");
        this.f60304a = paymentOptionsItems;
        this.f60305b = editing;
        this.f60306c = canEdit;
        this.f60307d = canRemove;
        this.f60308e = qVar;
        this.f60309f = isProcessing;
        this.f60310g = cVar;
        this.f60311h = currentSelection;
        this.f60312i = mostRecentlySelectedSavedPaymentMethod;
        this.f60313j = q4Var;
        this.f60314k = mVar;
        this.f60315l = a0Var;
        this.f60316m = z11;
        y70.d dVarA = t70.k0.a(t70.y0.f88885b.plus(t70.m0.d()));
        this.n = dVarA;
        PaymentSelection paymentSelection = (PaymentSelection) currentSelection.f93973a.getValue();
        Continuation continuation = null;
        if (!(paymentSelection instanceof PaymentSelection.Link) && !(paymentSelection instanceof PaymentSelection.GooglePay) && !(paymentSelection instanceof PaymentSelection.Saved)) {
            paymentSelection = null;
        }
        w70.i2 i2VarC = w70.u1.c(paymentSelection);
        this.o = i2VarC;
        List list = (List) paymentOptionsItems.f91586b.invoke();
        w70.i2 i2VarC2 = w70.u1.c(new h4(list, a((PaymentSelection) i2VarC.getValue(), (PaymentMethod) mostRecentlySelectedSavedPaymentMethod.f93973a.getValue(), list), ((Boolean) editing.getValue()).booleanValue(), ((Boolean) isProcessing.f93973a.getValue()).booleanValue(), ((Boolean) canEdit.f91586b.invoke()).booleanValue(), ((Boolean) canRemove.f91586b.invoke()).booleanValue()));
        this.f60317p = i2VarC2;
        this.f60318q = i2VarC2;
        t70.m0.t(dVarA, null, null, new f0(this, continuation, 0), 3);
        t70.m0.t(dVarA, null, null, new f0(this, continuation, 1), 3);
        t70.m0.t(dVarA, null, null, new f0(this, continuation, 2), 3);
        t70.m0.t(dVarA, null, null, new f0(this, continuation, 3), 3);
        t70.m0.t(dVarA, null, null, new f0(this, continuation, 4), 3);
        t70.m0.t(dVarA, null, null, new h0(this, null), 3);
        t70.m0.t(dVarA, null, null, new f0(this, continuation, 5), 3);
        t70.m0.t(dVarA, null, null, new f0(this, continuation, 6), 3);
    }

    public static ou.h0 a(PaymentSelection paymentSelection, PaymentMethod paymentMethod, List list) {
        if (!(paymentSelection instanceof PaymentSelection.Saved) && !(paymentSelection instanceof PaymentSelection.Link) && !(paymentSelection instanceof PaymentSelection.GooglePay) && !(paymentSelection instanceof PaymentSelection.ShopPay)) {
            if (!(paymentSelection instanceof PaymentSelection.New) && !(paymentSelection instanceof PaymentSelection.ExternalPaymentMethod) && !(paymentSelection instanceof PaymentSelection.CustomPaymentMethod) && paymentSelection != null) {
                throw new NoWhenBranchMatchedException();
            }
            paymentSelection = null;
            if (paymentMethod != null) {
                paymentSelection = new PaymentSelection.Saved(paymentMethod, null, null);
            }
        }
        return ou.i0.b(list, paymentSelection);
    }

    public final void b(p10.c0 c0Var) {
        if (c0Var instanceof j4) {
            this.f60314k.invoke(((j4) c0Var).f60358d);
            return;
        }
        if (c0Var instanceof k4) {
            PaymentSelection paymentSelection = ((k4) c0Var).f60371d;
            this.o.j(paymentSelection);
            this.f60315l.invoke(paymentSelection, Boolean.TRUE);
        } else if (c0Var.equals(i4.f60333d)) {
            this.f60313j.invoke();
        } else {
            if (!c0Var.equals(l4.f60393d)) {
                throw new NoWhenBranchMatchedException();
            }
            this.f60308e.invoke();
        }
    }
}
