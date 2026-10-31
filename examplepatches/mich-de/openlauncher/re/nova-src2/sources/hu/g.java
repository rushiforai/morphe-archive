package hu;

import android.app.Application;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract;
import h6.f1;
import h6.j1;
import h6.u0;
import h6.y0;
import kotlin.jvm.internal.Intrinsics;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class g implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final a f60073a;

    public g(a aVar) {
        this.f60073a = aVar;
    }

    @Override // h6.j1
    public final f1 create(Class cls, k6.c extras) {
        Intrinsics.g(extras, "extras");
        Application applicationT = jk.b.T(extras);
        u0 u0VarA = y0.a(extras);
        t1 t1VarB = u1.b(0, 0, null, 7);
        CollectBankAccountContract.Args args = (CollectBankAccountContract.Args) this.f60073a.invoke();
        fu.b bVar = new fu.b(new br.c(), new b50.d(), new br.a(0), applicationT, t1VarB, u0VarA, args);
        return new m(args, t1VarB, new gu.h(bVar.a()), new gu.c(bVar.a()), new gu.j(bVar.a(), 0), u0VarA, (xq.c) bVar.f56083d.get());
    }
}
