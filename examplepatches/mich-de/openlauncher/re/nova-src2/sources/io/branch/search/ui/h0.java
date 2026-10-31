package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.ui.Image;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        Parcelable parcelable = parcel.readParcelable(Image.Url.class.getClassLoader());
        Intrinsics.d(parcelable);
        String string = parcel.readString();
        Intrinsics.d(string);
        return new Image.AndroidResource((Image.Url) parcelable, string, parcel.readInt());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Image.AndroidResource[i5];
    }
}
