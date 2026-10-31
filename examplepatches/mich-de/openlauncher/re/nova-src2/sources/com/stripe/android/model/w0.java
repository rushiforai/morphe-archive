package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ElementsSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        ElementsSession.CardBrandChoice cardBrandChoice;
        boolean z11;
        Intrinsics.g(parcel, "parcel");
        ElementsSession.LinkSettings linkSettingsCreateFromParcel = parcel.readInt() == 0 ? null : ElementsSession.LinkSettings.CREATOR.createFromParcel(parcel);
        String string = parcel.readString();
        String string2 = parcel.readString();
        StripeIntent stripeIntent = (StripeIntent) parcel.readParcelable(ElementsSession.class.getClassLoader());
        ArrayList<String> arrayListCreateStringArrayList = parcel.createStringArrayList();
        int i5 = parcel.readInt();
        LinkedHashMap linkedHashMap = new LinkedHashMap(i5);
        int i11 = 0;
        while (true) {
            boolean z12 = true;
            if (i11 == i5) {
                break;
            }
            ft.v vVarValueOf = ft.v.valueOf(parcel.readString());
            if (parcel.readInt() == 0) {
                z12 = false;
            }
            linkedHashMap.put(vVarValueOf, Boolean.valueOf(z12));
            i11++;
        }
        ElementsSession.ExperimentsData experimentsDataCreateFromParcel = parcel.readInt() == 0 ? null : ElementsSession.ExperimentsData.CREATOR.createFromParcel(parcel);
        ElementsSession.Customer customerCreateFromParcel = parcel.readInt() == 0 ? null : ElementsSession.Customer.CREATOR.createFromParcel(parcel);
        String string3 = parcel.readString();
        String string4 = parcel.readString();
        ElementsSession.CardBrandChoice cardBrandChoiceCreateFromParcel = parcel.readInt() == 0 ? null : ElementsSession.CardBrandChoice.CREATOR.createFromParcel(parcel);
        if (parcel.readInt() != 0) {
            z11 = true;
            cardBrandChoice = cardBrandChoiceCreateFromParcel;
        } else {
            cardBrandChoice = cardBrandChoiceCreateFromParcel;
            z11 = false;
        }
        Throwable th2 = (Throwable) parcel.readSerializable();
        int i12 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i12);
        for (int i13 = 0; i13 != i12; i13++) {
            arrayList.add(parcel.readParcelable(ElementsSession.class.getClassLoader()));
        }
        return new ElementsSession(linkSettingsCreateFromParcel, string, string2, stripeIntent, arrayListCreateStringArrayList, linkedHashMap, experimentsDataCreateFromParcel, customerCreateFromParcel, string3, string4, cardBrandChoice, z11, th2, arrayList, parcel.readString(), parcel.readInt() == 0 ? null : PassiveCaptchaParams.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSession[i5];
    }
}
