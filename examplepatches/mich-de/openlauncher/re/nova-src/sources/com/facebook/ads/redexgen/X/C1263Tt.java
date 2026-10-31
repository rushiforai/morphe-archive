package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.exoplayer.offline.DownloadRequest;

/* renamed from: com.facebook.ads.redexgen.X.Tt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1263Tt implements Parcelable.Creator<DownloadRequest> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final DownloadRequest createFromParcel(Parcel parcel) {
        return new DownloadRequest(parcel);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // android.os.Parcelable.Creator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final DownloadRequest[] newArray(int i5) {
        return new DownloadRequest[i5];
    }
}
