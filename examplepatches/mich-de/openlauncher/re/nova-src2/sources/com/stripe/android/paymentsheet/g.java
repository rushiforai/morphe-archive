package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.paymentsheet.PaymentOptionsActivityResult;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        ArrayList arrayList;
        Intrinsics.g(parcel, "parcel");
        Throwable th2 = (Throwable) parcel.readSerializable();
        PaymentSelection paymentSelection = (PaymentSelection) parcel.readParcelable(PaymentOptionsActivityResult.Canceled.class.getClassLoader());
        if (parcel.readInt() == 0) {
            arrayList = null;
        } else {
            int i5 = parcel.readInt();
            ArrayList arrayList2 = new ArrayList(i5);
            for (int i11 = 0; i11 != i5; i11++) {
                arrayList2.add(parcel.readParcelable(PaymentOptionsActivityResult.Canceled.class.getClassLoader()));
            }
            arrayList = arrayList2;
        }
        return new PaymentOptionsActivityResult.Canceled(th2, paymentSelection, arrayList, LinkAccountUpdate.Value.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentOptionsActivityResult.Canceled[i5];
    }
}
