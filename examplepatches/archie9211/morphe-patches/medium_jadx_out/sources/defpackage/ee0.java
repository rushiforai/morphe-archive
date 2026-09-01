package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import java.nio.charset.Charset;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ee0 implements Parcelable {
    public static final Parcelable.Creator<ee0> CREATOR = new xkf(6);
    public final String a;
    public final String b;
    public final String c;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ee0)) {
            return false;
        }
        ee0 ee0Var = (ee0) obj;
        return g76.L(this.a, ee0Var.a) && g76.L(this.b, ee0Var.b) && g76.L(this.c, ee0Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(wgd.o(527, 31, this.a), 31, this.b);
    }

    public final String toString() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("alg", this.a);
        jSONObject.put("typ", this.b);
        jSONObject.put("kid", this.c);
        String string = jSONObject.toString();
        string.getClass();
        return string;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a);
        parcel.writeString(this.b);
        parcel.writeString(this.c);
    }

    public ee0(String str) throws JSONException {
        str.getClass();
        hk7.C(str, JWcjNoweKCnTr.SWDWBjYP);
        byte[] bArrDecode = Base64.decode(str, 0);
        bArrDecode.getClass();
        Charset charset = wk1.a;
        try {
            JSONObject jSONObject = new JSONObject(new String(bArrDecode, charset));
            String strOptString = jSONObject.optString("alg");
            strOptString.getClass();
            boolean z = strOptString.length() > 0 && strOptString.equals("RS256");
            String strOptString2 = jSONObject.optString("kid");
            strOptString2.getClass();
            boolean z2 = strOptString2.length() > 0;
            String strOptString3 = jSONObject.optString("typ");
            strOptString3.getClass();
            boolean z3 = strOptString3.length() > 0;
            if (z && z2 && z3) {
                byte[] bArrDecode2 = Base64.decode(str, 0);
                bArrDecode2.getClass();
                JSONObject jSONObject2 = new JSONObject(new String(bArrDecode2, charset));
                String string = jSONObject2.getString("alg");
                string.getClass();
                this.a = string;
                String string2 = jSONObject2.getString("typ");
                string2.getClass();
                this.b = string2;
                String string3 = jSONObject2.getString("kid");
                string3.getClass();
                this.c = string3;
                return;
            }
        } catch (JSONException unused) {
        }
        ay0.e("Invalid Header");
        throw null;
    }

    public ee0(Parcel parcel) {
        String string = parcel.readString();
        hk7.E(string, "alg");
        this.a = string;
        String string2 = parcel.readString();
        hk7.E(string2, "typ");
        this.b = string2;
        String string3 = parcel.readString();
        hk7.E(string3, "kid");
        this.c = string3;
    }
}
