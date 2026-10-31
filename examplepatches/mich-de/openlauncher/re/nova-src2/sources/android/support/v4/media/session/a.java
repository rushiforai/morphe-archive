package android.support.v4.media.session;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.ResultReceiver;
import android.support.v4.media.MediaDescriptionCompat;

/* loaded from: classes2.dex */
public final class a implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f13594a;

    public /* synthetic */ a(int i5) {
        this.f13594a = i5;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(final Parcel parcel) {
        switch (this.f13594a) {
            case 0:
                MediaSessionCompat$ResultReceiverWrapper mediaSessionCompat$ResultReceiverWrapper = new MediaSessionCompat$ResultReceiverWrapper();
                mediaSessionCompat$ResultReceiverWrapper.f13571a = (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(parcel);
                return mediaSessionCompat$ResultReceiverWrapper;
            case 1:
                return new Parcelable(parcel) { // from class: android.support.v4.media.session.MediaSessionCompat$QueueItem
                    public static final Parcelable.Creator<MediaSessionCompat$QueueItem> CREATOR = new a(1);

                    /* renamed from: a, reason: collision with root package name */
                    public final MediaDescriptionCompat f13569a;

                    /* renamed from: b, reason: collision with root package name */
                    public final long f13570b;

                    {
                        this.f13569a = MediaDescriptionCompat.CREATOR.createFromParcel(parcel);
                        this.f13570b = parcel.readLong();
                    }

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final String toString() {
                        StringBuilder sb2 = new StringBuilder("MediaSession.QueueItem {Description=");
                        sb2.append(this.f13569a);
                        sb2.append(", Id=");
                        return a2.c.i(this.f13570b, " }", sb2);
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel parcel2, int i5) {
                        this.f13569a.writeToParcel(parcel2, i5);
                        parcel2.writeLong(this.f13570b);
                    }
                };
            case 2:
                final Parcelable parcelable = parcel.readParcelable(null);
                return new Parcelable(parcelable) { // from class: android.support.v4.media.session.MediaSessionCompat$Token
                    public static final Parcelable.Creator<MediaSessionCompat$Token> CREATOR = new a(2);

                    /* renamed from: a, reason: collision with root package name */
                    public final Object f13572a = new Object();

                    /* renamed from: b, reason: collision with root package name */
                    public final Object f13573b;

                    {
                        this.f13573b = parcelable;
                    }

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final boolean equals(Object obj) {
                        if (this == obj) {
                            return true;
                        }
                        if (!(obj instanceof MediaSessionCompat$Token)) {
                            return false;
                        }
                        Object obj2 = ((MediaSessionCompat$Token) obj).f13573b;
                        Object obj3 = this.f13573b;
                        if (obj3 == null) {
                            return obj2 == null;
                        }
                        if (obj2 == null) {
                            return false;
                        }
                        return obj3.equals(obj2);
                    }

                    public final int hashCode() {
                        Object obj = this.f13573b;
                        if (obj == null) {
                            return 0;
                        }
                        return obj.hashCode();
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel parcel2, int i5) {
                        parcel2.writeParcelable((Parcelable) this.f13573b, i5);
                    }
                };
            case 3:
                ParcelableVolumeInfo parcelableVolumeInfo = new ParcelableVolumeInfo();
                parcelableVolumeInfo.f13574a = parcel.readInt();
                parcelableVolumeInfo.f13576c = parcel.readInt();
                parcelableVolumeInfo.f13577d = parcel.readInt();
                parcelableVolumeInfo.f13578e = parcel.readInt();
                parcelableVolumeInfo.f13575b = parcel.readInt();
                return parcelableVolumeInfo;
            default:
                return new PlaybackStateCompat(parcel);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f13594a) {
            case 0:
                return new MediaSessionCompat$ResultReceiverWrapper[i5];
            case 1:
                return new MediaSessionCompat$QueueItem[i5];
            case 2:
                return new MediaSessionCompat$Token[i5];
            case 3:
                return new ParcelableVolumeInfo[i5];
            default:
                return new PlaybackStateCompat[i5];
        }
    }
}
