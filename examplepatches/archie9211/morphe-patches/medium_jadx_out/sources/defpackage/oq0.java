package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oq0 extends k2 {
    public static final Parcelable.Creator<oq0> CREATOR = new tfd(24);
    public final boolean a;
    public final String b;

    public oq0(boolean z, String str) {
        if (z) {
            vp7.p(str);
        }
        this.a = z;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof oq0)) {
            return false;
        }
        oq0 oq0Var = (oq0) obj;
        return this.a == oq0Var.a && en7.u(this.b, oq0Var.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Boolean.valueOf(this.a), this.b});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a ? 1 : 0);
        fo7.V(parcel, 2, this.b);
        fo7.d0(iC0, parcel);
    }
}
