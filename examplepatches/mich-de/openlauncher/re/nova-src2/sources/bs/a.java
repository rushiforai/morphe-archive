package bs;

import android.content.Context;
import as.j;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.GooglePayJsonFactory$BillingAddressParameters;
import iu.f;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final Context f18433a;

    /* renamed from: b, reason: collision with root package name */
    public final xq.c f18434b;

    /* renamed from: c, reason: collision with root package name */
    public final f f18435c;

    public a(Context appContext, xq.c logger, f errorReporter) {
        Intrinsics.g(appContext, "appContext");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(errorReporter, "errorReporter");
        this.f18433a = appContext;
        this.f18434b = logger;
        this.f18435c = errorReporter;
    }

    public final as.e a(j environment, CardFundingFilter cardFundingFilter, CardBrandFilter cardBrandFilter) {
        Intrinsics.g(environment, "environment");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        return new as.e(this.f18433a, environment, new GooglePayJsonFactory$BillingAddressParameters(false, dq.e.f49308b, false), true, true, this.f18435c, this.f18434b, cardBrandFilter, cardFundingFilter);
    }
}
