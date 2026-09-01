package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ed5 extends zb0 {
    public static final Parcelable.Creator<ed5> CREATOR = new rkf(19);
    public final String a;

    public ed5(String str) {
        vp7.n(str);
        this.a = str;
    }

    @Override // defpackage.zb0
    public final String d() {
        return "github.com";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.d0(iC0, parcel);
    }
}
