package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.ui.BranchEntity;
import io.branch.search.ui.Image;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new BranchEntity.RichContent(InterfaceC3331q6.b.CREATOR.createFromParcel(parcel), Image.LargeImage.CREATOR.createFromParcel(parcel), parcel.readString(), BranchEntity.SourceData.CREATOR.createFromParcel(parcel), parcel.readInt() == 0 ? 0 : b50.e.c(parcel.readString()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BranchEntity.RichContent[i5];
    }
}
