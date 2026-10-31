package ys;

import b.c9;
import b.u4;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.core.model.CountryCode;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t0 {
    public final boolean A;

    /* renamed from: a, reason: collision with root package name */
    public final List f97557a;

    /* renamed from: b, reason: collision with root package name */
    public final String f97558b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f97559c;

    /* renamed from: d, reason: collision with root package name */
    public final CardBrandFilter f97560d;

    /* renamed from: e, reason: collision with root package name */
    public final CardFundingFilter f97561e;

    /* renamed from: f, reason: collision with root package name */
    public final String f97562f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f97563g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f97564h;

    /* renamed from: i, reason: collision with root package name */
    public final String f97565i;

    /* renamed from: j, reason: collision with root package name */
    public final String f97566j;

    /* renamed from: k, reason: collision with root package name */
    public final ResolvableString f97567k;

    /* renamed from: l, reason: collision with root package name */
    public final ResolvableString f97568l;

    /* renamed from: m, reason: collision with root package name */
    public final List f97569m;
    public final boolean n;
    public final Boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final String f97570p;

    /* renamed from: q, reason: collision with root package name */
    public final ResolvableString f97571q;

    /* renamed from: r, reason: collision with root package name */
    public final pw.a f97572r;

    /* renamed from: s, reason: collision with root package name */
    public final pw.a f97573s;

    /* renamed from: t, reason: collision with root package name */
    public final c f97574t;

    /* renamed from: u, reason: collision with root package name */
    public final ResolvableString f97575u;

    /* renamed from: v, reason: collision with root package name */
    public final ResolvableString f97576v;

    /* renamed from: w, reason: collision with root package name */
    public final boolean f97577w;

    /* renamed from: x, reason: collision with root package name */
    public final boolean f97578x;

    /* renamed from: y, reason: collision with root package name */
    public final boolean f97579y;

    /* renamed from: z, reason: collision with root package name */
    public final PaymentSheet$BillingDetailsCollectionConfiguration f97580z;

    public t0(List paymentDetailsList, String email, boolean z11, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter, String str, boolean z12, boolean z13, String merchantName, String str2, ResolvableString resolvableString, ResolvableString resolvableString2, List addPaymentMethodOptions, boolean z14, Boolean bool, String str3, ResolvableString resolvableString3, pw.a aVar, pw.a aVar2, c addBankAccountState, ResolvableString resolvableString4, ResolvableString resolvableString5, boolean z15, boolean z16, boolean z17, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration, boolean z18) {
        Intrinsics.g(paymentDetailsList, "paymentDetailsList");
        Intrinsics.g(email, "email");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(addPaymentMethodOptions, "addPaymentMethodOptions");
        Intrinsics.g(addBankAccountState, "addBankAccountState");
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        this.f97557a = paymentDetailsList;
        this.f97558b = email;
        this.f97559c = z11;
        this.f97560d = cardBrandFilter;
        this.f97561e = cardFundingFilter;
        this.f97562f = str;
        this.f97563g = z12;
        this.f97564h = z13;
        this.f97565i = merchantName;
        this.f97566j = str2;
        this.f97567k = resolvableString;
        this.f97568l = resolvableString2;
        this.f97569m = addPaymentMethodOptions;
        this.n = z14;
        this.o = bool;
        this.f97570p = str3;
        this.f97571q = resolvableString3;
        this.f97572r = aVar;
        this.f97573s = aVar2;
        this.f97574t = addBankAccountState;
        this.f97575u = resolvableString4;
        this.f97576v = resolvableString5;
        this.f97577w = z15;
        this.f97578x = z16;
        this.f97579y = z17;
        this.f97580z = billingDetailsCollectionConfiguration;
        this.A = z18;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v9, types: [java.util.List] */
    public static t0 a(t0 t0Var, ArrayList arrayList, String str, boolean z11, Boolean bool, String str2, ResolvableString resolvableString, pw.a aVar, pw.a aVar2, c cVar, ResolvableString resolvableString2, int i5) {
        boolean z12;
        pw.a cvcInput;
        boolean z13;
        c addBankAccountState;
        ArrayList paymentDetailsList = (i5 & 1) != 0 ? t0Var.f97557a : arrayList;
        String email = t0Var.f97558b;
        boolean z14 = t0Var.f97559c;
        CardBrandFilter cardBrandFilter = t0Var.f97560d;
        CardFundingFilter cardFundingFilter = t0Var.f97561e;
        String str3 = (i5 & 32) != 0 ? t0Var.f97562f : str;
        boolean z15 = (i5 & 64) != 0 ? t0Var.f97563g : z11;
        boolean z16 = t0Var.f97564h;
        String merchantName = t0Var.f97565i;
        String str4 = t0Var.f97566j;
        ResolvableString resolvableString3 = t0Var.f97567k;
        ResolvableString resolvableString4 = t0Var.f97568l;
        t0Var.getClass();
        List addPaymentMethodOptions = t0Var.f97569m;
        boolean z17 = t0Var.n;
        Boolean bool2 = (i5 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? t0Var.o : bool;
        String str5 = (i5 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? t0Var.f97570p : str2;
        ResolvableString resolvableString5 = (i5 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? t0Var.f97571q : resolvableString;
        pw.a expiryDateInput = (i5 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? t0Var.f97572r : aVar;
        if ((i5 & 524288) != 0) {
            z12 = z17;
            cvcInput = t0Var.f97573s;
        } else {
            z12 = z17;
            cvcInput = aVar2;
        }
        if ((i5 & 1048576) != 0) {
            z13 = z14;
            addBankAccountState = t0Var.f97574t;
        } else {
            z13 = z14;
            addBankAccountState = cVar;
        }
        String str6 = str3;
        ResolvableString resolvableString6 = (i5 & 2097152) != 0 ? t0Var.f97575u : resolvableString2;
        ResolvableString resolvableString7 = t0Var.f97576v;
        boolean z18 = (i5 & 8388608) != 0 ? t0Var.f97577w : false;
        boolean z19 = (i5 & 16777216) != 0 ? t0Var.f97578x : true;
        boolean z21 = t0Var.f97579y;
        PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration = t0Var.f97580z;
        boolean z22 = z15;
        boolean z23 = (i5 & 134217728) != 0 ? t0Var.A : true;
        t0Var.getClass();
        Intrinsics.g(paymentDetailsList, "paymentDetailsList");
        Intrinsics.g(email, "email");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(addPaymentMethodOptions, "addPaymentMethodOptions");
        Intrinsics.g(expiryDateInput, "expiryDateInput");
        Intrinsics.g(cvcInput, "cvcInput");
        Intrinsics.g(addBankAccountState, "addBankAccountState");
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        return new t0(paymentDetailsList, email, z13, cardBrandFilter, cardFundingFilter, str6, z22, z16, merchantName, str4, resolvableString3, resolvableString4, addPaymentMethodOptions, z12, bool2, str5, resolvableString5, expiryDateInput, cvcInput, addBankAccountState, resolvableString6, resolvableString7, z18, z19, z21, billingDetailsCollectionConfiguration, z23);
    }

    public final IdentifierResolvableString b() {
        String str;
        ConsumerPaymentDetails.PaymentDetails paymentDetailsD = d();
        if (paymentDetailsD == null) {
            return null;
        }
        boolean z11 = paymentDetailsD instanceof ConsumerPaymentDetails.BankAccount;
        String str2 = this.f97565i;
        boolean z12 = this.f97579y;
        if (z11) {
            return (!z12 || (str = this.f97566j) == null) ? zg.a.U(2132020050, new Object[0], EmptyList.f71733a) : zg.a.U(2132020051, new Object[]{str2, str, str2}, EmptyList.f71733a);
        }
        if (!(paymentDetailsD instanceof ConsumerPaymentDetails.Card) && !(paymentDetailsD instanceof ConsumerPaymentDetails.Passthrough)) {
            throw new NoWhenBranchMatchedException();
        }
        if (z12) {
            return zg.a.U(2132019897, new Object[]{str2}, EmptyList.f71733a);
        }
        if (this.f97564h) {
            return zg.a.U(2132019896, new Object[]{str2}, EmptyList.f71733a);
        }
        return null;
    }

    public final ps.q0 c() {
        ConsumerPaymentDetails.PaymentDetails paymentDetailsD;
        ft.r rVar;
        boolean z11 = this.f97573s.f83106b;
        ConsumerPaymentDetails.PaymentDetails paymentDetailsD2 = d();
        ConsumerPaymentDetails.Card card = paymentDetailsD2 instanceof ConsumerPaymentDetails.Card ? (ConsumerPaymentDetails.Card) paymentDetailsD2 : null;
        return this.f97563g ? ps.q0.f82955d : ((card != null && card.i()) && (!this.f97572r.f83106b || !z11)) || ((((card == null || (rVar = card.f43296m) == null) ? false : rVar.a()) && !z11) || this.f97570p != null || (paymentDetailsD = d()) == null || !e(paymentDetailsD) || (this.f97574t instanceof b)) ? ps.q0.f82954c : ps.q0.f82953b;
    }

    public final ConsumerPaymentDetails.PaymentDetails d() {
        Object next;
        List list = this.f97557a;
        String str = this.f97562f;
        if (str == null) {
            return (ConsumerPaymentDetails.PaymentDetails) b70.g.Y0(list);
        }
        Iterator it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((ConsumerPaymentDetails.PaymentDetails) next).getF43297c(), str)) {
                break;
            }
        }
        return (ConsumerPaymentDetails.PaymentDetails) next;
    }

    public final boolean e(ConsumerPaymentDetails.PaymentDetails item) {
        boolean zContains;
        CountryCode countryCode;
        boolean zH;
        Intrinsics.g(item, "item");
        PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration = this.f97580z;
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        Set setB = billingDetailsCollectionConfiguration.b();
        if (setB.isEmpty()) {
            zContains = true;
        } else if (item instanceof ConsumerPaymentDetails.Card) {
            ConsumerPaymentDetails.BillingAddress billingAddress = ((ConsumerPaymentDetails.Card) item).f43290g;
            if (billingAddress == null || (countryCode = billingAddress.f43285g) == null) {
                zContains = false;
            } else {
                String upperCase = countryCode.f42575a.toUpperCase(Locale.ROOT);
                Intrinsics.f(upperCase, "toUpperCase(...)");
                zContains = setB.contains(upperCase);
            }
        } else if (item instanceof ConsumerPaymentDetails.BankAccount) {
            CountryCode.Companion.getClass();
            zContains = setB.contains(CountryCode.f42574b.f42575a);
        } else {
            if (!(item instanceof ConsumerPaymentDetails.Passthrough)) {
                throw new NoWhenBranchMatchedException();
            }
            zContains = false;
        }
        if (zContains) {
            boolean z11 = item instanceof ConsumerPaymentDetails.Card;
            if (z11) {
                if (this.f97560d.M(((ConsumerPaymentDetails.Card) item).f43294k)) {
                    if (!(item instanceof ConsumerPaymentDetails.BankAccount)) {
                        if (z11) {
                            zH = this.f97561e.H(((ConsumerPaymentDetails.Card) item).n.f44021b);
                            if (!zH) {
                            }
                        } else if (!(item instanceof ConsumerPaymentDetails.Passthrough)) {
                            throw new NoWhenBranchMatchedException();
                        }
                    }
                    zH = true;
                    if (!zH) {
                    }
                }
            }
            return true;
        }
        return false;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t0)) {
            return false;
        }
        t0 t0Var = (t0) obj;
        return Intrinsics.b(this.f97557a, t0Var.f97557a) && Intrinsics.b(this.f97558b, t0Var.f97558b) && this.f97559c == t0Var.f97559c && Intrinsics.b(this.f97560d, t0Var.f97560d) && Intrinsics.b(this.f97561e, t0Var.f97561e) && Intrinsics.b(this.f97562f, t0Var.f97562f) && this.f97563g == t0Var.f97563g && this.f97564h == t0Var.f97564h && Intrinsics.b(this.f97565i, t0Var.f97565i) && Intrinsics.b(this.f97566j, t0Var.f97566j) && this.f97567k.equals(t0Var.f97567k) && Intrinsics.b(this.f97568l, t0Var.f97568l) && Intrinsics.b(this.f97569m, t0Var.f97569m) && this.n == t0Var.n && Intrinsics.b(this.o, t0Var.o) && Intrinsics.b(this.f97570p, t0Var.f97570p) && Intrinsics.b(this.f97571q, t0Var.f97571q) && this.f97572r.equals(t0Var.f97572r) && this.f97573s.equals(t0Var.f97573s) && Intrinsics.b(this.f97574t, t0Var.f97574t) && Intrinsics.b(this.f97575u, t0Var.f97575u) && Intrinsics.b(this.f97576v, t0Var.f97576v) && this.f97577w == t0Var.f97577w && this.f97578x == t0Var.f97578x && this.f97579y == t0Var.f97579y && Intrinsics.b(this.f97580z, t0Var.f97580z) && this.A == t0Var.A;
    }

    public final int hashCode() {
        int iHashCode = (this.f97561e.hashCode() + ((this.f97560d.hashCode() + c9.f(b.c0.e(this.f97557a.hashCode() * 31, 31, this.f97558b), 31, this.f97559c)) * 31)) * 31;
        String str = this.f97562f;
        int iE = b.c0.e(c9.f(c9.f((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f97563g), 31, this.f97564h), 31, this.f97565i);
        String str2 = this.f97566j;
        int iHashCode2 = (this.f97567k.hashCode() + ((iE + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31;
        ResolvableString resolvableString = this.f97568l;
        int iF = c9.f(u4.c(c9.f((iHashCode2 + (resolvableString == null ? 0 : resolvableString.hashCode())) * 31, 31, false), 31, this.f97569m), 31, this.n);
        Boolean bool = this.o;
        int iHashCode3 = (iF + (bool == null ? 0 : bool.hashCode())) * 31;
        String str3 = this.f97570p;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        ResolvableString resolvableString2 = this.f97571q;
        int iHashCode5 = (this.f97574t.hashCode() + ((this.f97573s.hashCode() + ((this.f97572r.hashCode() + ((iHashCode4 + (resolvableString2 == null ? 0 : resolvableString2.hashCode())) * 31)) * 31)) * 31)) * 31;
        ResolvableString resolvableString3 = this.f97575u;
        int iHashCode6 = (iHashCode5 + (resolvableString3 == null ? 0 : resolvableString3.hashCode())) * 31;
        ResolvableString resolvableString4 = this.f97576v;
        return Boolean.hashCode(this.A) + ((this.f97580z.hashCode() + c9.f(c9.f(c9.f((iHashCode6 + (resolvableString4 != null ? resolvableString4.hashCode() : 0)) * 31, 31, this.f97577w), 31, this.f97578x), 31, this.f97579y)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("WalletUiState(paymentDetailsList=");
        sb2.append(this.f97557a);
        sb2.append(", email=");
        sb2.append(this.f97558b);
        sb2.append(", allowLogOut=");
        sb2.append(this.f97559c);
        sb2.append(", cardBrandFilter=");
        sb2.append(this.f97560d);
        sb2.append(", cardFundingFilter=");
        sb2.append(this.f97561e);
        sb2.append(", selectedItemId=");
        sb2.append(this.f97562f);
        sb2.append(", isProcessing=");
        a80.m.s(sb2, this.f97563g, ", isSettingUp=", this.f97564h, ", merchantName=");
        b.c0.D(sb2, this.f97565i, ", sellerBusinessName=", this.f97566j, ", primaryButtonLabel=");
        sb2.append(this.f97567k);
        sb2.append(", secondaryButtonLabel=");
        sb2.append(this.f97568l);
        sb2.append(", hasCompleted=false, addPaymentMethodOptions=");
        sb2.append(this.f97569m);
        sb2.append(", collectMissingBillingDetailsForExistingPaymentMethods=");
        sb2.append(this.n);
        sb2.append(", userSetIsExpanded=");
        sb2.append(this.o);
        sb2.append(", cardBeingUpdated=");
        sb2.append(this.f97570p);
        sb2.append(", errorMessage=");
        sb2.append(this.f97571q);
        sb2.append(", expiryDateInput=");
        sb2.append(this.f97572r);
        sb2.append(", cvcInput=");
        sb2.append(this.f97573s);
        sb2.append(", addBankAccountState=");
        sb2.append(this.f97574t);
        sb2.append(", alertMessage=");
        sb2.append(this.f97575u);
        sb2.append(", paymentSelectionHint=");
        sb2.append(this.f97576v);
        sb2.append(", isAutoSelecting=");
        a80.m.s(sb2, this.f97577w, ", hasAttemptedAutoSelection=", this.f97578x, ", signupToggleEnabled=");
        sb2.append(this.f97579y);
        sb2.append(", billingDetailsCollectionConfiguration=");
        sb2.append(this.f97580z);
        sb2.append(", isValidating=");
        return a80.m.k(sb2, this.A, ")");
    }
}
