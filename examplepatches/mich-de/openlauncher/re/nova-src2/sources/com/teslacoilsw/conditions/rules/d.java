package com.teslacoilsw.conditions.rules;

import android.os.Parcel;
import android.os.Parcelable;
import com.teslacoilsw.conditions.SimpleBluetoothDevice;
import com.teslacoilsw.conditions.rules.ConditionModel;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        int iB = 0;
        while (iB != i5) {
            iB = fq.c.b(SimpleBluetoothDevice.CREATOR, parcel, arrayList, iB, 1);
        }
        return new ConditionModel.BluetoothConnectedModel(arrayList);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConditionModel.BluetoothConnectedModel[i5];
    }
}
