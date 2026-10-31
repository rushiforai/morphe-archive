package com.stripe.android.payments.core.authentication.threeds2;

import android.app.Application;
import bu.o;
import com.stripe.android.model.Stripe3ds2Fingerprint;
import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionContract;
import com.stripe.android.stripe3ds2.init.ui.StripeUiCustomization;
import com.stripe.android.stripe3ds2.observability.Stripe3ds2ErrorReporterConfig;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import fr.b0;
import fr.l;
import fr.u;
import h6.f1;
import h6.j1;
import h6.u0;
import h6.y0;
import is.k;
import java.util.ArrayList;
import java.util.Set;
import jt.z0;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import ku.i;
import t5.d0;

/* loaded from: classes4.dex */
public final class h implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final i f44347a;

    public h(i iVar) {
        this.f44347a = iVar;
    }

    @Override // h6.j1
    public final f1 create(Class cls, k6.c extras) throws ClassNotFoundException {
        Intrinsics.g(extras, "extras");
        Stripe3ds2TransactionContract.Args args = (Stripe3ds2TransactionContract.Args) this.f44347a.invoke();
        Application applicationT = jk.b.T(extras);
        u0 u0VarA = y0.a(extras);
        boolean z11 = args.f44316f;
        b0 b0Var = new b0(args, 22);
        Set set = args.f44319i;
        boolean zD = t2.c.D(applicationT);
        set.getClass();
        b50.d dVar = new b50.d();
        br.c cVar = new br.c();
        br.a aVar = new br.a(0);
        Boolean boolValueOf = Boolean.valueOf(z11);
        s40.h hVarB = s40.c.b(new av.a(cVar, 1));
        s40.e eVarA = s40.e.a(boolValueOf);
        s40.h hVarB2 = s40.c.b(new br.b(aVar, eVarA, 0));
        s40.e eVarA2 = s40.e.a(applicationT);
        s40.h hVarB3 = s40.c.b(new k(eVarA2, eVarA, hVarB, 2));
        s40.h hVarB4 = s40.c.b(lu.b.f75098b);
        s40.e eVarA3 = s40.e.a(b0Var);
        av.a aVar2 = new av.a(dVar, 5);
        s40.e eVarA4 = s40.e.a(set);
        bs.b bVar = new bs.b(eVarA2, eVarA3, eVarA4, 4);
        bs.e eVar = new bs.e(hVarB2, hVarB, 4);
        s40.h hVarB5 = s40.c.b(new as.f(new o(eVarA2, eVarA3, aVar2, hVarB, eVarA4, bVar, eVar, hVarB2, 1), eVar, bVar, s40.c.b(u.f55704a), hVarB2, hVarB, 7));
        z0 z0Var = new z0(applicationT, b0Var, jt.b.f69756b, (CoroutineContext) hVarB.get(), set, new jt.a(applicationT, b0Var, set), new l((xq.c) hVarB2.get(), (CoroutineContext) hVarB.get()), (xq.c) hVarB2.get());
        l lVar = new l((xq.c) hVarB2.get(), (CoroutineContext) hVarB.get());
        jt.a aVar3 = new jt.a(applicationT, b0Var, set);
        vv.a aVar4 = (vv.a) hVarB3.get();
        wv.l lVar2 = (wv.l) hVarB4.get();
        ku.d dVar2 = (ku.d) hVarB5.get();
        CoroutineContext workContext = (CoroutineContext) hVarB.get();
        Intrinsics.g(workContext, "workContext");
        boolean f43545m = args.f44313c.getF43545m();
        SdkTransactionId sdkTransactionId = args.f44311a;
        StripeUiCustomization uiCustomization = args.f44312b.f42437b.f42438a;
        ArrayList arrayList = new Stripe3ds2Fingerprint(args.f44314d).f43927d.f43930c;
        Intrinsics.g(sdkTransactionId, "sdkTransactionId");
        Intrinsics.g(uiCustomization, "uiCustomization");
        wv.k kVar = z11 ? wv.k.f94732c : wv.k.f94731b;
        tv.c cVar2 = new tv.c(applicationT, new Stripe3ds2ErrorReporterConfig(sdkTransactionId), workContext, kVar, 240);
        return new g(applicationT, args, z0Var, lVar, aVar3, aVar4, lVar2, dVar2, new com.stripe.android.stripe3ds2.transaction.u(sdkTransactionId, new wv.l(), new wv.f(f43545m, arrayList, cVar2), new uv.c(f43545m), new d0(cVar2, 21), new nx.l(cVar2, workContext, false), new d0(workContext, 22), uiCustomization, cVar2, kVar), (CoroutineContext) hVarB.get(), u0VarA, zD);
    }
}
