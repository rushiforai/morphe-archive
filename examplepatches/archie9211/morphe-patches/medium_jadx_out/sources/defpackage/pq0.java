package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import j$.util.Objects;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pq0 extends k2 {
    public static final Parcelable.Creator<pq0> CREATOR = new tfd(25);
    public final boolean a;
    public final byte[] b;
    public final String c;

    public pq0(boolean z, byte[] bArr, String str) {
        if (z) {
            vp7.p(bArr);
            vp7.p(str);
        }
        this.a = z;
        this.b = bArr;
        this.c = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pq0)) {
            return false;
        }
        pq0 pq0Var = (pq0) obj;
        return this.a == pq0Var.a && Arrays.equals(this.b, pq0Var.b) && Objects.equals(this.c, pq0Var.c);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.b) + (Objects.hash(Boolean.valueOf(this.a), this.c) * 31);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a ? 1 : 0);
        fo7.S(parcel, 2, this.b);
        fo7.V(parcel, 3, this.c);
        fo7.d0(iC0, parcel);
    }
}
