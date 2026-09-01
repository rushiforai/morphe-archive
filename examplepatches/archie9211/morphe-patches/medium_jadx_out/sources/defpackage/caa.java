package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class caa extends k2 {
    public static final Parcelable.Creator<caa> CREATOR = new lvf(0);
    public final String a;
    public final String b;
    public final String c;

    public caa(String str, String str2, String str3) {
        vp7.p(str);
        this.a = str;
        vp7.p(str2);
        this.b = str2;
        this.c = str3;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof caa)) {
            return false;
        }
        caa caaVar = (caa) obj;
        return en7.u(this.a, caaVar.a) && en7.u(this.b, caaVar.b) && en7.u(this.c, caaVar.c);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.c});
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("PublicKeyCredentialRpEntity{\n id='");
        sb.append(this.a);
        sb.append("', \n name='");
        sb.append(this.b);
        sb.append("', \n icon='");
        return ka1.v(sb, this.c, "'}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 2, this.a);
        fo7.V(parcel, 3, this.b);
        fo7.V(parcel, 4, this.c);
        fo7.d0(iC0, parcel);
    }
}
