package nr;

import com.stripe.android.networking.PaymentAnalyticsEvent;
import jr.i;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements fw.a {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f78525a;

    public a(Function1 viewActionHandler) {
        Intrinsics.g(viewActionHandler, "viewActionHandler");
        this.f78525a = viewActionHandler;
    }

    @Override // fw.a
    public final void a() {
        PaymentAnalyticsEvent paymentAnalyticsEvent = PaymentAnalyticsEvent.f44074b;
        this.f78525a.invoke(new i());
    }
}
