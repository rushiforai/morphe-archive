package io.branch.search.ui;

import android.content.ComponentName;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import io.branch.search.ui.Image;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        Parcelable parcelable = parcel.readParcelable(ComponentName.class.getClassLoader());
        Intrinsics.d(parcelable);
        Parcelable parcelable2 = parcel.readParcelable(UserHandle.class.getClassLoader());
        Intrinsics.d(parcelable2);
        return new Image.AppIcon((ComponentName) parcelable, (UserHandle) parcelable2);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Image.AppIcon[i5];
    }
}
