package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rif extends k2 {
    public static final Parcelable.Creator<rif> CREATOR = new tfd(12);
    public final int a;
    public final String b;
    public final long c;
    public final int d;
    public final boolean e;

    public rif(int i, String str, long j, int i2, boolean z) {
        this.a = i;
        this.b = str;
        this.c = j;
        this.d = i2;
        this.e = z;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a);
        fo7.V(parcel, 2, this.b);
        fo7.a0(parcel, 3, 8);
        parcel.writeLong(this.c);
        fo7.a0(parcel, 4, 4);
        parcel.writeInt(this.d);
        fo7.a0(parcel, 5, 4);
        parcel.writeInt(this.e ? 1 : 0);
        fo7.d0(iC0, parcel);
    }
}
