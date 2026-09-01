package android.support.v4.media.session;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.media.MediaDescriptionCompat;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import defpackage.ev6;
import defpackage.h74;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class MediaSessionCompat$QueueItem implements Parcelable {
    public static final Parcelable.Creator<MediaSessionCompat$QueueItem> CREATOR = new h74(27);
    public final MediaDescriptionCompat a;
    public final long b;

    public MediaSessionCompat$QueueItem(Parcel parcel) {
        this.a = MediaDescriptionCompat.CREATOR.createFromParcel(parcel);
        this.b = parcel.readLong();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        this.a.writeToParcel(parcel, i);
        parcel.writeLong(this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MediaSession.QueueItem {Description=");
        sb.append(this.a);
        sb.append(", Id=");
        return ev6.t(this.b, HrUBqHumRuLe.EGpjzTyVtz, sb);
    }
}
