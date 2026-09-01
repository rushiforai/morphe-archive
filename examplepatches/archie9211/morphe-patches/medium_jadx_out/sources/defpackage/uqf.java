package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uqf extends k2 {
    public static final Parcelable.Creator<uqf> CREATOR = new rkf(18);
    public final a6g a;
    public final a6g b;
    public final a6g c;
    public final int d;

    public uqf(a6g a6gVar, a6g a6gVar2, a6g a6gVar3, int i) {
        this.a = a6gVar;
        this.b = a6gVar2;
        this.c = a6gVar3;
        this.d = i;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof uqf)) {
            return false;
        }
        uqf uqfVar = (uqf) obj;
        return en7.u(this.a, uqfVar.a) && en7.u(this.b, uqfVar.b) && en7.u(this.c, uqfVar.c) && this.d == uqfVar.d;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.c, Integer.valueOf(this.d)});
    }

    public final String toString() {
        a6g a6gVar = this.a;
        String strU = op8.U(a6gVar == null ? null : a6gVar.t());
        a6g a6gVar2 = this.b;
        String strU2 = op8.U(a6gVar2 == null ? null : a6gVar2.t());
        a6g a6gVar3 = this.c;
        String strU3 = op8.U(a6gVar3 != null ? a6gVar3.t() : null);
        StringBuilder sbU = y30.u("HmacSecretExtension{coseKeyAgreement=", strU, ", saltEnc=", strU2, ", saltAuth=");
        sbU.append(strU3);
        sbU.append(", getPinUvAuthProtocol=");
        return ho2.H(sbU, this.d, "}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        a6g a6gVar = this.a;
        fo7.S(parcel, 1, a6gVar == null ? null : a6gVar.t());
        a6g a6gVar2 = this.b;
        fo7.S(parcel, 2, a6gVar2 == null ? null : a6gVar2.t());
        a6g a6gVar3 = this.c;
        fo7.S(parcel, 3, a6gVar3 != null ? a6gVar3.t() : null);
        fo7.a0(parcel, 4, 4);
        parcel.writeInt(this.d);
        fo7.d0(iC0, parcel);
    }
}
