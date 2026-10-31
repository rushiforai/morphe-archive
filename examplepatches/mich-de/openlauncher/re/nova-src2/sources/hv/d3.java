package hv;

import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d3 implements e3 {

    /* renamed from: a, reason: collision with root package name */
    public static final d3 f60214a = new d3();

    public d0 a(y70.d coroutineScope, u uVar, y0 y0Var, PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration, Function1 function1, Function1 function12) {
        Intrinsics.g(coroutineScope, "coroutineScope");
        return new d0(y0Var, paymentSheet$BillingDetailsCollectionConfiguration, uVar, true, coroutineScope, function1, function12);
    }
}
