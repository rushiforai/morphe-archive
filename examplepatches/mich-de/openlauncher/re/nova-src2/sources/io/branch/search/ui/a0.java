package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.ui.BranchEntity;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new BranchEntity.Shortcut((InterfaceC3331q6) parcel.readParcelable(BranchEntity.Shortcut.class.getClassLoader()), parcel.readString(), parcel.readString(), (Image) parcel.readParcelable(BranchEntity.Shortcut.class.getClassLoader()), (Image) parcel.readParcelable(BranchEntity.Shortcut.class.getClassLoader()), parcel.readInt() == 0 ? 0 : b50.e.c(parcel.readString()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BranchEntity.Shortcut[i5];
    }
}
