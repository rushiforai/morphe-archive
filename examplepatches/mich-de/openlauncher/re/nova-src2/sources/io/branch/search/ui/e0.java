package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.ui.BranchEntity;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new BranchEntity.SourceData(parcel.readInt() == 0 ? null : Float.valueOf(parcel.readFloat()), parcel.readString(), parcel.readString(), (Image) parcel.readParcelable(BranchEntity.SourceData.class.getClassLoader()), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BranchEntity.SourceData[i5];
    }
}
