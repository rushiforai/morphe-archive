package pq;

import b70.h;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$ButtonThemes;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import com.stripe.android.paymentsheet.PaymentSheet$CardFundingType;
import com.stripe.android.paymentsheet.PaymentSheet$LinkConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$WalletButtonsConfiguration;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import ou.m0;
import ou.n0;
import ou.o0;
import ou.u0;
import ou.v0;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final PaymentSheet$Appearance f82796a = new PaymentSheet$Appearance();

    /* renamed from: b, reason: collision with root package name */
    public static final PaymentSheet$BillingDetails f82797b = new PaymentSheet$BillingDetails(null, 15);

    /* renamed from: c, reason: collision with root package name */
    public static final PaymentSheet$BillingDetailsCollectionConfiguration f82798c;

    /* renamed from: d, reason: collision with root package name */
    public static final PaymentSheet$LinkConfiguration f82799d;

    /* renamed from: e, reason: collision with root package name */
    public static final EmptyList f82800e;

    /* renamed from: f, reason: collision with root package name */
    public static final EmptyList f82801f;

    /* renamed from: g, reason: collision with root package name */
    public static final EmptyList f82802g;

    /* renamed from: h, reason: collision with root package name */
    public static final v0 f82803h;

    /* renamed from: i, reason: collision with root package name */
    public static final PaymentSheet$CardBrandAcceptance.All f82804i;

    /* renamed from: j, reason: collision with root package name */
    public static final i70.a f82805j;

    /* renamed from: k, reason: collision with root package name */
    public static final EmptyList f82806k;

    /* renamed from: l, reason: collision with root package name */
    public static final PaymentSheet$WalletButtonsConfiguration f82807l;

    static {
        n0 n0Var = n0.f80938a;
        m0 m0Var = m0.f80931a;
        EmptySet emptySet = EmptySet.f71734a;
        f82798c = new PaymentSheet$BillingDetailsCollectionConfiguration(n0Var, n0Var, n0Var, m0Var, false, emptySet);
        f82799d = new PaymentSheet$LinkConfiguration(u0.f80984a, true, true, true, emptySet);
        EmptyList emptyList = EmptyList.f71733a;
        f82800e = emptyList;
        f82801f = emptyList;
        f82802g = emptyList;
        f82803h = v0.f80993c;
        f82804i = PaymentSheet$CardBrandAcceptance.All.f44521a;
        f82805j = PaymentSheet$CardFundingType.f44530b;
        f82806k = emptyList;
        h hVar = h.f17594a;
        f82807l = new PaymentSheet$WalletButtonsConfiguration(false, new PaymentSheet$WalletButtonsConfiguration.Visibility(hVar, hVar), new PaymentSheet$ButtonThemes(o0.f80947b));
    }
}
