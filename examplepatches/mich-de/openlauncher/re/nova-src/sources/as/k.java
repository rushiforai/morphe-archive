package as;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.googlepaylauncher.GooglePayLauncher$BillingAddressConfig;
import com.stripe.android.googlepaylauncher.GooglePayLauncher$Config;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncher$BillingAddressConfig;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncher$Config;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15615a;

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        boolean z12;
        GooglePayLauncher$BillingAddressConfig googlePayLauncher$BillingAddressConfig;
        boolean z13;
        boolean z14;
        boolean z15;
        GooglePayPaymentMethodLauncher$BillingAddressConfig googlePayPaymentMethodLauncher$BillingAddressConfig;
        boolean z16;
        switch (this.f15615a) {
            case 0:
                Intrinsics.g(parcel, "parcel");
                return new GooglePayLauncher$BillingAddressConfig(parcel.readInt() != 0, l.valueOf(parcel.readString()), parcel.readInt() != 0);
            case 1:
                Intrinsics.g(parcel, "parcel");
                j jVarValueOf = j.valueOf(parcel.readString());
                String string = parcel.readString();
                String string2 = parcel.readString();
                boolean z17 = false;
                if (parcel.readInt() != 0) {
                    z11 = false;
                    z17 = true;
                } else {
                    z11 = false;
                }
                GooglePayLauncher$BillingAddressConfig googlePayLauncher$BillingAddressConfigCreateFromParcel = GooglePayLauncher$BillingAddressConfig.CREATOR.createFromParcel(parcel);
                if (parcel.readInt() != 0) {
                    z12 = true;
                    googlePayLauncher$BillingAddressConfig = googlePayLauncher$BillingAddressConfigCreateFromParcel;
                    z13 = true;
                } else {
                    z12 = true;
                    googlePayLauncher$BillingAddressConfig = googlePayLauncher$BillingAddressConfigCreateFromParcel;
                    z13 = z11;
                }
                if (parcel.readInt() == 0) {
                    z12 = z11;
                }
                return new GooglePayLauncher$Config(jVarValueOf, string, string2, z17, googlePayLauncher$BillingAddressConfig, z13, z12, parcel.createStringArrayList());
            case 2:
                Intrinsics.g(parcel, "parcel");
                return new GooglePayPaymentMethodLauncher$BillingAddressConfig(parcel.readInt() != 0, v.valueOf(parcel.readString()), parcel.readInt() != 0);
            default:
                Intrinsics.g(parcel, "parcel");
                j jVarValueOf2 = j.valueOf(parcel.readString());
                String string3 = parcel.readString();
                String string4 = parcel.readString();
                boolean z18 = false;
                if (parcel.readInt() != 0) {
                    z14 = false;
                    z18 = true;
                } else {
                    z14 = false;
                }
                GooglePayPaymentMethodLauncher$BillingAddressConfig googlePayPaymentMethodLauncher$BillingAddressConfigCreateFromParcel = GooglePayPaymentMethodLauncher$BillingAddressConfig.CREATOR.createFromParcel(parcel);
                if (parcel.readInt() != 0) {
                    z15 = true;
                    googlePayPaymentMethodLauncher$BillingAddressConfig = googlePayPaymentMethodLauncher$BillingAddressConfigCreateFromParcel;
                    z16 = true;
                } else {
                    z15 = true;
                    googlePayPaymentMethodLauncher$BillingAddressConfig = googlePayPaymentMethodLauncher$BillingAddressConfigCreateFromParcel;
                    z16 = z14;
                }
                if (parcel.readInt() == 0) {
                    z15 = z14;
                }
                return new GooglePayPaymentMethodLauncher$Config(jVarValueOf2, string3, string4, z18, googlePayPaymentMethodLauncher$BillingAddressConfig, z16, z15, parcel.createStringArrayList());
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f15615a) {
            case 0:
                return new GooglePayLauncher$BillingAddressConfig[i5];
            case 1:
                return new GooglePayLauncher$Config[i5];
            case 2:
                return new GooglePayPaymentMethodLauncher$BillingAddressConfig[i5];
            default:
                return new GooglePayPaymentMethodLauncher$Config[i5];
        }
    }
}
