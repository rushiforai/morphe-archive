package bv;

import com.amplitude.core.events.Identify;
import com.stripe.android.core.strings.IdentifierResolvableString;
import h6.f1;
import h6.g1;
import java.io.IOException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import w70.n1;
import w70.o1;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class n extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final t1 f18639a;

    /* renamed from: b, reason: collision with root package name */
    public final n1 f18640b;

    /* renamed from: c, reason: collision with root package name */
    public final o1 f18641c;

    public n(m mVar) throws IOException {
        t1 t1VarB = u1.b(0, 0, null, 7);
        this.f18639a = t1VarB;
        this.f18640b = new n1(t1VarB);
        String str = mVar.f18635a;
        String str2 = mVar.f18636b;
        String strF1 = b70.g.f1(r70.l.A1(2, mVar.f18637c), Identify.UNSET_VALUE, null, null, 0, null, 62);
        String str3 = mVar.f18638d;
        IdentifierResolvableString identifierResolvableStringG = zg.a.G(2132019881);
        Object[] objArr = {zg.a.G(2132019885), zg.a.G(2132019886), zg.a.G(2132019887), zg.a.G(2132019887)};
        EmptyList emptyList = EmptyList.f71733a;
        this.f18641c = new o1(u1.c(new o(str, str2, strF1, str3, identifierResolvableStringG, zg.a.U(2132019884, objArr, emptyList), zg.a.U(2132019877, new Object[]{zg.a.G(2132019878), zg.a.G(2132019876)}, emptyList))));
    }

    public final void e(l action) {
        Intrinsics.g(action, "action");
        if (action instanceof j) {
            m0.t(g1.f(this), null, null, new com.stripe.android.paymentsheet.paymentdatacollection.bacs.h(this, null), 3);
        } else if (action instanceof k) {
            m0.t(g1.f(this), null, null, new com.stripe.android.paymentsheet.paymentdatacollection.bacs.i(this, null), 3);
        } else {
            if (!(action instanceof i)) {
                throw new NoWhenBranchMatchedException();
            }
            m0.t(g1.f(this), null, null, new com.stripe.android.paymentsheet.paymentdatacollection.bacs.g(this, null), 3);
        }
    }
}
