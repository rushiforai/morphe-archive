package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.Stripe3ds2AuthResult;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k5 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        ArrayList arrayList;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        String string2 = parcel.readString();
        String string3 = parcel.readString();
        String string4 = parcel.readString();
        String string5 = parcel.readString();
        String string6 = parcel.readString();
        String string7 = parcel.readString();
        if (parcel.readInt() == 0) {
            arrayList = null;
        } else {
            int i5 = parcel.readInt();
            ArrayList arrayList2 = new ArrayList(i5);
            int iB = 0;
            while (iB != i5) {
                iB = fq.c.b(Stripe3ds2AuthResult.MessageExtension.CREATOR, parcel, arrayList2, iB, 1);
            }
            arrayList = arrayList2;
        }
        return new Stripe3ds2AuthResult.Ares(string, string2, string3, string4, string5, string6, string7, arrayList, parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Stripe3ds2AuthResult.Ares[i5];
    }
}
