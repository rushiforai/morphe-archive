package com.stripe.android.view;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.view.CardBrandView;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        boolean z11 = parcel.readInt() != 0;
        boolean z12 = parcel.readInt() != 0;
        ft.b bVarValueOf = ft.b.valueOf(parcel.readString());
        ft.b bVarValueOf2 = parcel.readInt() == 0 ? null : ft.b.valueOf(parcel.readString());
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            arrayList.add(ft.b.valueOf(parcel.readString()));
        }
        int i12 = parcel.readInt();
        ArrayList arrayList2 = new ArrayList(i12);
        for (int i13 = 0; i13 != i12; i13++) {
            arrayList2.add(ft.b.valueOf(parcel.readString()));
        }
        return new CardBrandView.State(z11, z12, bVarValueOf, bVarValueOf2, arrayList, arrayList2, parcel.readInt() != 0, parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CardBrandView.State[i5];
    }
}
