package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.H2;
import io.branch.search.ui.Image;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        Intrinsics.d(string);
        String string2 = parcel.readString();
        Intrinsics.d(string2);
        H2 resultType = H2.valueOf(string2);
        Image image = (Image) parcel.readParcelable(Image.class.getClassLoader());
        Intrinsics.g(resultType, "resultType");
        return new Image.Url(string, resultType, image);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Image.Url[i5];
    }
}
