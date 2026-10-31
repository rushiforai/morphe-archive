package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        int iB = 0;
        while (iB != i5) {
            iB = fq.c.b(PaymentSheet$CardBrandAcceptance.BrandCategory.CREATOR, parcel, arrayList, iB, 1);
        }
        return new PaymentSheet$CardBrandAcceptance.Allowed(arrayList);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$CardBrandAcceptance.Allowed[i5];
    }
}
