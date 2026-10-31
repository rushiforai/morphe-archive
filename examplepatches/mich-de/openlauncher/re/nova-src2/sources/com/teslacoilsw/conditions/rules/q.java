package com.teslacoilsw.conditions.rules;

import android.os.Parcel;
import android.os.Parcelable;
import com.teslacoilsw.conditions.rules.ConditionModel;

/* loaded from: classes4.dex */
public final class q implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        return new ConditionModel.WifiConnectedModel(parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConditionModel.WifiConnectedModel[i5];
    }
}
