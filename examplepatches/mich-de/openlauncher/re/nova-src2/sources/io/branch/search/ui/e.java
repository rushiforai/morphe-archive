package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.ui.BranchEntity;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        InterfaceC3331q6 interfaceC3331q6 = (InterfaceC3331q6) parcel.readParcelable(BranchEntity.AppStore.class.getClassLoader());
        String string = parcel.readString();
        String string2 = parcel.readString();
        Image image = (Image) parcel.readParcelable(BranchEntity.AppStore.class.getClassLoader());
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            arrayList.add(parcel.readParcelable(BranchEntity.AppStore.class.getClassLoader()));
        }
        return new BranchEntity.AppStore(interfaceC3331q6, string, string2, image, arrayList, parcel.readFloat(), parcel.readLong(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0 ? b50.e.c(parcel.readString()) : 0, parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BranchEntity.AppStore[i5];
    }
}
