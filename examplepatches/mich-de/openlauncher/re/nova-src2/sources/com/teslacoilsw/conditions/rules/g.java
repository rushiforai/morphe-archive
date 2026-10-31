package com.teslacoilsw.conditions.rules;

import android.os.Parcel;
import android.os.Parcelable;
import com.teslacoilsw.conditions.rules.ConditionModel;
import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class g implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        LocalTime localTime = (LocalTime) parcel.readSerializable();
        long j11 = parcel.readLong();
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            arrayList.add(DayOfWeek.valueOf(parcel.readString()));
        }
        return new ConditionModel.TimeOfDayDurationModel(localTime, j11, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConditionModel.TimeOfDayDurationModel[i5];
    }
}
