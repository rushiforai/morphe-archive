package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.MlltFrame;

/* renamed from: com.facebook.ads.redexgen.X.a3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1417a3 implements Parcelable.Creator<MlltFrame> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final MlltFrame createFromParcel(Parcel parcel) {
        return new MlltFrame(parcel);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final MlltFrame[] newArray(int i5) {
        return new MlltFrame[i5];
    }
}
