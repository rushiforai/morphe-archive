package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.common.Metadata;

/* loaded from: assets/audience_network/classes.dex */
public class L2 implements Parcelable.Creator<Metadata> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final Metadata createFromParcel(Parcel parcel) {
        return new Metadata(parcel);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final Metadata[] newArray(int i5) {
        return new Metadata[i5];
    }
}
