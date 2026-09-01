package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.squareup.wire.sjIw.ezwlgQm;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b04 implements d04 {
    public static final Parcelable.Creator<b04> CREATOR = new xkf(28);
    public final String a;

    public b04(String str) {
        str.getClass();
        this.a = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b04) && g76.L(this.a, ((b04) obj).a);
    }

    @Override // defpackage.d04
    public final String getId() {
        return this.a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a);
    }

    public final String toString() {
        return ev6.x(ezwlgQm.kuwtr, this.a, ")");
    }
}
