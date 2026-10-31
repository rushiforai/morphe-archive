package wt;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentelement.confirmation.link.LinkPassthroughConfirmationOption;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new LinkPassthroughConfirmationOption(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), (PaymentMethod.AllowRedisplay) parcel.readParcelable(LinkPassthroughConfirmationOption.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkPassthroughConfirmationOption[i5];
    }
}
