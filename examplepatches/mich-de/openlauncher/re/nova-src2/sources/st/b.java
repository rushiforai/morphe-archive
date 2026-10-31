package st;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentelement.confirmation.epms.ExternalPaymentMethodConfirmationOption;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ExternalPaymentMethodConfirmationOption(parcel.readString(), (PaymentMethod.BillingDetails) parcel.readParcelable(ExternalPaymentMethodConfirmationOption.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ExternalPaymentMethodConfirmationOption[i5];
    }
}
