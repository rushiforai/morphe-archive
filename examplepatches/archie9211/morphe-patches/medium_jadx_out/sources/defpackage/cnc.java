package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cnc implements Parcelable {
    public static final Parcelable.Creator<cnc> CREATOR = new f08(28);
    public int a;
    public int b;
    public int c;
    public int[] d;
    public int e;
    public int[] f;
    public ArrayList g;
    public boolean h;
    public boolean i;
    public boolean j;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.a);
        parcel.writeInt(this.b);
        parcel.writeInt(this.c);
        if (this.c > 0) {
            parcel.writeIntArray(this.d);
        }
        parcel.writeInt(this.e);
        if (this.e > 0) {
            parcel.writeIntArray(this.f);
        }
        parcel.writeInt(this.h ? 1 : 0);
        parcel.writeInt(this.i ? 1 : 0);
        parcel.writeInt(this.j ? 1 : 0);
        parcel.writeList(this.g);
    }
}
