package com.google.android.flexbox;

import android.os.Parcel;
import android.os.Parcelable;
import android.view.ViewGroup;
import com.google.android.flexbox.FlexboxLayoutManager;

/* loaded from: classes3.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        FlexboxLayoutManager.LayoutParams layoutParams = new FlexboxLayoutManager.LayoutParams(-2, -2);
        layoutParams.f31650e = 0.0f;
        layoutParams.f31651f = 1.0f;
        layoutParams.f31652g = -1;
        layoutParams.f31653h = -1.0f;
        layoutParams.f31656k = 16777215;
        layoutParams.f31657l = 16777215;
        layoutParams.f31650e = parcel.readFloat();
        layoutParams.f31651f = parcel.readFloat();
        layoutParams.f31652g = parcel.readInt();
        layoutParams.f31653h = parcel.readFloat();
        layoutParams.f31654i = parcel.readInt();
        layoutParams.f31655j = parcel.readInt();
        layoutParams.f31656k = parcel.readInt();
        layoutParams.f31657l = parcel.readInt();
        layoutParams.f31658m = parcel.readByte() != 0;
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
        return new FlexboxLayoutManager.LayoutParams[i5];
    }
}
