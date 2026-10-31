package cv;

import h6.f1;
import h6.g1;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import w70.i2;
import w70.n1;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class v extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final i2 f48039a;

    /* renamed from: b, reason: collision with root package name */
    public final t1 f48040b;

    /* renamed from: c, reason: collision with root package name */
    public final n1 f48041c;

    public v(a aVar) {
        ft.b bVar = aVar.f47996b;
        new cw.n1((bh.k) null, ps.v.y(bVar), 5);
        this.f48039a = u1.c(new w(aVar.f47995a, aVar.f47997c, new x(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, bVar), true));
        t1 t1VarB = u1.b(0, 0, null, 7);
        this.f48040b = t1VarB;
        this.f48041c = new n1(t1VarB);
    }

    public final void e(u action) {
        Object value;
        w wVar;
        x xVar;
        Intrinsics.g(action, "action");
        boolean z11 = action instanceof s;
        i2 i2Var = this.f48039a;
        if (z11) {
            m0.t(g1.f(this), null, null, new com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.g(this, ((w) i2Var.getValue()).f48044c.f48046a, null), 3);
            return;
        }
        if (action instanceof r) {
            m0.t(g1.f(this), null, null, new com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.f(this, null), 3);
            return;
        }
        if (!(action instanceof t)) {
            throw new NoWhenBranchMatchedException();
        }
        String cvc = ((t) action).f48038a;
        do {
            value = i2Var.getValue();
            wVar = (w) value;
            xVar = wVar.f48044c;
            Intrinsics.g(cvc, "cvc");
            int length = cvc.length();
            ft.b bVar = xVar.f48047b;
            if (length <= bVar.a()) {
                xVar = new x(cvc, bVar);
            }
        } while (!i2Var.i(value, w.a(wVar, xVar, false, 11)));
    }
}
