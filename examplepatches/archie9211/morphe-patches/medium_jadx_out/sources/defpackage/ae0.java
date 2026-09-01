package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ae0 extends k2 {
    public static final Parcelable.Creator<ae0> CREATOR = new lvf(20);
    public final xpe a;
    public final o3g b;
    public final be0 c;
    public final i6g d;
    public final String e;

    public ae0(xpe xpeVar, o3g o3gVar, be0 be0Var, i6g i6gVar, String str) {
        this.a = xpeVar;
        this.b = o3gVar;
        this.c = be0Var;
        this.d = i6gVar;
        this.e = str;
    }

    public final JSONObject d() {
        try {
            JSONObject jSONObject = new JSONObject();
            be0 be0Var = this.c;
            if (be0Var != null) {
                try {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("rk", be0Var.a);
                    jSONObject.put("credProps", jSONObject2);
                } catch (JSONException e) {
                    throw new RuntimeException("Error encoding AuthenticationExtensionsCredPropsOutputs to JSON object", e);
                }
            }
            xpe xpeVar = this.a;
            if (xpeVar != null) {
                jSONObject.put("uvm", xpeVar.d());
            }
            i6g i6gVar = this.d;
            if (i6gVar != null) {
                jSONObject.put("prf", i6gVar.d());
            }
            String str = this.e;
            if (str != null) {
                jSONObject.put("txAuthSimple", str);
            }
            return jSONObject;
        } catch (JSONException e2) {
            lg8.p("Error encoding AuthenticationExtensionsClientOutputs to JSON object", e2);
            return null;
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ae0)) {
            return false;
        }
        ae0 ae0Var = (ae0) obj;
        return en7.u(this.a, ae0Var.a) && en7.u(this.b, ae0Var.b) && en7.u(this.c, ae0Var.c) && en7.u(this.d, ae0Var.d) && en7.u(this.e, ae0Var.e);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.c, this.d, this.e});
    }

    public final String toString() {
        return ev6.x("AuthenticationExtensionsClientOutputs{", d().toString(), "}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.U(parcel, 2, this.b, i);
        fo7.U(parcel, 3, this.c, i);
        fo7.U(parcel, 4, this.d, i);
        fo7.V(parcel, 5, this.e);
        fo7.d0(iC0, parcel);
    }
}
