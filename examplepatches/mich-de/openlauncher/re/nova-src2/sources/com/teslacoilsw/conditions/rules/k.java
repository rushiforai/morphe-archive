package com.teslacoilsw.conditions.rules;

import android.os.Parcel;
import android.os.Parcelable;
import com.teslacoilsw.conditions.rules.ConditionModel;
import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class k implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        LocalTime localTime = (LocalTime) parcel.readSerializable();
        LocalTime localTime2 = (LocalTime) parcel.readSerializable();
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            arrayList.add(DayOfWeek.valueOf(parcel.readString()));
        }
        return new ConditionModel.TimeOfDayHourRangeModel(localTime, localTime2, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConditionModel.TimeOfDayHourRangeModel[i5];
    }
}
