package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConsentUi;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        int iB = 0;
        while (iB != i5) {
            iB = fq.c.b(ConsentUi.ConsentPane.ScopesSection.Scope.CREATOR, parcel, arrayList, iB, 1);
        }
        return new ConsentUi.ConsentPane.ScopesSection(string, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConsentUi.ConsentPane.ScopesSection[i5];
    }
}
