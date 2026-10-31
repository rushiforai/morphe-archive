package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.extractor.metadata.icy.IcyInfo;

/* renamed from: com.facebook.ads.redexgen.X.Zs, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1406Zs implements Parcelable.Creator<IcyInfo> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final IcyInfo createFromParcel(Parcel parcel) {
        return new IcyInfo(parcel);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final IcyInfo[] newArray(int i5) {
        return new IcyInfo[i5];
    }
}
