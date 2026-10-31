package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.common.DrmInitData;

/* loaded from: assets/audience_network/classes.dex */
public class KT implements Parcelable.Creator<DrmInitData> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final DrmInitData createFromParcel(Parcel parcel) {
        return new DrmInitData(parcel);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final DrmInitData[] newArray(int i5) {
        return new DrmInitData[i5];
    }
}
