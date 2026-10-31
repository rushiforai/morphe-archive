package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.extractor.metadata.mp4.SlowMotionData;
import java.util.ArrayList;

/* renamed from: com.facebook.ads.redexgen.X.aA, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1424aA implements Parcelable.Creator<SlowMotionData> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final SlowMotionData createFromParcel(Parcel parcel) {
        ArrayList arrayList = new ArrayList();
        parcel.readList(arrayList, SlowMotionData.Segment.class.getClassLoader());
        return new SlowMotionData(arrayList);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final SlowMotionData[] newArray(int i5) {
        return new SlowMotionData[i5];
    }
}
