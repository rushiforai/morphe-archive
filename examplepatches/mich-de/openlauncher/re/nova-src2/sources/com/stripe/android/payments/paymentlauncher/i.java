package com.stripe.android.payments.paymentlauncher;

import android.app.Application;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.ConfirmSetupIntentParams;
import com.stripe.android.model.ConfirmStripeIntentParams;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.payments.paymentlauncher.PaymentLauncherContract;
import cu.z;
import h6.f1;
import h6.j1;
import h6.u0;
import h6.y0;
import java.util.Set;
import jt.z0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final nu.b f44392a;

    public i(nu.b bVar) {
        this.f44392a = bVar;
    }

    @Override // h6.j1
    public final f1 create(Class cls, k6.c extras) {
        boolean z11;
        Intrinsics.g(extras, "extras");
        final PaymentLauncherContract.Args args = (PaymentLauncherContract.Args) this.f44392a.invoke();
        Application applicationT = jk.b.T(extras);
        u0 u0VarA = y0.a(extras);
        boolean f44384c = args.getF44384c();
        final int i5 = 0;
        Function0 function0 = new Function0() { // from class: nu.d
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i5) {
                    case 0:
                        return args.getF44382a();
                    default:
                        return args.getF44383b();
                }
            }
        };
        final int i11 = 1;
        Function0 function02 = new Function0() { // from class: nu.d
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return args.getF44382a();
                    default:
                        return args.getF44383b();
                }
            }
        };
        Set f44385d = args.getF44385d();
        boolean f44386e = args.getF44386e();
        f44385d.getClass();
        b6.e eVar = new b6.e(14);
        b50.d dVar = new b50.d();
        br.c cVar = new br.c();
        br.a aVar = new br.a(0);
        Boolean boolValueOf = Boolean.valueOf(f44384c);
        Boolean boolValueOf2 = Boolean.valueOf(f44386e);
        s40.h hVarB = s40.c.b(new av.a(cVar, 1));
        s40.e eVarA = s40.e.a(boolValueOf);
        s40.h hVarB2 = s40.c.b(new br.b(aVar, eVarA, 0));
        s40.e eVarA2 = s40.e.a(applicationT);
        s40.h hVarB3 = s40.c.b(new au.c(cVar, 8));
        s40.e eVarA3 = s40.e.a(function0);
        s40.e eVarA4 = s40.e.a(f44385d);
        bs.b bVar = new bs.b(eVarA2, eVarA3, eVarA4, 4);
        s40.h hVarB4 = s40.c.b(new z(eVar, eVarA2, eVarA, hVarB, hVarB3, bVar, eVarA3, eVarA4, new au.e(eVar, eVarA2, 20), s40.e.a(boolValueOf2)));
        s40.h hVarB5 = s40.c.b(new au.e(eVar, eVarA2, 19));
        s40.e eVarA5 = s40.e.a(function02);
        bu.o oVar = new bu.o(eVarA2, eVarA3, new av.a(dVar, 5), hVarB, eVarA4, bVar, new bs.e(hVarB2, hVarB, 4), hVarB2, 1);
        s40.h hVarB6 = s40.c.b(new dq.j(eVarA2, eVarA3, oVar, hVarB2, hVarB));
        s40.h hVarB7 = s40.c.b(new dq.j(eVarA2, eVarA3, oVar, hVarB2, hVarB, 2));
        s40.h hVarB8 = s40.c.b(new au.c(eVar, 21));
        boolean z12 = false;
        if (args instanceof PaymentLauncherContract.Args.IntentConfirmationArgs) {
            ConfirmStripeIntentParams confirmStripeIntentParams = ((PaymentLauncherContract.Args.IntentConfirmationArgs) args).f44366f;
            if (!(confirmStripeIntentParams instanceof ConfirmPaymentIntentParams)) {
                if (!(confirmStripeIntentParams instanceof ConfirmSetupIntentParams)) {
                    throw new NoWhenBranchMatchedException();
                }
                z11 = z12;
            }
            z11 = true;
        } else {
            if (!(args instanceof PaymentLauncherContract.Args.HashedPaymentIntentNextActionArgs) && !(args instanceof PaymentLauncherContract.Args.PaymentIntentNextActionArgs)) {
                if (!(args instanceof PaymentLauncherContract.Args.SetupIntentNextActionArgs)) {
                    if (!(args instanceof PaymentLauncherContract.Args.StripeIntentNextActionWithIntentArgs)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    z12 = ((PaymentLauncherContract.Args.StripeIntentNextActionWithIntentArgs) args).f44387f instanceof PaymentIntent;
                }
                z11 = z12;
            }
            z11 = true;
        }
        return new n(z11, new z0(applicationT, function0, jt.b.f69756b, (CoroutineContext) hVarB.get(), f44385d, new jt.a(applicationT, function0, f44385d), new fr.l((xq.c) hVarB2.get(), (CoroutineContext) hVarB.get()), (xq.c) hVarB2.get()), (ju.g) hVarB4.get(), (du.a) hVarB5.get(), new bs.e(eVarA3, eVarA5, 3), s40.c.a(hVarB6), s40.c.a(hVarB7), new fr.l((xq.c) hVarB2.get(), (CoroutineContext) hVarB.get()), new jt.a(applicationT, function0, f44385d), (CoroutineContext) hVarB3.get(), u0VarA, t2.c.D(applicationT), (ir.c) hVarB8.get());
    }
}
