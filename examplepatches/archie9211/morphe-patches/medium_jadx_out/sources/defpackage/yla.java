package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.postpublishing.ui.PublicationSelection;
import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yla implements PublicationSelection {
    public static final Parcelable.Creator<yla> CREATOR = new f08(14);
    public final PublicationData a;

    public yla(PublicationData publicationData) {
        publicationData.getClass();
        this.a = publicationData;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof yla) && g76.L(this.a, ((yla) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Publication(publicationData=" + this.a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        this.a.writeToParcel(parcel, i);
    }
}
