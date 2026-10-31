package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$SavedState;

/* renamed from: com.facebook.ads.redexgen.X.j6, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1970j6 implements Parcelable.ClassLoaderCreator<RecyclerView$SavedState> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final RecyclerView$SavedState createFromParcel(Parcel parcel) {
        return new RecyclerView$SavedState(parcel, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.ClassLoaderCreator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final RecyclerView$SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
        return new RecyclerView$SavedState(parcel, classLoader);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A02, reason: merged with bridge method [inline-methods] */
    public final RecyclerView$SavedState[] newArray(int i5) {
        return new RecyclerView$SavedState[i5];
    }
}
