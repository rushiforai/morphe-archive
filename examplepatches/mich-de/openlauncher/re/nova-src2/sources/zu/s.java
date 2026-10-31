package zu;

import b.c0;
import b.c9;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.stripe.android.paymentsheet.model.PaymentMethodIncentive;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import ft.d0;
import kotlin.jvm.internal.Intrinsics;
import ou.w0;

/* loaded from: classes4.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f98658a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethodIncentive f98659b;

    /* renamed from: c, reason: collision with root package name */
    public final d0 f98660c;

    /* renamed from: d, reason: collision with root package name */
    public final yu.a f98661d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f98662e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f98663f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f98664g;

    /* renamed from: h, reason: collision with root package name */
    public final String f98665h;

    /* renamed from: i, reason: collision with root package name */
    public final String f98666i;

    /* renamed from: j, reason: collision with root package name */
    public final String f98667j;

    /* renamed from: k, reason: collision with root package name */
    public final PaymentSelection.New.USBankAccount f98668k;

    /* renamed from: l, reason: collision with root package name */
    public final AddressDetails f98669l;

    /* renamed from: m, reason: collision with root package name */
    public final String f98670m;
    public final mu.b n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f98671p;

    /* renamed from: q, reason: collision with root package name */
    public final w0 f98672q;

    /* renamed from: r, reason: collision with root package name */
    public final String f98673r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f98674s;

    /* renamed from: t, reason: collision with root package name */
    public final ClientAttributionMetadata f98675t;

    public s(boolean z11, PaymentMethodIncentive paymentMethodIncentive, d0 d0Var, yu.a formArgs, boolean z12, boolean z13, boolean z14, String str, String str2, String str3, PaymentSelection.New.USBankAccount uSBankAccount, AddressDetails addressDetails, String str4, mu.b bVar, boolean z15, boolean z16, w0 w0Var, String str5, boolean z17, ClientAttributionMetadata clientAttributionMetadata) {
        Intrinsics.g(formArgs, "formArgs");
        Intrinsics.g(clientAttributionMetadata, "clientAttributionMetadata");
        this.f98658a = z11;
        this.f98659b = paymentMethodIncentive;
        this.f98660c = d0Var;
        this.f98661d = formArgs;
        this.f98662e = z12;
        this.f98663f = z13;
        this.f98664g = z14;
        this.f98665h = str;
        this.f98666i = str2;
        this.f98667j = str3;
        this.f98668k = uSBankAccount;
        this.f98669l = addressDetails;
        this.f98670m = str4;
        this.n = bVar;
        this.o = z15;
        this.f98671p = z16;
        this.f98672q = w0Var;
        this.f98673r = str5;
        this.f98674s = z17;
        this.f98675t = clientAttributionMetadata;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return this.f98658a == sVar.f98658a && Intrinsics.b(this.f98659b, sVar.f98659b) && this.f98660c == sVar.f98660c && Intrinsics.b(this.f98661d, sVar.f98661d) && this.f98662e == sVar.f98662e && this.f98663f == sVar.f98663f && this.f98664g == sVar.f98664g && Intrinsics.b(this.f98665h, sVar.f98665h) && Intrinsics.b(this.f98666i, sVar.f98666i) && Intrinsics.b(this.f98667j, sVar.f98667j) && Intrinsics.b(this.f98668k, sVar.f98668k) && Intrinsics.b(this.f98669l, sVar.f98669l) && this.f98670m.equals(sVar.f98670m) && this.n == sVar.n && this.o == sVar.o && this.f98671p == sVar.f98671p && this.f98672q == sVar.f98672q && Intrinsics.b(this.f98673r, sVar.f98673r) && this.f98674s == sVar.f98674s && Intrinsics.b(this.f98675t, sVar.f98675t);
    }

    public final int hashCode() {
        int iHashCode = Boolean.hashCode(this.f98658a) * 31;
        PaymentMethodIncentive paymentMethodIncentive = this.f98659b;
        int iHashCode2 = (iHashCode + (paymentMethodIncentive == null ? 0 : paymentMethodIncentive.hashCode())) * 31;
        d0 d0Var = this.f98660c;
        int iF = c9.f(c9.f(c9.f((this.f98661d.hashCode() + ((iHashCode2 + (d0Var == null ? 0 : d0Var.hashCode())) * 31)) * 31, 31, this.f98662e), 31, this.f98663f), 31, this.f98664g);
        String str = this.f98665h;
        int iHashCode3 = (iF + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f98666i;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f98667j;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        PaymentSelection.New.USBankAccount uSBankAccount = this.f98668k;
        int iHashCode6 = (iHashCode5 + (uSBankAccount == null ? 0 : uSBankAccount.hashCode())) * 31;
        AddressDetails addressDetails = this.f98669l;
        int iE = c0.e((iHashCode6 + (addressDetails == null ? 0 : addressDetails.hashCode())) * 31, 31, this.f98670m);
        mu.b bVar = this.n;
        int iHashCode7 = (this.f98672q.hashCode() + c9.f(c9.f((iE + (bVar == null ? 0 : bVar.hashCode())) * 31, 31, this.o), 31, this.f98671p)) * 31;
        String str4 = this.f98673r;
        return this.f98675t.hashCode() + c9.f((iHashCode7 + (str4 != null ? str4.hashCode() : 0)) * 31, 31, this.f98674s);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Args(instantDebits=");
        sb2.append(this.f98658a);
        sb2.append(", incentive=");
        sb2.append(this.f98659b);
        sb2.append(", linkMode=");
        sb2.append(this.f98660c);
        sb2.append(", formArgs=");
        sb2.append(this.f98661d);
        sb2.append(", showCheckbox=");
        a80.m.s(sb2, this.f98662e, ", isCompleteFlow=", this.f98663f, ", isPaymentFlow=");
        c9.s(", stripeIntentId=", this.f98665h, ", clientSecret=", sb2, this.f98664g);
        c0.D(sb2, this.f98666i, ", onBehalfOf=", this.f98667j, ", savedPaymentMethod=");
        sb2.append(this.f98668k);
        sb2.append(", shippingDetails=");
        sb2.append(this.f98669l);
        sb2.append(", hostedSurface=");
        sb2.append(this.f98670m);
        sb2.append(", financialConnectionsAvailability=");
        sb2.append(this.n);
        sb2.append(", setAsDefaultPaymentMethodEnabled=");
        a80.m.s(sb2, this.o, ", setAsDefaultMatchesSaveForFutureUse=", this.f98671p, ", termsDisplay=");
        sb2.append(this.f98672q);
        sb2.append(", sellerBusinessName=");
        sb2.append(this.f98673r);
        sb2.append(", forceSetupFutureUseBehavior=");
        sb2.append(this.f98674s);
        sb2.append(", clientAttributionMetadata=");
        sb2.append(this.f98675t);
        sb2.append(")");
        return sb2.toString();
    }
}
