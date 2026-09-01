package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sig extends k2 {
    public static final Parcelable.Creator<sig> CREATOR = new r4g(11);
    public final long a;
    public final a6g b;
    public final a6g c;
    public final a6g d;

    public sig(long j, byte[] bArr, byte[] bArr2, byte[] bArr3) {
        vp7.p(bArr);
        a6g a6gVarS = a6g.s(bArr.length, bArr);
        vp7.p(bArr2);
        a6g a6gVarS2 = a6g.s(bArr2.length, bArr2);
        vp7.p(bArr3);
        a6g a6gVarS3 = a6g.s(bArr3.length, bArr3);
        this.a = j;
        this.b = a6gVarS;
        this.c = a6gVarS2;
        this.d = a6gVarS3;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof sig)) {
            return false;
        }
        sig sigVar = (sig) obj;
        return this.a == sigVar.a && en7.u(this.b, sigVar.b) && en7.u(this.c, sigVar.c) && en7.u(this.d, sigVar.d);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Long.valueOf(this.a), this.b, this.c, this.d});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 8);
        parcel.writeLong(this.a);
        fo7.S(parcel, 2, this.b.t());
        fo7.S(parcel, 3, this.c.t());
        fo7.S(parcel, 4, this.d.t());
        fo7.d0(iC0, parcel);
    }
}
