package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.ui.Image;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        float f11 = parcel.readFloat();
        Parcelable parcelable = parcel.readParcelable(Image.Url.class.getClassLoader());
        Intrinsics.d(parcelable);
        return new Image.LargeImage(f11, (Image.Url) parcelable);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Image.LargeImage[i5];
    }
}
