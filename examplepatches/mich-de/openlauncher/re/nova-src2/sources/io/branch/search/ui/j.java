package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.ui.BranchEntity;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new BranchEntity.AutoSuggestion(InterfaceC3331q6.a.CREATOR.createFromParcel(parcel), parcel.readString(), (Image) parcel.readParcelable(BranchEntity.AutoSuggestion.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BranchEntity.AutoSuggestion[i5];
    }
}
