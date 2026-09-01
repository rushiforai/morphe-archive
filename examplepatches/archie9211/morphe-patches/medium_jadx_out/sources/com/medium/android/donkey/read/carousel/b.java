package com.medium.android.donkey.read.carousel;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        parcel.getClass();
        String string = parcel.readString();
        int i = parcel.readInt();
        LinkedHashMap linkedHashMap = new LinkedHashMap(i);
        for (int i2 = 0; i2 != i; i2++) {
            linkedHashMap.put(parcel.readString(), parcel.readString());
        }
        return new ImageCarouselActivity.SelectedImageContext.Key(string, linkedHashMap);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i) {
        return new ImageCarouselActivity.SelectedImageContext.Key[i];
    }
}
