package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ype extends k2 {
    public static final Parcelable.Creator<ype> CREATOR = new lvf(17);
    public final int a;
    public final short b;
    public final short c;

    public ype(int i, short s, short s2) {
        this.a = i;
        this.b = s;
        this.c = s2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ype)) {
            return false;
        }
        ype ypeVar = (ype) obj;
        return this.a == ypeVar.a && this.b == ypeVar.b && this.c == ypeVar.c;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.a), Short.valueOf(this.b), Short.valueOf(this.c)});
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
        fo7.d0(iC0, parcel);
    }
}
