package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class le5 extends k2 {
    public static final Parcelable.Creator<le5> CREATOR = new rkf(10);
    public final boolean a;

    public le5(boolean z) {
        this.a = z;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof le5) && this.a == ((le5) obj).a;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Boolean.valueOf(this.a)});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a ? 1 : 0);
        fo7.d0(iC0, parcel);
    }
}
