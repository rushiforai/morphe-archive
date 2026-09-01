package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x9a extends k2 {
    public static final Parcelable.Creator<x9a> CREATOR = new rkf(24);
    public final String a;
    public final String b;
    public final a6g c;
    public final ge0 d;
    public final fe0 e;
    public final he0 f;
    public final ae0 g;
    public final String h;

    public x9a(String str, String str2, byte[] bArr, ge0 ge0Var, fe0 fe0Var, he0 he0Var, ae0 ae0Var, String str3) {
        a6g a6gVarS = bArr == null ? null : a6g.s(bArr.length, bArr);
        boolean z = false;
        vp7.k("Must provide a response object.", (ge0Var != null && fe0Var == null && he0Var == null) || (ge0Var == null && fe0Var != null && he0Var == null) || (ge0Var == null && fe0Var == null && he0Var != null));
        if (he0Var != null || (str != null && a6gVarS != null)) {
            z = true;
        }
        vp7.k("Must provide id and rawId if not an error response.", z);
        this.a = str;
        this.b = str2;
        this.c = a6gVarS;
        this.d = ge0Var;
        this.e = fe0Var;
        this.f = he0Var;
        this.g = ae0Var;
        this.h = str3;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof x9a)) {
            return false;
        }
        x9a x9aVar = (x9a) obj;
        return en7.u(this.a, x9aVar.a) && en7.u(this.b, x9aVar.b) && en7.u(this.c, x9aVar.c) && en7.u(this.d, x9aVar.d) && en7.u(this.e, x9aVar.e) && en7.u(this.f, x9aVar.f) && en7.u(this.g, x9aVar.g) && en7.u(this.h, x9aVar.h);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.c, this.e, this.d, this.f, this.g, this.h});
    }

    public final String toString() {
        a6g a6gVar = this.c;
        String strU = op8.U(a6gVar == null ? null : a6gVar.t());
        String strValueOf = String.valueOf(this.d);
        String strValueOf2 = String.valueOf(this.e);
        String strValueOf3 = String.valueOf(this.f);
        String strValueOf4 = String.valueOf(this.g);
        StringBuilder sbU = y30.u("PublicKeyCredential{\n id='", this.a, "', \n type='", this.b, "', \n rawId=");
        ka1.C(sbU, strU, ", \n registerResponse=", strValueOf, ", \n signResponse=");
        ka1.C(sbU, strValueOf2, ", \n errorResponse=", strValueOf3, ", \n extensionsClientOutputs=");
        return km4.C(sbU, strValueOf4, ", \n authenticatorAttachment='", this.h, "'}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        o8g.a.a();
        throw null;
    }
}
