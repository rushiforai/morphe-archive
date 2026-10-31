package ct;

import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.ui.core.cbc.CardBrandChoiceEligibility;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final hq.m f47878a;

    /* renamed from: b, reason: collision with root package name */
    public final es.n f47879b;

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashMap f47880c;

    /* renamed from: d, reason: collision with root package name */
    public final UserInput f47881d;

    /* renamed from: e, reason: collision with root package name */
    public final Map f47882e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f47883f;

    /* renamed from: g, reason: collision with root package name */
    public final String f47884g;

    /* renamed from: h, reason: collision with root package name */
    public final CardBrandChoiceEligibility f47885h;

    /* renamed from: i, reason: collision with root package name */
    public final PaymentSheet$BillingDetailsCollectionConfiguration f47886i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f47887j;

    /* renamed from: k, reason: collision with root package name */
    public final Function1 f47888k;

    /* renamed from: l, reason: collision with root package name */
    public final CardBrandFilter f47889l;

    /* renamed from: m, reason: collision with root package name */
    public final CardFundingFilter f47890m;
    public final boolean n;
    public final kw.p o;

    /* renamed from: p, reason: collision with root package name */
    public final ou.r f47891p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f47892q;

    /* renamed from: r, reason: collision with root package name */
    public final Boolean f47893r;

    /* renamed from: s, reason: collision with root package name */
    public final cw.q f47894s;

    public p(hq.m cardAccountRangeRepositoryFactory, es.n nVar, LinkedHashMap linkedHashMap, UserInput userInput, Map map, boolean z11, String merchantName, CardBrandChoiceEligibility cbcEligibility, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration, boolean z12, Function1 onLinkInlineSignupStateChanged, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter, boolean z13, kw.p pVar, ou.r rVar, boolean z14, Boolean bool, cw.q qVar) {
        Intrinsics.g(cardAccountRangeRepositoryFactory, "cardAccountRangeRepositoryFactory");
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(cbcEligibility, "cbcEligibility");
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        Intrinsics.g(onLinkInlineSignupStateChanged, "onLinkInlineSignupStateChanged");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        this.f47878a = cardAccountRangeRepositoryFactory;
        this.f47879b = nVar;
        this.f47880c = linkedHashMap;
        this.f47881d = userInput;
        this.f47882e = map;
        this.f47883f = z11;
        this.f47884g = merchantName;
        this.f47885h = cbcEligibility;
        this.f47886i = billingDetailsCollectionConfiguration;
        this.f47887j = z12;
        this.f47888k = onLinkInlineSignupStateChanged;
        this.f47889l = cardBrandFilter;
        this.f47890m = cardFundingFilter;
        this.n = z13;
        this.o = pVar;
        this.f47891p = rVar;
        this.f47892q = z14;
        this.f47893r = bool;
        this.f47894s = qVar;
    }
}
