package jt;

import com.stripe.android.networking.PaymentAnalyticsEvent;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69773a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ z0 f69774b;

    public /* synthetic */ d(z0 z0Var, int i5) {
        this.f69773a = i5;
        this.f69774b = z0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f69773a) {
            case 0:
                this.f69774b.w(PaymentAnalyticsEvent.n);
                break;
            case 1:
                z0 z0Var = this.f69774b;
                z0Var.f69921h.a(a.c(z0Var.f69923j, PaymentAnalyticsEvent.o, null, null, null, null, 62));
                break;
            case 2:
                z0 z0Var2 = this.f69774b;
                z0Var2.f69921h.a(a.c(z0Var2.f69923j, PaymentAnalyticsEvent.f44083k, null, null, null, null, 62));
                break;
            case 3:
                z0 z0Var3 = this.f69774b;
                z0Var3.f69921h.a(a.c(z0Var3.f69923j, PaymentAnalyticsEvent.N, null, null, null, null, 62));
                break;
            case 4:
                this.f69774b.w(PaymentAnalyticsEvent.f44082j);
                break;
            case 5:
                z0 z0Var4 = this.f69774b;
                z0Var4.f69921h.a(a.c(z0Var4.f69923j, PaymentAnalyticsEvent.f44085m, null, null, null, null, 62));
                break;
            case 6:
                z0 z0Var5 = this.f69774b;
                z0Var5.f69921h.a(a.c(z0Var5.f69923j, PaymentAnalyticsEvent.E, null, null, null, null, 62));
                break;
            default:
                z0 z0Var6 = this.f69774b;
                z0Var6.f69921h.a(a.c(z0Var6.f69923j, PaymentAnalyticsEvent.f44081i, null, null, null, null, 62));
                break;
        }
        return Unit.f71706a;
    }
}
