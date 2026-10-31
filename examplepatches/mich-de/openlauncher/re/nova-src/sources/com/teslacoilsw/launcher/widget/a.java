package com.teslacoilsw.launcher.widget;

import android.os.Parcel;
import android.os.Parcelable;
import com.teslacoilsw.launcher.widget.RippleScrollView;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        RippleScrollView.SavedState savedState = new RippleScrollView.SavedState(parcel);
        savedState.f46482a = parcel.readInt();
        return savedState;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new RippleScrollView.SavedState[i5];
    }
}
