package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ge0 extends zb0 {
    public static final Parcelable.Creator<ge0> CREATOR = new r4g(5);
    public final a6g a;
    public final a6g b;
    public final a6g c;
    public final String[] d;

    public ge0(byte[] bArr, byte[] bArr2, byte[] bArr3, String[] strArr) {
        vp7.p(bArr);
        a6g a6gVarS = a6g.s(bArr.length, bArr);
        vp7.p(bArr2);
        a6g a6gVarS2 = a6g.s(bArr2.length, bArr2);
        vp7.p(bArr3);
        a6g a6gVarS3 = a6g.s(bArr3.length, bArr3);
        this.a = a6gVarS;
        this.b = a6gVarS2;
        this.c = a6gVarS3;
        vp7.p(strArr);
        this.d = strArr;
    }

    /* JADX WARN: Removed duplicated region for block: B:79:0x0225 A[Catch: JSONException -> 0x01b3, TRY_LEAVE, TryCatch #10 {JSONException -> 0x01b3, blocks: (B:77:0x0211, B:79:0x0225, B:47:0x0160, B:50:0x017c, B:52:0x0191, B:54:0x0196, B:59:0x01b9, B:60:0x01be, B:61:0x01bf, B:62:0x01c6, B:86:0x023e, B:87:0x0245, B:67:0x01d3, B:69:0x01e0, B:71:0x01ed, B:72:0x0203, B:73:0x0208, B:74:0x0209, B:75:0x020e, B:84:0x0238, B:85:0x023d, B:88:0x0246, B:89:0x024e, B:92:0x0252, B:103:0x0261, B:104:0x0268, B:96:0x0258, B:108:0x026f, B:109:0x0276, B:111:0x0278, B:112:0x027f, B:116:0x0286, B:117:0x028d, B:119:0x028f, B:120:0x0296, B:125:0x029d, B:126:0x02a4), top: B:147:0x0056 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final org.json.JSONObject e() {
        /*
            Method dump skipped, instruction units count: 683
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ge0.e():org.json.JSONObject");
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ge0)) {
            return false;
        }
        ge0 ge0Var = (ge0) obj;
        return en7.u(this.a, ge0Var.a) && en7.u(this.b, ge0Var.b) && en7.u(this.c, ge0Var.c);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(Arrays.hashCode(new Object[]{this.a})), Integer.valueOf(Arrays.hashCode(new Object[]{this.b})), Integer.valueOf(Arrays.hashCode(new Object[]{this.c}))});
    }

    public final String toString() {
        vwa vwaVar = new vwa(getClass().getSimpleName(), 24);
        z4g z4gVar = f5g.d;
        byte[] bArrT = this.a.t();
        vwaVar.K("keyHandle", z4gVar.c(bArrT.length, bArrT));
        byte[] bArrT2 = this.b.t();
        vwaVar.K("clientDataJSON", z4gVar.c(bArrT2.length, bArrT2));
        byte[] bArrT3 = this.c.t();
        vwaVar.K("attestationObject", z4gVar.c(bArrT3.length, bArrT3));
        vwaVar.K("transports", Arrays.toString(this.d));
        return vwaVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.S(parcel, 2, this.a.t());
        fo7.S(parcel, 3, this.b.t());
        fo7.S(parcel, 4, this.c.t());
        String[] strArr = this.d;
        if (strArr != null) {
            int iC02 = fo7.c0(5, parcel);
            parcel.writeStringArray(strArr);
            fo7.d0(iC02, parcel);
        }
        fo7.d0(iC0, parcel);
    }
}
