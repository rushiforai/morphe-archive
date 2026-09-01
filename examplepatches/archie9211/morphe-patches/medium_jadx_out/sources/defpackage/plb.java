package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class plb extends k2 {
    public static final Parcelable.Creator<plb> CREATOR = new rkf(12);
    public final int a;
    public final boolean b;
    public final boolean c;
    public final int d;
    public final int e;

    public plb(int i, boolean z, boolean z2, int i2, int i3) {
        this.a = i;
        this.b = z;
        this.c = z2;
        this.d = i2;
        this.e = i3;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a);
        fo7.a0(parcel, 2, 4);
        parcel.writeInt(this.b ? 1 : 0);
        fo7.a0(parcel, 3, 4);
        parcel.writeInt(this.c ? 1 : 0);
        fo7.a0(parcel, 4, 4);
        parcel.writeInt(this.d);
        fo7.a0(parcel, 5, 4);
        parcel.writeInt(this.e);
        fo7.d0(iC0, parcel);
    }
}
