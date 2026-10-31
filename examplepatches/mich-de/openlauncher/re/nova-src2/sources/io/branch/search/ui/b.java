package io.branch.search.ui;

import android.content.ComponentName;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.ui.BranchEntity;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new BranchEntity.App((InterfaceC3331q6) parcel.readParcelable(BranchEntity.App.class.getClassLoader()), parcel.readString(), (Image) parcel.readParcelable(BranchEntity.App.class.getClassLoader()), parcel.readString(), (ComponentName) parcel.readParcelable(BranchEntity.App.class.getClassLoader()), (UserHandle) parcel.readParcelable(BranchEntity.App.class.getClassLoader()), parcel.readInt() == 0 ? 0 : b50.e.c(parcel.readString()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BranchEntity.App[i5];
    }
}
