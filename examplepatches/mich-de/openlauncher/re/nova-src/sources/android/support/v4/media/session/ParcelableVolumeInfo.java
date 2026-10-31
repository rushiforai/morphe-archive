package android.support.v4.media.session;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
public class ParcelableVolumeInfo implements Parcelable {
    public static final Parcelable.Creator<ParcelableVolumeInfo> CREATOR = new a(3);

    /* renamed from: a, reason: collision with root package name */
    public int f13574a;

    /* renamed from: b, reason: collision with root package name */
    public int f13575b;

    /* renamed from: c, reason: collision with root package name */
    public int f13576c;

    /* renamed from: d, reason: collision with root package name */
    public int f13577d;

    /* renamed from: e, reason: collision with root package name */
    public int f13578e;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f13574a);
        parcel.writeInt(this.f13576c);
        parcel.writeInt(this.f13577d);
        parcel.writeInt(this.f13578e);
        parcel.writeInt(this.f13575b);
    }
}
