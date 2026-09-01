package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class df5 implements Parcelable {
    public static final Parcelable.Creator<df5> CREATOR = new h74(10);
    public final String a;
    public final Parcelable b;

    public df5(Parcel parcel) {
        this.a = parcel.readString();
        this.b = parcel.readParcelable(f94.a().getClassLoader());
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 1;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a);
        parcel.writeParcelable(this.b, i);
    }

    public df5(Parcelable parcelable) {
        this.a = "image/png";
        this.b = parcelable;
    }
}
