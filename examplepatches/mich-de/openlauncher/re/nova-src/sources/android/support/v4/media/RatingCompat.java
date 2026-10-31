package android.support.v4.media;

import ab.w;
import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
public final class RatingCompat implements Parcelable {
    public static final Parcelable.Creator<RatingCompat> CREATOR = new w(17);

    /* renamed from: a, reason: collision with root package name */
    public final int f13567a;

    /* renamed from: b, reason: collision with root package name */
    public final float f13568b;

    public RatingCompat(int i5, float f11) {
        this.f13567a = i5;
        this.f13568b = f11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return this.f13567a;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Rating:style=");
        sb2.append(this.f13567a);
        sb2.append(" rating=");
        float f11 = this.f13568b;
        sb2.append(f11 < 0.0f ? "unrated" : String.valueOf(f11));
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f13567a);
        parcel.writeFloat(this.f13568b);
    }
}
