package com.medium.android.donkey.push;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.donkey.push.TrampolineActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        parcel.getClass();
        return new TrampolineActivity.Action.OpenPostFromPushNotification(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i) {
        return new TrampolineActivity.Action.OpenPostFromPushNotification[i];
    }
}
