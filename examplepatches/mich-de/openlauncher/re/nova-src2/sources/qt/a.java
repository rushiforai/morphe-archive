package qt;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentelement.confirmation.cpms.CustomPaymentMethodConfirmationOption;
import com.stripe.android.paymentsheet.PaymentSheet$CustomPaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CustomPaymentMethodConfirmationOption(PaymentSheet$CustomPaymentMethod.CREATOR.createFromParcel(parcel), (PaymentMethod.BillingDetails) parcel.readParcelable(CustomPaymentMethodConfirmationOption.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CustomPaymentMethodConfirmationOption[i5];
    }
}
