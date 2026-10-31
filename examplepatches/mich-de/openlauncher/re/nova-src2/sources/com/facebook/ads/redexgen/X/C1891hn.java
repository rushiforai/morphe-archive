package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.internal.androidx.support.v4.view.ViewPager$SavedState;

/* renamed from: com.facebook.ads.redexgen.X.hn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1891hn implements Parcelable.ClassLoaderCreator<ViewPager$SavedState> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final ViewPager$SavedState createFromParcel(Parcel parcel) {
        return new ViewPager$SavedState(parcel, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.ClassLoaderCreator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final ViewPager$SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
        return new ViewPager$SavedState(parcel, classLoader);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A02, reason: merged with bridge method [inline-methods] */
    public final ViewPager$SavedState[] newArray(int i5) {
        return new ViewPager$SavedState[i5];
    }
}
