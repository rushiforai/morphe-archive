package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.io.IOException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ce0 implements Parcelable {
    public static final Parcelable.Creator<ce0> CREATOR = new xkf(4);
    public final String a;
    public final String b;
    public final ee0 c;
    public final de0 d;
    public final String e;

    public ce0(String str, String str2) {
        str2.getClass();
        hk7.C(str, "token");
        hk7.C(str2, "expectedNonce");
        boolean zO0 = false;
        List listP0 = muc.p0(str, new String[]{"."}, 0, 6);
        if (listP0.size() != 3) {
            ay0.e("Invalid IdToken string");
            throw null;
        }
        String str3 = (String) listP0.get(0);
        String str4 = (String) listP0.get(1);
        String str5 = (String) listP0.get(2);
        this.a = str;
        this.b = str2;
        ee0 ee0Var = new ee0(str3);
        this.c = ee0Var;
        this.d = new de0(str4, str2);
        try {
            String strB0 = op8.b0(ee0Var.c);
            if (strB0 != null) {
                zO0 = op8.o0(op8.a0(strB0), str3 + '.' + str4, str5);
            }
        } catch (IOException | InvalidKeySpecException unused) {
        }
        if (zO0) {
            this.e = str5;
        } else {
            ay0.e("Invalid Signature");
            throw null;
        }
    }

    public final JSONObject a() {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("token_string", this.a);
        jSONObject.put("expected_nonce", this.b);
        ee0 ee0Var = this.c;
        ee0Var.getClass();
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put("alg", ee0Var.a);
        jSONObject2.put("typ", ee0Var.b);
        jSONObject2.put("kid", ee0Var.c);
        jSONObject.put("header", jSONObject2);
        jSONObject.put("claims", this.d.a());
        jSONObject.put("signature", this.e);
        return jSONObject;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ce0)) {
            return false;
        }
        ce0 ce0Var = (ce0) obj;
        return g76.L(this.a, ce0Var.a) && g76.L(this.b, ce0Var.b) && g76.L(this.c, ce0Var.c) && g76.L(this.d, ce0Var.d) && g76.L(this.e, ce0Var.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + wgd.o(wgd.o(527, 31, this.a), 31, this.b)) * 31)) * 31);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a);
        parcel.writeString(this.b);
        parcel.writeParcelable(this.c, i);
        parcel.writeParcelable(this.d, i);
        parcel.writeString(this.e);
    }

    public ce0(Parcel parcel) {
        String string = parcel.readString();
        hk7.E(string, "token");
        this.a = string;
        String string2 = parcel.readString();
        hk7.E(string2, "expectedNonce");
        this.b = string2;
        Parcelable parcelable = parcel.readParcelable(ee0.class.getClassLoader());
        if (parcelable != null) {
            this.c = (ee0) parcelable;
            Parcelable parcelable2 = parcel.readParcelable(de0.class.getClassLoader());
            if (parcelable2 != null) {
                this.d = (de0) parcelable2;
                String string3 = parcel.readString();
                hk7.E(string3, "signature");
                this.e = string3;
                return;
            }
            ygf.f("Required value was null.");
            throw null;
        }
        ygf.f("Required value was null.");
        throw null;
    }
}
