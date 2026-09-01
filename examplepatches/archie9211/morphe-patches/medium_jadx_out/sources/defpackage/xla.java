package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.postpublishing.ui.PublicationSelection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xla implements PublicationSelection {
    public static final xla a = new xla();
    public static final Parcelable.Creator<xla> CREATOR = new f08(13);

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof xla);
    }

    public final int hashCode() {
        return -893475321;
    }

    public final String toString() {
        return "NoPublication";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeInt(1);
    }
}
