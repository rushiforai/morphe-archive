package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import h6.c1;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/addresselement/AddressLauncher$Configuration", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class AddressLauncher$Configuration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<AddressLauncher$Configuration> CREATOR = new pu.a(1);

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$Appearance f44695a;

    /* renamed from: b, reason: collision with root package name */
    public final AddressDetails f44696b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f44697c;

    /* renamed from: d, reason: collision with root package name */
    public final String f44698d;

    /* renamed from: e, reason: collision with root package name */
    public final AddressLauncher$AdditionalFieldsConfiguration f44699e;

    /* renamed from: f, reason: collision with root package name */
    public final String f44700f;

    /* renamed from: g, reason: collision with root package name */
    public final String f44701g;

    /* renamed from: h, reason: collision with root package name */
    public final Set f44702h;

    /* renamed from: i, reason: collision with root package name */
    public final PaymentSheet$BillingDetails f44703i;

    public AddressLauncher$Configuration(PaymentSheet$Appearance appearance, AddressDetails addressDetails, Set set, String str, AddressLauncher$AdditionalFieldsConfiguration addressLauncher$AdditionalFieldsConfiguration, String str2, String str3, Set autocompleteCountries, PaymentSheet$BillingDetails paymentSheet$BillingDetails) {
        Intrinsics.g(appearance, "appearance");
        Intrinsics.g(autocompleteCountries, "autocompleteCountries");
        this.f44695a = appearance;
        this.f44696b = addressDetails;
        this.f44697c = set;
        this.f44698d = str;
        this.f44699e = addressLauncher$AdditionalFieldsConfiguration;
        this.f44700f = str2;
        this.f44701g = str3;
        this.f44702h = autocompleteCountries;
        this.f44703i = paymentSheet$BillingDetails;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AddressLauncher$Configuration)) {
            return false;
        }
        AddressLauncher$Configuration addressLauncher$Configuration = (AddressLauncher$Configuration) obj;
        return Intrinsics.b(this.f44695a, addressLauncher$Configuration.f44695a) && Intrinsics.b(this.f44696b, addressLauncher$Configuration.f44696b) && Intrinsics.b(this.f44697c, addressLauncher$Configuration.f44697c) && Intrinsics.b(this.f44698d, addressLauncher$Configuration.f44698d) && Intrinsics.b(this.f44699e, addressLauncher$Configuration.f44699e) && Intrinsics.b(this.f44700f, addressLauncher$Configuration.f44700f) && Intrinsics.b(this.f44701g, addressLauncher$Configuration.f44701g) && Intrinsics.b(this.f44702h, addressLauncher$Configuration.f44702h) && Intrinsics.b(this.f44703i, addressLauncher$Configuration.f44703i);
    }

    public final int hashCode() {
        int iHashCode = this.f44695a.hashCode() * 31;
        AddressDetails addressDetails = this.f44696b;
        int iK = c1.k(this.f44697c, (iHashCode + (addressDetails == null ? 0 : addressDetails.hashCode())) * 31, 31);
        String str = this.f44698d;
        int iHashCode2 = (iK + (str == null ? 0 : str.hashCode())) * 31;
        AddressLauncher$AdditionalFieldsConfiguration addressLauncher$AdditionalFieldsConfiguration = this.f44699e;
        int iHashCode3 = (iHashCode2 + (addressLauncher$AdditionalFieldsConfiguration == null ? 0 : addressLauncher$AdditionalFieldsConfiguration.hashCode())) * 31;
        String str2 = this.f44700f;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f44701g;
        int iK2 = c1.k(this.f44702h, (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31, 31);
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f44703i;
        return iK2 + (paymentSheet$BillingDetails != null ? paymentSheet$BillingDetails.hashCode() : 0);
    }

    public final String toString() {
        return "Configuration(appearance=" + this.f44695a + ", address=" + this.f44696b + ", allowedCountries=" + this.f44697c + ", buttonTitle=" + this.f44698d + ", additionalFields=" + this.f44699e + ", title=" + this.f44700f + ", googlePlacesApiKey=" + this.f44701g + ", autocompleteCountries=" + this.f44702h + ", billingAddress=" + this.f44703i + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f44695a.writeToParcel(dest, i5);
        dest.writeParcelable(this.f44696b, i5);
        Set set = this.f44697c;
        dest.writeInt(set.size());
        Iterator it = set.iterator();
        while (it.hasNext()) {
            dest.writeString((String) it.next());
        }
        dest.writeString(this.f44698d);
        AddressLauncher$AdditionalFieldsConfiguration addressLauncher$AdditionalFieldsConfiguration = this.f44699e;
        if (addressLauncher$AdditionalFieldsConfiguration == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            addressLauncher$AdditionalFieldsConfiguration.writeToParcel(dest, i5);
        }
        dest.writeString(this.f44700f);
        dest.writeString(this.f44701g);
        Set set2 = this.f44702h;
        dest.writeInt(set2.size());
        Iterator it2 = set2.iterator();
        while (it2.hasNext()) {
            dest.writeString((String) it2.next());
        }
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f44703i;
        if (paymentSheet$BillingDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$BillingDetails.writeToParcel(dest, i5);
        }
    }
}
