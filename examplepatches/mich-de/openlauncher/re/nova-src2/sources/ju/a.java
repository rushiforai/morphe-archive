package ju;

import ab.e0;
import android.content.Context;
import com.stripe.android.model.StripeIntent;
import e00.q4;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.LazyKt;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.SetBuilder;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements g {

    /* renamed from: a, reason: collision with root package name */
    public final c f69926a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f69927b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f69928c;

    /* renamed from: d, reason: collision with root package name */
    public final a70.d f69929d;

    /* renamed from: e, reason: collision with root package name */
    public j.c f69930e;

    /* renamed from: f, reason: collision with root package name */
    public j.c f69931f;

    public a(c noOpIntentNextActionHandler, Map paymentNextActionHandlers, boolean z11, Context applicationContext) {
        Intrinsics.g(noOpIntentNextActionHandler, "noOpIntentNextActionHandler");
        Intrinsics.g(paymentNextActionHandlers, "paymentNextActionHandlers");
        Intrinsics.g(applicationContext, "applicationContext");
        this.f69926a = noOpIntentNextActionHandler;
        this.f69927b = paymentNextActionHandlers;
        this.f69928c = z11;
        this.f69929d = LazyKt.a(new q4(22, this, applicationContext));
    }

    public final SetBuilder a() {
        SetBuilder setBuilder = new SetBuilder();
        setBuilder.add(this.f69926a);
        setBuilder.addAll(this.f69927b.values());
        setBuilder.addAll(((Map) this.f69929d.getValue()).values());
        return e0.l(setBuilder);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v7, types: [ju.e] */
    public final e b(Object obj) {
        ?? r52;
        if (!(obj instanceof StripeIntent)) {
            throw new IllegalStateException(("No suitable PaymentNextActionHandler for " + obj).toString());
        }
        StripeIntent stripeIntent = (StripeIntent) obj;
        boolean zD = stripeIntent.D();
        c cVar = this.f69926a;
        if (!zD) {
            Intrinsics.e(cVar, "null cannot be cast to non-null type com.stripe.android.payments.core.authentication.PaymentNextActionHandler<Actionable of com.stripe.android.payments.core.authentication.DefaultPaymentNextActionHandlerRegistry.getNextActionHandler>");
            return cVar;
        }
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(this.f69927b, (Map) this.f69929d.getValue());
        StripeIntent.NextActionData f43553w = stripeIntent.getF43553w();
        if (f43553w != null && (r52 = (e) linkedHashMapM0.get(f43553w.getClass())) != 0) {
            cVar = r52;
        }
        Intrinsics.e(cVar, "null cannot be cast to non-null type com.stripe.android.payments.core.authentication.PaymentNextActionHandler<Actionable of com.stripe.android.payments.core.authentication.DefaultPaymentNextActionHandlerRegistry.getNextActionHandler>");
        return cVar;
    }
}
