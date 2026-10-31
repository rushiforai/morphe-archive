package com.stripe.android.ui.core.cbc;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.ui.core.cbc.CardBrandChoiceEligibility;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            arrayList.add(ft.b.valueOf(parcel.readString()));
        }
        return new CardBrandChoiceEligibility.Eligible(arrayList);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CardBrandChoiceEligibility.Eligible[i5];
    }
}
