package com.stripe.android.lpmfoundations.paymentmethod;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import b.u4;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ElementsSession;
import com.stripe.android.model.PassiveCaptchaParams;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$LinkConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.stripe.android.paymentsheet.model.PaymentMethodIncentive;
import com.stripe.android.paymentsheet.state.LinkDisabledState;
import com.stripe.android.paymentsheet.state.LinkState;
import com.stripe.android.paymentsheet.state.LinkStateResult;
import com.stripe.android.ui.core.Amount;
import com.stripe.android.ui.core.cbc.CardBrandChoiceEligibility;
import com.stripe.android.ui.core.elements.ExternalPaymentMethodSpec;
import dt.i0;
import dt.w;
import ft.d0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import ou.w0;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodMetadata;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class PaymentMethodMetadata implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentMethodMetadata> CREATOR = new ct.l();
    public final boolean A;
    public final PassiveCaptchaParams B;
    public final boolean C;
    public final ClientAttributionMetadata D;
    public final boolean E;
    public final PaymentSheet$Appearance F;
    public final String G;
    public final IntegrationMetadata H;
    public final AnalyticsMetadata I;
    public final ElementsSession.ExperimentsData J;
    public final boolean K;
    public final LinkState L;

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent f43092a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$BillingDetailsCollectionConfiguration f43093b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f43094c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f43095d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f43096e;

    /* renamed from: f, reason: collision with root package name */
    public final List f43097f;

    /* renamed from: g, reason: collision with root package name */
    public final List f43098g;

    /* renamed from: h, reason: collision with root package name */
    public final CardBrandChoiceEligibility f43099h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43100i;

    /* renamed from: j, reason: collision with root package name */
    public final String f43101j;

    /* renamed from: k, reason: collision with root package name */
    public final PaymentSheet$BillingDetails f43102k;

    /* renamed from: l, reason: collision with root package name */
    public final AddressDetails f43103l;

    /* renamed from: m, reason: collision with root package name */
    public final ArrayList f43104m;
    public final List n;
    public final List o;

    /* renamed from: p, reason: collision with root package name */
    public final CustomerMetadata f43105p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f43106q;

    /* renamed from: r, reason: collision with root package name */
    public final PaymentSheet$LinkConfiguration f43107r;

    /* renamed from: s, reason: collision with root package name */
    public final PaymentMethodSaveConsentBehavior f43108s;

    /* renamed from: t, reason: collision with root package name */
    public final d0 f43109t;

    /* renamed from: u, reason: collision with root package name */
    public final LinkStateResult f43110u;

    /* renamed from: v, reason: collision with root package name */
    public final PaymentMethodIncentive f43111v;

    /* renamed from: w, reason: collision with root package name */
    public final mu.b f43112w;

    /* renamed from: x, reason: collision with root package name */
    public final CardBrandFilter f43113x;

    /* renamed from: y, reason: collision with root package name */
    public final CardFundingFilter f43114y;

    /* renamed from: z, reason: collision with root package name */
    public final Map f43115z;

    public PaymentMethodMetadata(StripeIntent stripeIntent, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration, boolean z11, boolean z12, boolean z13, List availableWallets, List paymentMethodOrder, CardBrandChoiceEligibility cbcEligibility, String merchantName, String str, PaymentSheet$BillingDetails paymentSheet$BillingDetails, AddressDetails addressDetails, ArrayList arrayList, List displayableCustomPaymentMethods, List externalPaymentMethodSpecs, CustomerMetadata customerMetadata, boolean z14, PaymentSheet$LinkConfiguration linkConfiguration, PaymentMethodSaveConsentBehavior paymentMethodSaveConsentBehavior, d0 d0Var, LinkStateResult linkStateResult, PaymentMethodIncentive paymentMethodIncentive, mu.b bVar, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter, Map termsDisplay, boolean z15, PassiveCaptchaParams passiveCaptchaParams, boolean z16, ClientAttributionMetadata clientAttributionMetadata, boolean z17, PaymentSheet$Appearance appearance, String str2, IntegrationMetadata integrationMetadata, AnalyticsMetadata analyticsMetadata, ElementsSession.ExperimentsData experimentsData, boolean z18) {
        LinkState linkState;
        Intrinsics.g(stripeIntent, "stripeIntent");
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        Intrinsics.g(availableWallets, "availableWallets");
        Intrinsics.g(paymentMethodOrder, "paymentMethodOrder");
        Intrinsics.g(cbcEligibility, "cbcEligibility");
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(displayableCustomPaymentMethods, "displayableCustomPaymentMethods");
        Intrinsics.g(externalPaymentMethodSpecs, "externalPaymentMethodSpecs");
        Intrinsics.g(linkConfiguration, "linkConfiguration");
        Intrinsics.g(paymentMethodSaveConsentBehavior, "paymentMethodSaveConsentBehavior");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        Intrinsics.g(termsDisplay, "termsDisplay");
        Intrinsics.g(clientAttributionMetadata, "clientAttributionMetadata");
        Intrinsics.g(appearance, "appearance");
        Intrinsics.g(integrationMetadata, "integrationMetadata");
        Intrinsics.g(analyticsMetadata, "analyticsMetadata");
        this.f43092a = stripeIntent;
        this.f43093b = billingDetailsCollectionConfiguration;
        this.f43094c = z11;
        this.f43095d = z12;
        this.f43096e = z13;
        this.f43097f = availableWallets;
        this.f43098g = paymentMethodOrder;
        this.f43099h = cbcEligibility;
        this.f43100i = merchantName;
        this.f43101j = str;
        this.f43102k = paymentSheet$BillingDetails;
        this.f43103l = addressDetails;
        this.f43104m = arrayList;
        this.n = displayableCustomPaymentMethods;
        this.o = externalPaymentMethodSpecs;
        this.f43105p = customerMetadata;
        this.f43106q = z14;
        this.f43107r = linkConfiguration;
        this.f43108s = paymentMethodSaveConsentBehavior;
        this.f43109t = d0Var;
        this.f43110u = linkStateResult;
        this.f43111v = paymentMethodIncentive;
        this.f43112w = bVar;
        this.f43113x = cardBrandFilter;
        this.f43114y = cardFundingFilter;
        this.f43115z = termsDisplay;
        this.A = z15;
        this.B = passiveCaptchaParams;
        this.C = z16;
        this.D = clientAttributionMetadata;
        this.E = z17;
        this.F = appearance;
        this.G = str2;
        this.H = integrationMetadata;
        this.I = analyticsMetadata;
        this.J = experimentsData;
        this.K = z18;
        if (linkStateResult instanceof LinkState) {
            linkState = (LinkState) linkStateResult;
        } else {
            if (!(linkStateResult instanceof LinkDisabledState) && linkStateResult != null) {
                throw new NoWhenBranchMatchedException();
            }
            linkState = null;
        }
        this.L = linkState;
    }

    public final boolean C(PaymentMethod.Type type) {
        return this.f43115z.get(type) != w0.f80998b;
    }

    public final ArrayList S() {
        List listF0 = f0();
        ArrayList arrayList = new ArrayList();
        Iterator it = listF0.iterator();
        while (it.hasNext()) {
            bt.g gVarB0 = b0((String) it.next());
            if (gVarB0 != null) {
                arrayList.add(gVarB0);
            }
        }
        return arrayList;
    }

    public final ArrayList a0() {
        StripeIntent stripeIntent = this.f43092a;
        List f43772j = stripeIntent.getF43534b();
        ArrayList arrayList = new ArrayList();
        Iterator it = f43772j.iterator();
        while (it.hasNext()) {
            ct.j jVar = (ct.j) ((Map) ct.n.f47864b.getValue()).get((String) it.next());
            if (jVar != null) {
                arrayList.add(jVar);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            if (ct.k.a((ct.j) next, this)) {
                arrayList2.add(next);
            }
        }
        List listP = ul.b.P(i0.f49453a);
        ArrayList arrayList3 = new ArrayList();
        for (Object obj : listP) {
            if (ct.k.a((i0) obj, this)) {
                arrayList3.add(obj);
            }
        }
        ArrayList arrayListT1 = b70.g.t1(arrayList3, arrayList2);
        ArrayList arrayList4 = new ArrayList();
        Iterator it3 = arrayListT1.iterator();
        while (it3.hasNext()) {
            Object next2 = it3.next();
            ct.j jVar2 = (ct.j) next2;
            if (!stripeIntent.getF43545m() || !stripeIntent.getF43551u().contains(jVar2.getType().f43655a)) {
                arrayList4.add(next2);
            }
        }
        ArrayList arrayList5 = new ArrayList();
        Iterator it4 = arrayList4.iterator();
        while (it4.hasNext()) {
            Object next3 = it4.next();
            ct.j jVar3 = (ct.j) next3;
            if (jVar3.b().f(jVar3, this.f43104m)) {
                arrayList5.add(next3);
            }
        }
        return arrayList5;
    }

    public final Amount b() {
        StripeIntent stripeIntent = this.f43092a;
        if (!(stripeIntent instanceof PaymentIntent)) {
            return null;
        }
        Long l9 = ((PaymentIntent) stripeIntent).f43535c;
        if (l9 == null) {
            throw new IllegalArgumentException("Required value was null.");
        }
        long jLongValue = l9.longValue();
        String str = ((PaymentIntent) stripeIntent).f43543k;
        if (str != null) {
            return new Amount(jLongValue, str);
        }
        throw new IllegalArgumentException("Required value was null.");
    }

    public final bt.g b0(String code) {
        Object next;
        Intrinsics.g(code, "code");
        if (s(code)) {
            w wVarL = l(code);
            if (wVarL != null) {
                return wVarL.l(this);
            }
        } else if (p(code)) {
            w wVarI = i(code);
            if (wVarI != null) {
                return wVarI.l(this);
            }
        } else {
            Iterator it = a0().iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (Intrinsics.b(((ct.j) next).getType().f43655a, code)) {
                    break;
                }
            }
            ct.j jVar = (ct.j) next;
            if (jVar != null) {
                return jVar.b().h(this, jVar, this.f43104m);
            }
        }
        return null;
    }

    public final ArrayList d() {
        List list = this.n;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((DisplayableCustomPaymentMethod) it.next()).f43080a);
        }
        return arrayList;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final ArrayList e() {
        List list = this.o;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((ExternalPaymentMethodSpec) it.next()).f45311a);
        }
        return arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentMethodMetadata)) {
            return false;
        }
        PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) obj;
        return Intrinsics.b(this.f43092a, paymentMethodMetadata.f43092a) && Intrinsics.b(this.f43093b, paymentMethodMetadata.f43093b) && this.f43094c == paymentMethodMetadata.f43094c && this.f43095d == paymentMethodMetadata.f43095d && this.f43096e == paymentMethodMetadata.f43096e && Intrinsics.b(this.f43097f, paymentMethodMetadata.f43097f) && Intrinsics.b(this.f43098g, paymentMethodMetadata.f43098g) && Intrinsics.b(this.f43099h, paymentMethodMetadata.f43099h) && Intrinsics.b(this.f43100i, paymentMethodMetadata.f43100i) && Intrinsics.b(this.f43101j, paymentMethodMetadata.f43101j) && Intrinsics.b(this.f43102k, paymentMethodMetadata.f43102k) && Intrinsics.b(this.f43103l, paymentMethodMetadata.f43103l) && this.f43104m.equals(paymentMethodMetadata.f43104m) && Intrinsics.b(this.n, paymentMethodMetadata.n) && Intrinsics.b(this.o, paymentMethodMetadata.o) && Intrinsics.b(this.f43105p, paymentMethodMetadata.f43105p) && this.f43106q == paymentMethodMetadata.f43106q && Intrinsics.b(this.f43107r, paymentMethodMetadata.f43107r) && Intrinsics.b(this.f43108s, paymentMethodMetadata.f43108s) && this.f43109t == paymentMethodMetadata.f43109t && Intrinsics.b(this.f43110u, paymentMethodMetadata.f43110u) && Intrinsics.b(this.f43111v, paymentMethodMetadata.f43111v) && this.f43112w == paymentMethodMetadata.f43112w && Intrinsics.b(this.f43113x, paymentMethodMetadata.f43113x) && Intrinsics.b(this.f43114y, paymentMethodMetadata.f43114y) && Intrinsics.b(this.f43115z, paymentMethodMetadata.f43115z) && this.A == paymentMethodMetadata.A && Intrinsics.b(this.B, paymentMethodMetadata.B) && this.C == paymentMethodMetadata.C && Intrinsics.b(this.D, paymentMethodMetadata.D) && this.E == paymentMethodMetadata.E && Intrinsics.b(this.F, paymentMethodMetadata.F) && Intrinsics.b(this.G, paymentMethodMetadata.G) && Intrinsics.b(this.H, paymentMethodMetadata.H) && Intrinsics.b(this.I, paymentMethodMetadata.I) && Intrinsics.b(this.J, paymentMethodMetadata.J) && this.K == paymentMethodMetadata.K;
    }

    public final at.a f(String code, boolean z11) {
        Object next;
        Intrinsics.g(code, "code");
        if (s(code)) {
            w wVarL = l(code);
            if (wVarL != null) {
                return wVarL.l(this).a(null);
            }
        } else if (p(code)) {
            w wVarI = i(code);
            if (wVarI != null) {
                return wVarI.l(this).a(null);
            }
        } else {
            Iterator it = a0().iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (Intrinsics.b(((ct.j) next).getType().f43655a, code)) {
                    break;
                }
            }
            ct.j jVar = (ct.j) next;
            if (jVar != null) {
                return jVar.b().a(jVar, this, this.f43104m, z11);
            }
        }
        return null;
    }

    public final List f0() {
        ArrayList arrayListA0 = a0();
        ArrayList arrayList = new ArrayList(b70.c.u0(arrayListA0, 10));
        Iterator it = arrayListA0.iterator();
        while (it.hasNext()) {
            arrayList.add(((ct.j) it.next()).getType().f43655a);
        }
        ArrayList arrayListT1 = b70.g.t1(d(), b70.g.t1(e(), arrayList));
        List<String> list = this.f43098g;
        if (list.isEmpty()) {
            return arrayListT1;
        }
        ArrayList arrayListK1 = b70.g.K1(b70.g.t1(d(), b70.g.t1(e(), this.f43092a.getF43534b())));
        ArrayList arrayList2 = new ArrayList();
        for (String str : list) {
            if (arrayListK1.contains(str)) {
                arrayList2.add(str);
                arrayListK1.remove(str);
            }
        }
        arrayList2.addAll(arrayListK1);
        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList2, 10));
        Iterator it2 = arrayList2.iterator();
        int i5 = 0;
        while (it2.hasNext()) {
            Object next = it2.next();
            int i11 = i5 + 1;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            arrayList3.add(new Pair((String) next, Integer.valueOf(i5)));
            i5 = i11;
        }
        return b70.g.D1(new ct.m(MapsKt.r0(arrayList3), 0), arrayListT1);
    }

    public final int hashCode() {
        int iE = c0.e((this.f43099h.hashCode() + u4.c(u4.c(c9.f(c9.f(c9.f((this.f43093b.hashCode() + (this.f43092a.hashCode() * 31)) * 31, 31, this.f43094c), 31, this.f43095d), 31, this.f43096e), 31, this.f43097f), 31, this.f43098g)) * 31, 31, this.f43100i);
        String str = this.f43101j;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f43102k;
        int iHashCode2 = (iHashCode + (paymentSheet$BillingDetails == null ? 0 : paymentSheet$BillingDetails.hashCode())) * 31;
        AddressDetails addressDetails = this.f43103l;
        int iC = u4.c(u4.c((this.f43104m.hashCode() + ((iHashCode2 + (addressDetails == null ? 0 : addressDetails.hashCode())) * 31)) * 31, 31, this.n), 31, this.o);
        CustomerMetadata customerMetadata = this.f43105p;
        int iHashCode3 = (this.f43108s.hashCode() + ((this.f43107r.hashCode() + c9.f((iC + (customerMetadata == null ? 0 : customerMetadata.hashCode())) * 31, 31, this.f43106q)) * 31)) * 31;
        d0 d0Var = this.f43109t;
        int iHashCode4 = (iHashCode3 + (d0Var == null ? 0 : d0Var.hashCode())) * 31;
        LinkStateResult linkStateResult = this.f43110u;
        int iHashCode5 = (iHashCode4 + (linkStateResult == null ? 0 : linkStateResult.hashCode())) * 31;
        PaymentMethodIncentive paymentMethodIncentive = this.f43111v;
        int iHashCode6 = (iHashCode5 + (paymentMethodIncentive == null ? 0 : paymentMethodIncentive.hashCode())) * 31;
        mu.b bVar = this.f43112w;
        int iF = c9.f(x8.h.c(this.f43115z, (this.f43114y.hashCode() + ((this.f43113x.hashCode() + ((iHashCode6 + (bVar == null ? 0 : bVar.hashCode())) * 31)) * 31)) * 31, 31), 31, this.A);
        PassiveCaptchaParams passiveCaptchaParams = this.B;
        int iHashCode7 = (this.F.hashCode() + c9.f((this.D.hashCode() + c9.f((iF + (passiveCaptchaParams == null ? 0 : passiveCaptchaParams.hashCode())) * 31, 31, this.C)) * 31, 31, this.E)) * 31;
        String str2 = this.G;
        int iHashCode8 = (this.I.f43066a.hashCode() + ((this.H.hashCode() + ((iHashCode7 + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31)) * 31;
        ElementsSession.ExperimentsData experimentsData = this.J;
        return Boolean.hashCode(this.K) + ((iHashCode8 + (experimentsData != null ? experimentsData.hashCode() : 0)) * 31);
    }

    public final w i(String str) {
        Object next;
        Iterator it = this.n.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((DisplayableCustomPaymentMethod) next).f43080a, str)) {
                break;
            }
        }
        DisplayableCustomPaymentMethod displayableCustomPaymentMethod = (DisplayableCustomPaymentMethod) next;
        if (displayableCustomPaymentMethod == null) {
            return null;
        }
        return new w(displayableCustomPaymentMethod, 0);
    }

    public final w l(String str) {
        Object next;
        Iterator it = this.o.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((ExternalPaymentMethodSpec) next).f45311a, str)) {
                break;
            }
        }
        ExternalPaymentMethodSpec externalPaymentMethodSpec = (ExternalPaymentMethodSpec) next;
        if (externalPaymentMethodSpec == null) {
            return null;
        }
        return new w(externalPaymentMethodSpec, 1);
    }

    public final boolean m(String code) {
        Intrinsics.g(code, "code");
        StripeIntent stripeIntent = this.f43092a;
        if (stripeIntent instanceof PaymentIntent) {
            return ((PaymentIntent) stripeIntent).a(code);
        }
        if (stripeIntent instanceof SetupIntent) {
            return true;
        }
        throw new NoWhenBranchMatchedException();
    }

    public final boolean p(String code) {
        Intrinsics.g(code, "code");
        return d().contains(code);
    }

    public final ArrayList p0() {
        ArrayList arrayListA0 = a0();
        ArrayList arrayList = new ArrayList();
        Iterator it = arrayListA0.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            if (((ct.j) next).d()) {
                arrayList.add(next);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((ct.j) it2.next()).getType());
        }
        return this.f43096e ? b70.g.t1(ul.b.P(PaymentMethod.Type.f43638h), arrayList2) : arrayList2;
    }

    public final boolean s(String code) {
        Intrinsics.g(code, "code");
        return e().contains(code);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PaymentMethodMetadata(stripeIntent=");
        sb2.append(this.f43092a);
        sb2.append(", billingDetailsCollectionConfiguration=");
        sb2.append(this.f43093b);
        sb2.append(", allowsDelayedPaymentMethods=");
        a80.m.s(sb2, this.f43094c, ", allowsPaymentMethodsRequiringShippingAddress=", this.f43095d, ", allowsLinkInSavedPaymentMethods=");
        sb2.append(this.f43096e);
        sb2.append(", availableWallets=");
        sb2.append(this.f43097f);
        sb2.append(", paymentMethodOrder=");
        sb2.append(this.f43098g);
        sb2.append(", cbcEligibility=");
        sb2.append(this.f43099h);
        sb2.append(", merchantName=");
        c0.D(sb2, this.f43100i, ", sellerBusinessName=", this.f43101j, ", defaultBillingDetails=");
        sb2.append(this.f43102k);
        sb2.append(", shippingDetails=");
        sb2.append(this.f43103l);
        sb2.append(", sharedDataSpecs=");
        sb2.append(this.f43104m);
        sb2.append(", displayableCustomPaymentMethods=");
        sb2.append(this.n);
        sb2.append(", externalPaymentMethodSpecs=");
        sb2.append(this.o);
        sb2.append(", customerMetadata=");
        sb2.append(this.f43105p);
        sb2.append(", isGooglePayReady=");
        sb2.append(this.f43106q);
        sb2.append(", linkConfiguration=");
        sb2.append(this.f43107r);
        sb2.append(", paymentMethodSaveConsentBehavior=");
        sb2.append(this.f43108s);
        sb2.append(", linkMode=");
        sb2.append(this.f43109t);
        sb2.append(", linkStateResult=");
        sb2.append(this.f43110u);
        sb2.append(", paymentMethodIncentive=");
        sb2.append(this.f43111v);
        sb2.append(", financialConnectionsAvailability=");
        sb2.append(this.f43112w);
        sb2.append(", cardBrandFilter=");
        sb2.append(this.f43113x);
        sb2.append(", cardFundingFilter=");
        sb2.append(this.f43114y);
        sb2.append(", termsDisplay=");
        sb2.append(this.f43115z);
        sb2.append(", forceSetupFutureUseBehaviorAndNewMandate=");
        sb2.append(this.A);
        sb2.append(", passiveCaptchaParams=");
        sb2.append(this.B);
        sb2.append(", openCardScanAutomatically=");
        sb2.append(this.C);
        sb2.append(", clientAttributionMetadata=");
        sb2.append(this.D);
        sb2.append(", attestOnIntentConfirmation=");
        sb2.append(this.E);
        sb2.append(", appearance=");
        sb2.append(this.F);
        sb2.append(", onBehalfOf=");
        sb2.append(this.G);
        sb2.append(", integrationMetadata=");
        sb2.append(this.H);
        sb2.append(", analyticsMetadata=");
        sb2.append(this.I);
        sb2.append(", experimentsData=");
        sb2.append(this.J);
        sb2.append(", isTapToAddSupported=");
        return a80.m.k(sb2, this.K, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f43092a, i5);
        dest.writeParcelable(this.f43093b, i5);
        dest.writeInt(this.f43094c ? 1 : 0);
        dest.writeInt(this.f43095d ? 1 : 0);
        dest.writeInt(this.f43096e ? 1 : 0);
        Iterator itK = fq.c.k(this.f43097f, dest);
        while (itK.hasNext()) {
            dest.writeString(((ct.w) itK.next()).name());
        }
        dest.writeStringList(this.f43098g);
        dest.writeParcelable(this.f43099h, i5);
        dest.writeString(this.f43100i);
        dest.writeString(this.f43101j);
        dest.writeParcelable(this.f43102k, i5);
        dest.writeParcelable(this.f43103l, i5);
        Iterator itJ = fq.c.j(this.f43104m, dest);
        while (itJ.hasNext()) {
            dest.writeParcelable((Parcelable) itJ.next(), i5);
        }
        Iterator itK2 = fq.c.k(this.n, dest);
        while (itK2.hasNext()) {
            dest.writeParcelable((Parcelable) itK2.next(), i5);
        }
        Iterator itK3 = fq.c.k(this.o, dest);
        while (itK3.hasNext()) {
            dest.writeParcelable((Parcelable) itK3.next(), i5);
        }
        dest.writeParcelable(this.f43105p, i5);
        dest.writeInt(this.f43106q ? 1 : 0);
        dest.writeParcelable(this.f43107r, i5);
        dest.writeParcelable(this.f43108s, i5);
        d0 d0Var = this.f43109t;
        if (d0Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(d0Var.name());
        }
        dest.writeParcelable(this.f43110u, i5);
        dest.writeParcelable(this.f43111v, i5);
        mu.b bVar = this.f43112w;
        if (bVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(bVar.name());
        }
        dest.writeParcelable(this.f43113x, i5);
        dest.writeParcelable(this.f43114y, i5);
        Map map = this.f43115z;
        dest.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            dest.writeParcelable((Parcelable) entry.getKey(), i5);
            dest.writeString(((w0) entry.getValue()).name());
        }
        dest.writeInt(this.A ? 1 : 0);
        dest.writeParcelable(this.B, i5);
        dest.writeInt(this.C ? 1 : 0);
        dest.writeParcelable(this.D, i5);
        dest.writeInt(this.E ? 1 : 0);
        dest.writeParcelable(this.F, i5);
        dest.writeString(this.G);
        dest.writeParcelable(this.H, i5);
        dest.writeParcelable(this.I, i5);
        dest.writeParcelable(this.J, i5);
        dest.writeInt(this.K ? 1 : 0);
    }
}
