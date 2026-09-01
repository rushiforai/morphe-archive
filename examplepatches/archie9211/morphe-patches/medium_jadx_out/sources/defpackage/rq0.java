package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rq0 extends k2 {
    public static final Parcelable.Creator<rq0> CREATOR = new tfd(20);
    public final qq0 a;
    public final nq0 b;
    public final String c;
    public final boolean d;
    public final int e;
    public final pq0 f;
    public final oq0 g;
    public final boolean h;

    public rq0(qq0 qq0Var, nq0 nq0Var, String str, boolean z, int i, pq0 pq0Var, oq0 oq0Var, boolean z2) {
        vp7.p(qq0Var);
        this.a = qq0Var;
        vp7.p(nq0Var);
        this.b = nq0Var;
        this.c = str;
        this.d = z;
        this.e = i;
        this.f = pq0Var == null ? new pq0(false, null, null) : pq0Var;
        this.g = oq0Var == null ? new oq0(false, null) : oq0Var;
        this.h = z2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof rq0)) {
            return false;
        }
        rq0 rq0Var = (rq0) obj;
        return en7.u(this.a, rq0Var.a) && en7.u(this.b, rq0Var.b) && en7.u(this.f, rq0Var.f) && en7.u(this.g, rq0Var.g) && en7.u(this.c, rq0Var.c) && this.d == rq0Var.d && this.e == rq0Var.e && this.h == rq0Var.h;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.f, this.g, this.c, Boolean.valueOf(this.d), Integer.valueOf(this.e), Boolean.valueOf(this.h)});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.U(parcel, 2, this.b, i);
        fo7.V(parcel, 3, this.c);
        fo7.a0(parcel, 4, 4);
        parcel.writeInt(this.d ? 1 : 0);
        fo7.a0(parcel, 5, 4);
        parcel.writeInt(this.e);
        fo7.U(parcel, 6, this.f, i);
        fo7.U(parcel, 7, this.g, i);
        fo7.a0(parcel, 8, 4);
        parcel.writeInt(this.h ? 1 : 0);
        fo7.d0(iC0, parcel);
    }
}
