package com.stripe.android.paymentsheet.paymentdatacollection.polling;

import android.app.ActivityOptions;
import android.app.Application;
import android.content.Context;
import b.c0;
import b70.h;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentsheet.paymentdatacollection.polling.PollingContract;
import dv.k;
import fr.l;
import ju.e;
import kotlin.Unit;
import kotlin.collections.EmptySet;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import ps.i0;
import t70.y0;

/* loaded from: classes4.dex */
public final class d extends e {

    /* renamed from: a, reason: collision with root package name */
    public j.c f44952a;

    @Override // ju.e
    public final void a() {
        j.c cVar = this.f44952a;
        if (cVar != null) {
            cVar.b();
        }
        this.f44952a = null;
    }

    @Override // ju.e
    public final void b(j.b bVar, j.a aVar) {
        this.f44952a = bVar.registerForActivityResult(new PollingContract(), aVar);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // ju.e
    public final Object d(ww.a aVar, Object obj, ApiRequest$Options apiRequest$Options, ju.d dVar) {
        PollingContract.Args args;
        PaymentMethod.Type type;
        StripeIntent stripeIntent = (StripeIntent) obj;
        PaymentMethod n = stripeIntent.getN();
        str = null;
        String str = null;
        PaymentMethod.Type type2 = n != null ? n.f43573e : null;
        int i5 = type2 == null ? -1 : k.f49611a[type2.ordinal()];
        if (i5 == 1) {
            String f43539g = stripeIntent.getF43539g();
            if (f43539g == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            args = new PollingContract.Args(f43539g, aVar.f94747b, 300, 5, 2132020035, apiRequest$Options.f42577b, null);
        } else if (i5 == 2) {
            String f43539g2 = stripeIntent.getF43539g();
            if (f43539g2 == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            args = new PollingContract.Args(f43539g2, aVar.f94747b, 60, 5, 2132019732, apiRequest$Options.f42577b, null);
        } else if (i5 == 3) {
            String f43539g3 = stripeIntent.getF43539g();
            if (f43539g3 == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            Integer num = aVar.f94747b;
            String str2 = apiRequest$Options.f42577b;
            StripeIntent.NextActionData f43553w = stripeIntent.getF43553w();
            Intrinsics.e(f43553w, "null cannot be cast to non-null type com.stripe.android.model.StripeIntent.NextActionData.DisplayPayNowDetails");
            String str3 = ((StripeIntent.NextActionData.DisplayPayNowDetails) f43553w).f43944a;
            if (str3 == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            args = new PollingContract.Args(f43539g3, num, 3600, 5, 2132019998, str2, str3);
        } else {
            if (i5 != 4) {
                PaymentMethod n9 = stripeIntent.getN();
                if (n9 != null && (type = n9.f43573e) != null) {
                    str = type.f43655a;
                }
                throw new IllegalStateException(c0.l("Received invalid payment method type ", str, " in PollingAuthenticator").toString());
            }
            String f43539g4 = stripeIntent.getF43539g();
            if (f43539g4 == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            Integer num2 = aVar.f94747b;
            String str4 = apiRequest$Options.f42577b;
            StripeIntent.NextActionData f43553w2 = stripeIntent.getF43553w();
            Intrinsics.e(f43553w2, "null cannot be cast to non-null type com.stripe.android.model.StripeIntent.NextActionData.DisplayPromptPayDetails");
            String str5 = ((StripeIntent.NextActionData.DisplayPromptPayDetails) f43553w2).f43945a;
            if (str5 == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            args = new PollingContract.Args(f43539g4, num2, 3600, 5, 2132019998, str4, str5);
        }
        Application application = aVar.f94746a.getApplication();
        Intrinsics.f(application, "getApplication(...)");
        n4.c cVar = new n4.c(ActivityOptions.makeCustomAnimation(application.getApplicationContext(), 2130772049, 2130772050));
        j.c cVar2 = this.f44952a;
        if (cVar2 == null) {
            Application application2 = aVar.f94746a.getApplication();
            Intrinsics.f(application2, "getApplication(...)");
            EmptySet productUsage = EmptySet.f71734a;
            Intrinsics.g(productUsage, "productUsage");
            Context applicationContext = application2.getApplicationContext();
            Intrinsics.f(applicationContext, "getApplicationContext(...)");
            a80.e eVar = y0.f88884a;
            a80.d dVar2 = a80.d.f488c;
            i0.i(dVar2);
            l lVar = new l(xq.d.f96224b, dVar2);
            jt.a aVar2 = new jt.a(applicationContext, new ar.c(applicationContext, 27), productUsage);
            iu.e eVar2 = iu.e.f68089d;
            boolean z11 = 6 & 4;
            h hVar = h.f17594a;
            h additionalNonPiiParams = z11 != 0 ? hVar : null;
            Intrinsics.g(additionalNonPiiParams, "additionalNonPiiParams");
            lVar.a(aVar2.a(eVar2, MapsKt.m0(hVar, additionalNonPiiParams)));
        } else {
            cVar2.a(args, cVar);
        }
        return Unit.f71706a;
    }
}
