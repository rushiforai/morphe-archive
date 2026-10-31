package com.stripe.android.paymentelement.embedded.manage;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentelement.embedded.manage.ManageResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return ManageResult.Error.f44235a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ManageResult.Error[i5];
    }
}
