package androidx.versionedparcelable;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.f08;
import defpackage.ose;
import defpackage.pse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ParcelImpl implements Parcelable {
    public static final Parcelable.Creator<ParcelImpl> CREATOR = new f08(3);
    public final pse a;

    public ParcelImpl(Parcel parcel) {
        this.a = new ose(parcel).h();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        new ose(parcel).l(this.a);
    }

    public ParcelImpl(pse pseVar) {
        this.a = pseVar;
    }
}
