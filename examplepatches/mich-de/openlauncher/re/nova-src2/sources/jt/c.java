package jt;

import com.stripe.android.networking.PaymentAnalyticsEvent;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69765a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ z0 f69766b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Set f69767c;

    public /* synthetic */ c(z0 z0Var, Set set, int i5) {
        this.f69765a = i5;
        this.f69766b = z0Var;
        this.f69767c = set;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f69765a) {
            case 0:
                z0 z0Var = this.f69766b;
                z0Var.f69921h.a(a.c(z0Var.f69923j, PaymentAnalyticsEvent.f44078f, this.f69767c, null, null, null, 60));
                break;
            case 1:
                z0 z0Var2 = this.f69766b;
                a aVar = z0Var2.f69923j;
                aVar.getClass();
                Set productUsageTokens = this.f69767c;
                Intrinsics.g(productUsageTokens, "productUsageTokens");
                z0Var2.f69921h.a(a.c(aVar, PaymentAnalyticsEvent.f44079g, productUsageTokens, null, null, null, 60));
                break;
            case 2:
                z0 z0Var3 = this.f69766b;
                a aVar2 = z0Var3.f69923j;
                aVar2.getClass();
                Set productUsageTokens2 = this.f69767c;
                Intrinsics.g(productUsageTokens2, "productUsageTokens");
                z0Var3.f69921h.a(a.c(aVar2, PaymentAnalyticsEvent.f44079g, productUsageTokens2, null, null, null, 60));
                break;
            default:
                z0 z0Var4 = this.f69766b;
                z0Var4.f69921h.a(a.c(z0Var4.f69923j, PaymentAnalyticsEvent.f44077e, this.f69767c, null, null, null, 60));
                break;
        }
        return Unit.f71706a;
    }
}
