package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e08 extends k2 {
    public static final Parcelable.Creator<e08> CREATOR = new tfd(16);
    public final int a;
    public final int b;
    public final int c;
    public final long d;
    public final long e;
    public final String f;
    public final String g;
    public final int h;
    public final int i;

    public e08(int i, int i2, int i3, long j, long j2, String str, String str2, int i4, int i5) {
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = j;
        this.e = j2;
        this.f = str;
        this.g = str2;
        this.h = i4;
        this.i = i5;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a);
        fo7.a0(parcel, 2, 4);
        parcel.writeInt(this.b);
        fo7.a0(parcel, 3, 4);
        parcel.writeInt(this.c);
        fo7.a0(parcel, 4, 8);
        parcel.writeLong(this.d);
        fo7.a0(parcel, 5, 8);
        parcel.writeLong(this.e);
        fo7.V(parcel, 6, this.f);
        fo7.V(parcel, 7, this.g);
        fo7.a0(parcel, 8, 4);
        parcel.writeInt(this.h);
        fo7.a0(parcel, 9, 4);
        parcel.writeInt(this.i);
        fo7.d0(iC0, parcel);
    }
}
