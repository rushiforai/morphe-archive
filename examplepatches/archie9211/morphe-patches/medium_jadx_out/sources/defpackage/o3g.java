package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o3g extends k2 {
    public static final Parcelable.Creator<o3g> CREATOR = new r4g(0);
    public final a6g a;
    public final a6g b;

    public o3g(a6g a6gVar, a6g a6gVar2) {
        this.a = a6gVar;
        this.b = a6gVar2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof o3g)) {
            return false;
        }
        o3g o3gVar = (o3g) obj;
        return en7.u(this.a, o3gVar.a) && en7.u(this.b, o3gVar.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        a6g a6gVar = this.a;
        fo7.S(parcel, 1, a6gVar == null ? null : a6gVar.t());
        a6g a6gVar2 = this.b;
        fo7.S(parcel, 2, a6gVar2 != null ? a6gVar2.t() : null);
        fo7.d0(iC0, parcel);
    }
}
