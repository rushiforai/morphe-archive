package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$ShopPayConfiguration;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h0 implements Parcelable.Creator {
    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        int i5;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        int iB = 0;
        boolean z11 = true;
        if (parcel.readInt() != 0) {
            i5 = 1;
        } else {
            i5 = 1;
            z11 = false;
        }
        boolean z12 = parcel.readInt() != 0 ? i5 : 0;
        boolean z13 = parcel.readInt() != 0 ? i5 : 0;
        ArrayList<String> arrayListCreateStringArrayList = parcel.createStringArrayList();
        int i11 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i11);
        int iB2 = 0;
        while (iB2 != i11) {
            iB2 = fq.c.b(PaymentSheet$ShopPayConfiguration.LineItem.CREATOR, parcel, arrayList, iB2, i5);
        }
        int i12 = parcel.readInt();
        ArrayList arrayList2 = new ArrayList(i12);
        while (iB != i12) {
            iB = fq.c.b(PaymentSheet$ShopPayConfiguration.ShippingRate.CREATOR, parcel, arrayList2, iB, i5);
        }
        return new PaymentSheet$ShopPayConfiguration(string, z11, z12, z13, arrayListCreateStringArrayList, arrayList, arrayList2);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$ShopPayConfiguration[i5];
    }
}
