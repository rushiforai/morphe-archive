package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class da4 extends k2 {
    public static final Parcelable.Creator<da4> CREATOR = new lvf(11);
    public final String a;
    public final int b;
    public final long c;
    public final boolean d;

    public da4(int i, long j, String str, boolean z) {
        this.a = str;
        this.b = i;
        this.c = j;
        this.d = z;
    }

    public final long d() {
        long j = this.c;
        return j == -1 ? this.b : j;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof da4) {
            da4 da4Var = (da4) obj;
            if (en7.u(this.a, da4Var.a) && d() == da4Var.d() && this.d == da4Var.d) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, Long.valueOf(d()), Boolean.valueOf(this.d)});
    }

    public final String toString() {
        hx4 hx4Var = new hx4(this);
        hx4Var.a("name", this.a);
        hx4Var.a("version", Long.valueOf(d()));
        hx4Var.a("is_fully_rolled_out", Boolean.valueOf(this.d));
        return hx4Var.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.a0(parcel, 2, 4);
        parcel.writeInt(this.b);
        long jD = d();
        fo7.a0(parcel, 3, 8);
        parcel.writeLong(jD);
        fo7.a0(parcel, 4, 4);
        parcel.writeInt(this.d ? 1 : 0);
        fo7.d0(iC0, parcel);
    }

    public da4(String str, long j) {
        this(-1, j, str, false);
    }
}
