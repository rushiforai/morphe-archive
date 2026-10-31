package com.stripe.android.stripe3ds2.transactions;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import com.stripe.android.stripe3ds2.transactions.ChallengeResponseData;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        String str;
        boolean z12;
        ArrayList arrayList;
        String str2;
        ArrayList arrayList2;
        ArrayList arrayList3;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        String string2 = parcel.readString();
        String string3 = parcel.readString();
        String string4 = parcel.readString();
        xv.d dVarValueOf = parcel.readInt() == 0 ? null : xv.d.valueOf(parcel.readString());
        boolean z13 = false;
        if (parcel.readInt() != 0) {
            z11 = false;
            z13 = true;
        } else {
            z11 = false;
        }
        String string5 = parcel.readString();
        String string6 = parcel.readString();
        String string7 = parcel.readString();
        String string8 = parcel.readString();
        if (parcel.readInt() != 0) {
            str = string5;
            z12 = true;
        } else {
            str = string5;
            z12 = z11;
        }
        if (parcel.readInt() != 0) {
            int i5 = parcel.readInt();
            arrayList = new ArrayList(i5);
            int iB = 0;
            while (true) {
                str2 = string;
                if (iB == i5) {
                    break;
                }
                iB = fq.c.b(ChallengeResponseData.ChallengeSelectOption.CREATOR, parcel, arrayList, iB, 1);
                string = str2;
            }
        } else {
            arrayList = null;
            str2 = string;
        }
        String string9 = parcel.readString();
        String string10 = parcel.readString();
        ChallengeResponseData.Image imageCreateFromParcel = parcel.readInt() == 0 ? null : ChallengeResponseData.Image.CREATOR.createFromParcel(parcel);
        if (parcel.readInt() == 0) {
            arrayList3 = arrayList;
            arrayList2 = null;
        } else {
            int i11 = parcel.readInt();
            arrayList2 = new ArrayList(i11);
            arrayList3 = arrayList;
            int iB2 = 0;
            while (iB2 != i11) {
                iB2 = fq.c.b(MessageExtension.CREATOR, parcel, arrayList2, iB2, 1);
                i11 = i11;
                imageCreateFromParcel = imageCreateFromParcel;
            }
        }
        return new ChallengeResponseData(str2, string2, string3, string4, dVarValueOf, z13, str, string6, string7, string8, z12, arrayList3, string9, string10, imageCreateFromParcel, arrayList2, parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : ChallengeResponseData.Image.CREATOR.createFromParcel(parcel), parcel.readString(), SdkTransactionId.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ChallengeResponseData[i5];
    }
}
