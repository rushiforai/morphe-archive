package com.stripe.android.customersheet;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import b.u4;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/customersheet/CustomerSheet$Configuration", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CustomerSheet$Configuration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<CustomerSheet$Configuration> CREATOR = new ji.a(9);

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$Appearance f42590a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f42591b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42592c;

    /* renamed from: d, reason: collision with root package name */
    public final PaymentSheet$BillingDetails f42593d;

    /* renamed from: e, reason: collision with root package name */
    public final PaymentSheet$BillingDetailsCollectionConfiguration f42594e;

    /* renamed from: f, reason: collision with root package name */
    public final String f42595f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f42596g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f42597h;

    /* renamed from: i, reason: collision with root package name */
    public final List f42598i;

    /* renamed from: j, reason: collision with root package name */
    public final PaymentSheet$CardBrandAcceptance f42599j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f42600k;

    public CustomerSheet$Configuration(PaymentSheet$Appearance appearance, boolean z11, String str, PaymentSheet$BillingDetails defaultBillingDetails, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration, String merchantDisplayName, ArrayList arrayList, boolean z12, ArrayList paymentMethodOrder, PaymentSheet$CardBrandAcceptance cardBrandAcceptance, boolean z13) {
        Intrinsics.g(appearance, "appearance");
        Intrinsics.g(defaultBillingDetails, "defaultBillingDetails");
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        Intrinsics.g(merchantDisplayName, "merchantDisplayName");
        Intrinsics.g(paymentMethodOrder, "paymentMethodOrder");
        Intrinsics.g(cardBrandAcceptance, "cardBrandAcceptance");
        this.f42590a = appearance;
        this.f42591b = z11;
        this.f42592c = str;
        this.f42593d = defaultBillingDetails;
        this.f42594e = billingDetailsCollectionConfiguration;
        this.f42595f = merchantDisplayName;
        this.f42596g = arrayList;
        this.f42597h = z12;
        this.f42598i = paymentMethodOrder;
        this.f42599j = cardBrandAcceptance;
        this.f42600k = z13;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CustomerSheet$Configuration)) {
            return false;
        }
        CustomerSheet$Configuration customerSheet$Configuration = (CustomerSheet$Configuration) obj;
        return Intrinsics.b(this.f42590a, customerSheet$Configuration.f42590a) && this.f42591b == customerSheet$Configuration.f42591b && Intrinsics.b(this.f42592c, customerSheet$Configuration.f42592c) && Intrinsics.b(this.f42593d, customerSheet$Configuration.f42593d) && Intrinsics.b(this.f42594e, customerSheet$Configuration.f42594e) && Intrinsics.b(this.f42595f, customerSheet$Configuration.f42595f) && this.f42596g.equals(customerSheet$Configuration.f42596g) && this.f42597h == customerSheet$Configuration.f42597h && Intrinsics.b(this.f42598i, customerSheet$Configuration.f42598i) && Intrinsics.b(this.f42599j, customerSheet$Configuration.f42599j) && this.f42600k == customerSheet$Configuration.f42600k;
    }

    public final int hashCode() {
        int iF = c9.f(this.f42590a.hashCode() * 31, 31, this.f42591b);
        String str = this.f42592c;
        return Boolean.hashCode(this.f42600k) + ((this.f42599j.hashCode() + u4.c(c9.f((this.f42596g.hashCode() + c0.e((this.f42594e.hashCode() + ((this.f42593d.hashCode() + ((iF + (str == null ? 0 : str.hashCode())) * 31)) * 31)) * 31, 31, this.f42595f)) * 31, 31, this.f42597h), 31, this.f42598i)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Configuration(appearance=");
        sb2.append(this.f42590a);
        sb2.append(", googlePayEnabled=");
        sb2.append(this.f42591b);
        sb2.append(", headerTextForSelectionScreen=");
        sb2.append(this.f42592c);
        sb2.append(", defaultBillingDetails=");
        sb2.append(this.f42593d);
        sb2.append(", billingDetailsCollectionConfiguration=");
        sb2.append(this.f42594e);
        sb2.append(", merchantDisplayName=");
        sb2.append(this.f42595f);
        sb2.append(", preferredNetworks=");
        sb2.append(this.f42596g);
        sb2.append(", allowsRemovalOfLastSavedPaymentMethod=");
        sb2.append(this.f42597h);
        sb2.append(", paymentMethodOrder=");
        sb2.append(this.f42598i);
        sb2.append(", cardBrandAcceptance=");
        sb2.append(this.f42599j);
        sb2.append(", opensCardScannerAutomatically=");
        return m.k(sb2, this.f42600k, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f42590a.writeToParcel(dest, i5);
        dest.writeInt(this.f42591b ? 1 : 0);
        dest.writeString(this.f42592c);
        this.f42593d.writeToParcel(dest, i5);
        this.f42594e.writeToParcel(dest, i5);
        dest.writeString(this.f42595f);
        Iterator itJ = fq.c.j(this.f42596g, dest);
        while (itJ.hasNext()) {
            dest.writeString(((ft.b) itJ.next()).name());
        }
        dest.writeInt(this.f42597h ? 1 : 0);
        dest.writeStringList(this.f42598i);
        dest.writeParcelable(this.f42599j, i5);
        dest.writeInt(this.f42600k ? 1 : 0);
    }
}
