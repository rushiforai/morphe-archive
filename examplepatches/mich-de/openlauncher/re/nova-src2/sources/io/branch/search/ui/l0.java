package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import io.branch.search.ui.Image;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        Intrinsics.d(string);
        Parcelable parcelable = parcel.readParcelable(UserHandle.class.getClassLoader());
        Intrinsics.d(parcelable);
        String string2 = parcel.readString();
        Intrinsics.d(string2);
        return new Image.Shortcut((UserHandle) parcelable, string, string2);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Image.Shortcut[i5];
    }
}
