package hq;

import android.content.Context;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import fr.b0;
import java.util.Set;
import jt.b1;
import jt.c1;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final Set f59984a;

    /* renamed from: b, reason: collision with root package name */
    public final jt.b f59985b;

    /* renamed from: c, reason: collision with root package name */
    public final fr.l f59986c;

    /* renamed from: d, reason: collision with root package name */
    public final Context f59987d;

    /* renamed from: e, reason: collision with root package name */
    public final a70.d f59988e;

    public m(Context context, Set productUsageTokens, jt.b requestSurface, fr.l analyticsRequestExecutor) {
        Intrinsics.g(context, "context");
        Intrinsics.g(productUsageTokens, "productUsageTokens");
        Intrinsics.g(requestSurface, "requestSurface");
        Intrinsics.g(analyticsRequestExecutor, "analyticsRequestExecutor");
        this.f59984a = productUsageTokens;
        this.f59985b = requestSurface;
        this.f59986c = analyticsRequestExecutor;
        this.f59987d = context.getApplicationContext();
        this.f59988e = LazyKt.a(new b0(this, 9));
    }

    public final void a(PaymentAnalyticsEvent paymentAnalyticsEvent, String str) {
        Context appContext = this.f59987d;
        Intrinsics.f(appContext, "appContext");
        this.f59986c.a(jt.a.c(new jt.a(appContext, str, this.f59984a), paymentAnalyticsEvent, null, null, null, null, 62));
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public m(Context context, Set productUsageTokens) {
        this(context, productUsageTokens, b1.f69764b, new fr.l());
        Intrinsics.g(context, "context");
        Intrinsics.g(productUsageTokens, "productUsageTokens");
        c1.f69772a.getClass();
    }
}
