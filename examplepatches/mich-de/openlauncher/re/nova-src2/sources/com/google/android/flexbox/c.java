package com.google.android.flexbox;

import android.os.Parcel;
import android.os.Parcelable;
import android.view.ViewGroup;
import com.google.android.flexbox.FlexboxLayout;

/* loaded from: classes3.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        FlexboxLayout.LayoutParams layoutParams = new FlexboxLayout.LayoutParams(0, 0);
        layoutParams.f31617a = 1;
        layoutParams.f31618b = 0.0f;
        layoutParams.f31619c = 1.0f;
        layoutParams.f31620d = -1;
        layoutParams.f31621e = -1.0f;
        layoutParams.f31622f = -1;
        layoutParams.f31623g = -1;
        layoutParams.f31624h = 16777215;
        layoutParams.f31625i = 16777215;
        layoutParams.f31617a = parcel.readInt();
        layoutParams.f31618b = parcel.readFloat();
        layoutParams.f31619c = parcel.readFloat();
        layoutParams.f31620d = parcel.readInt();
        layoutParams.f31621e = parcel.readFloat();
        layoutParams.f31622f = parcel.readInt();
        layoutParams.f31623g = parcel.readInt();
        layoutParams.f31624h = parcel.readInt();
        layoutParams.f31625i = parcel.readInt();
        layoutParams.f31626j = parcel.readByte() != 0;
        ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin = parcel.readInt();
        ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin = parcel.readInt();
        ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin = parcel.readInt();
        ((ViewGroup.MarginLayoutParams) layoutParams).topMargin = parcel.readInt();
        ((ViewGroup.MarginLayoutParams) layoutParams).height = parcel.readInt();
        ((ViewGroup.MarginLayoutParams) layoutParams).width = parcel.readInt();
        return layoutParams;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new FlexboxLayout.LayoutParams[i5];
    }
}
