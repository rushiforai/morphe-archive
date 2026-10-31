package com.stripe.android.paymentsheet;

import android.app.Application;
import com.stripe.android.paymentsheet.PaymentOptionContract;
import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import h6.f1;
import h6.j1;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final ou.y f44795a;

    public i(ou.y yVar) {
        this.f44795a = yVar;
    }

    @Override // h6.j1
    public final f1 create(Class cls, k6.c extras) {
        Intrinsics.g(extras, "extras");
        Application applicationT = jk.b.T(extras);
        h6.u0 u0VarA = h6.y0.a(extras);
        PaymentOptionContract.Args args = (PaymentOptionContract.Args) this.f44795a.invoke();
        vu.m mVar = new vu.m(new b50.d(), new vu.r(), new br.c(), new br.a(0), applicationT, u0VarA, args);
        return new k(args, (fs.g0) mVar.f93195d.get(), new br.a(11), (com.stripe.android.link.b0) mVar.f93211v.get(), (ru.d) mVar.f93215z.get(), (fv.k) mVar.A.get(), (CoroutineContext) mVar.n.get(), u0VarA, (ou.q) mVar.B.get(), new hq.m(applicationT, args.f44434f, jt.b.f69756b, new fr.l((xq.c) mVar.f93206q.get(), (CoroutineContext) mVar.n.get())), au.d.a(new br.c(), bs.b.a(new br.c(), new b50.d(), mVar.a(), applicationT, (CoroutineContext) mVar.n.get()), new b50.d(), mVar.a(), new uq.a(mVar.a(), mVar.D, mVar.E)), (EventReporter$Mode) mVar.f93212w.get());
    }
}
