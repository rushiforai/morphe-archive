package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.PublicKeyCredentialType$UnsupportedPublicKeyCredTypeException;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aaa extends k2 {
    public static final Parcelable.Creator<aaa> CREATOR;
    public final daa a;
    public final a6g b;
    public final List c;

    static {
        fyf.y(2, k50.f, k50.g);
        CREATOR = new rkf(26);
    }

    public aaa(String str, byte[] bArr, List list) {
        a6g a6gVar = a6g.c;
        a6g a6gVarS = a6g.s(bArr.length, bArr);
        vp7.p(str);
        try {
            this.a = daa.fromString(str);
            this.b = a6gVarS;
            this.c = list;
        } catch (PublicKeyCredentialType$UnsupportedPublicKeyCredTypeException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof aaa)) {
            return false;
        }
        aaa aaaVar = (aaa) obj;
        List list = aaaVar.c;
        if (!this.a.equals(aaaVar.a) || !en7.u(this.b, aaaVar.b)) {
            return false;
        }
        List list2 = this.c;
        if (list2 == null && list == null) {
            return true;
        }
        return list2 != null && list != null && list2.containsAll(list) && list.containsAll(list2);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.c});
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.a);
        String strU = op8.U(this.b.t());
        return ka1.v(y30.u("PublicKeyCredentialDescriptor{\n type=", strValueOf, ", \n id=", strU, ", \n transports="), String.valueOf(this.c), "}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 2, this.a.toString());
        fo7.S(parcel, 3, this.b.t());
        fo7.Y(parcel, 4, this.c);
        fo7.d0(iC0, parcel);
    }
}
