package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class xjb implements Parcelable {
    public static final Parcelable.Creator<xjb> CREATOR = new lvf(10);

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        ukf ukfVar = (ukf) this;
        parcel.writeParcelable(ukfVar.a, 0);
        parcel.writeInt(ukfVar.b ? 1 : 0);
    }
}
