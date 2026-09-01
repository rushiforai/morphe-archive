package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fag extends k2 {
    public static final Parcelable.Creator<fag> CREATOR = new r4g(4);
    public Bundle a;
    public da4[] b;
    public int c;
    public k42 d;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.R(parcel, 1, this.a);
        fo7.X(parcel, 2, this.b, i);
        int i2 = this.c;
        fo7.a0(parcel, 3, 4);
        parcel.writeInt(i2);
        fo7.U(parcel, 4, this.d, i);
        fo7.d0(iC0, parcel);
    }
}
