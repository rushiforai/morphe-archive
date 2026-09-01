package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eaa extends k2 {
    public static final Parcelable.Creator<eaa> CREATOR = new lvf(3);
    public final a6g a;
    public final String b;
    public final String c;
    public final String d;

    public eaa(byte[] bArr, String str, String str2, String str3) {
        vp7.p(bArr);
        this.a = a6g.s(bArr.length, bArr);
        vp7.p(str);
        this.b = str;
        this.c = str2;
        vp7.p(str3);
        this.d = str3;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof eaa)) {
            return false;
        }
        eaa eaaVar = (eaa) obj;
        return en7.u(this.a, eaaVar.a) && en7.u(this.b, eaaVar.b) && en7.u(this.c, eaaVar.c) && en7.u(this.d, eaaVar.d);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.c, this.d});
    }

    public final String toString() {
        StringBuilder sbU = lv8.u("PublicKeyCredentialUserEntity{\n id=", op8.U(this.a.t()), ", \n name='");
        sbU.append(this.b);
        sbU.append("', \n icon='");
        sbU.append(this.c);
        sbU.append("', \n displayName='");
        return ka1.v(sbU, this.d, "'}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.S(parcel, 2, this.a.t());
        fo7.V(parcel, 3, this.b);
        fo7.V(parcel, 4, this.c);
        fo7.V(parcel, 5, this.d);
        fo7.d0(iC0, parcel);
    }
}
