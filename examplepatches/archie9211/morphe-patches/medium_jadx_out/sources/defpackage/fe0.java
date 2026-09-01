package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.admin.stagebranch.uG.peNPu;
import java.util.Arrays;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class fe0 extends zb0 {
    public static final Parcelable.Creator<fe0> CREATOR = new r4g(3);
    public final a6g a;
    public final a6g b;
    public final a6g c;
    public final a6g d;
    public final a6g e;

    public fe0(byte[] bArr, byte[] bArr2, byte[] bArr3, byte[] bArr4, byte[] bArr5) {
        vp7.p(bArr);
        a6g a6gVarS = a6g.s(bArr.length, bArr);
        vp7.p(bArr2);
        a6g a6gVarS2 = a6g.s(bArr2.length, bArr2);
        vp7.p(bArr3);
        a6g a6gVarS3 = a6g.s(bArr3.length, bArr3);
        vp7.p(bArr4);
        a6g a6gVarS4 = a6g.s(bArr4.length, bArr4);
        a6g a6gVarS5 = bArr5 == null ? null : a6g.s(bArr5.length, bArr5);
        this.a = a6gVarS;
        this.b = a6gVarS2;
        this.c = a6gVarS3;
        this.d = a6gVarS4;
        this.e = a6gVarS5;
    }

    public final JSONObject e() {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("clientDataJSON", op8.U(this.b.t()));
            jSONObject.put("authenticatorData", op8.U(this.c.t()));
            jSONObject.put("signature", op8.U(this.d.t()));
            a6g a6gVar = this.e;
            if (a6gVar == null) {
                return jSONObject;
            }
            jSONObject.put("userHandle", op8.U(a6gVar == null ? null : a6gVar.t()));
            return jSONObject;
        } catch (JSONException e) {
            lg8.p("Error encoding AuthenticatorAssertionResponse to JSON object", e);
            return null;
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof fe0)) {
            return false;
        }
        fe0 fe0Var = (fe0) obj;
        return en7.u(this.a, fe0Var.a) && en7.u(this.b, fe0Var.b) && en7.u(this.c, fe0Var.c) && en7.u(this.d, fe0Var.d) && en7.u(this.e, fe0Var.e);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(Arrays.hashCode(new Object[]{this.a})), Integer.valueOf(Arrays.hashCode(new Object[]{this.b})), Integer.valueOf(Arrays.hashCode(new Object[]{this.c})), Integer.valueOf(Arrays.hashCode(new Object[]{this.d})), Integer.valueOf(Arrays.hashCode(new Object[]{this.e}))});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.S(parcel, 2, this.a.t());
        fo7.S(parcel, 3, this.b.t());
        fo7.S(parcel, 4, this.c.t());
        fo7.S(parcel, 5, this.d.t());
        a6g a6gVar = this.e;
        fo7.S(parcel, 6, a6gVar == null ? null : a6gVar.t());
        fo7.d0(iC0, parcel);
    }

    public final String toString() {
        byte[] bArrT;
        vwa vwaVar = new vwa(getClass().getSimpleName(), 24);
        z4g z4gVar = f5g.d;
        byte[] bArrT2 = this.a.t();
        vwaVar.K(peNPu.aBXGXeEKLzSD, z4gVar.c(bArrT2.length, bArrT2));
        byte[] bArrT3 = this.b.t();
        vwaVar.K("clientDataJSON", z4gVar.c(bArrT3.length, bArrT3));
        byte[] bArrT4 = this.c.t();
        vwaVar.K("authenticatorData", z4gVar.c(bArrT4.length, bArrT4));
        byte[] bArrT5 = this.d.t();
        vwaVar.K("signature", z4gVar.c(bArrT5.length, bArrT5));
        a6g a6gVar = this.e;
        if (a6gVar == null) {
            bArrT = null;
        } else {
            bArrT = a6gVar.t();
        }
        if (bArrT != null) {
            vwaVar.K("userHandle", z4gVar.c(bArrT.length, bArrT));
        }
        return vwaVar.toString();
    }
}
