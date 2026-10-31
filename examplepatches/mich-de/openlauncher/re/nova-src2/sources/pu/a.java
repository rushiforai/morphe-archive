package pu;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.stripe.android.paymentsheet.addresselement.AddressLauncher$AdditionalFieldsConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressLauncher$Configuration;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83011a;

    public /* synthetic */ a(int i5) {
        this.f83011a = i5;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        switch (this.f83011a) {
            case 0:
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                Boolean boolValueOf = null;
                PaymentSheet$Address paymentSheet$AddressCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$Address.CREATOR.createFromParcel(parcel);
                String string2 = parcel.readString();
                if (parcel.readInt() != 0) {
                    boolValueOf = Boolean.valueOf(parcel.readInt() != 0);
                }
                return new AddressDetails(string, paymentSheet$AddressCreateFromParcel, string2, boolValueOf);
            default:
                Intrinsics.g(parcel, "parcel");
                PaymentSheet$Appearance paymentSheet$AppearanceCreateFromParcel = PaymentSheet$Appearance.CREATOR.createFromParcel(parcel);
                AddressDetails addressDetails = (AddressDetails) parcel.readParcelable(AddressLauncher$Configuration.class.getClassLoader());
                int i5 = parcel.readInt();
                LinkedHashSet linkedHashSet = new LinkedHashSet(i5);
                int iH = 0;
                int iH2 = 0;
                while (iH2 != i5) {
                    iH2 = k2.h(parcel, linkedHashSet, iH2, 1);
                }
                String string3 = parcel.readString();
                AddressLauncher$AdditionalFieldsConfiguration addressLauncher$AdditionalFieldsConfigurationCreateFromParcel = parcel.readInt() == 0 ? null : AddressLauncher$AdditionalFieldsConfiguration.CREATOR.createFromParcel(parcel);
                String string4 = parcel.readString();
                String string5 = parcel.readString();
                int i11 = parcel.readInt();
                LinkedHashSet linkedHashSet2 = new LinkedHashSet(i11);
                while (iH != i11) {
                    iH = k2.h(parcel, linkedHashSet2, iH, 1);
                }
                return new AddressLauncher$Configuration(paymentSheet$AppearanceCreateFromParcel, addressDetails, linkedHashSet, string3, addressLauncher$AdditionalFieldsConfigurationCreateFromParcel, string4, string5, linkedHashSet2, parcel.readInt() == 0 ? null : PaymentSheet$BillingDetails.CREATOR.createFromParcel(parcel));
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f83011a) {
            case 0:
                return new AddressDetails[i5];
            default:
                return new AddressLauncher$Configuration[i5];
        }
    }
}
