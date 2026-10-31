package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.common.StreamKey;

/* loaded from: assets/audience_network/classes.dex */
public class LU implements Parcelable.Creator<StreamKey> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final StreamKey createFromParcel(Parcel parcel) {
        return new StreamKey(parcel);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final StreamKey[] newArray(int i5) {
        return new StreamKey[i5];
    }
}
