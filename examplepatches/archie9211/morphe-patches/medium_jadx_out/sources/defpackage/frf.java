package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class frf extends k2 implements vnf {
    public static final Parcelable.Creator<frf> CREATOR = new rkf(17);
    public String b;
    public String c;
    public String d;
    public String e;
    public String f;
    public String g;
    public String h;
    public boolean j;
    public String k;
    public String l;
    public String m;
    public String n;
    public boolean o;
    public String p;
    public String a = "http://localhost";
    public boolean i = true;

    public frf(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8) {
        this.c = str;
        this.d = str2;
        this.h = str4;
        this.k = str5;
        this.n = str6;
        this.p = str7;
        if (TextUtils.isEmpty(str) && TextUtils.isEmpty(str2) && TextUtils.isEmpty(str5)) {
            ay0.e("idToken, accessToken and authCode cannot all be null");
            throw null;
        }
        vp7.n(str3);
        this.e = str3;
        this.f = null;
        StringBuilder sb = new StringBuilder();
        if (!TextUtils.isEmpty(str)) {
            sb.append("id_token=");
            sb.append(str);
            sb.append("&");
        }
        if (!TextUtils.isEmpty(str2)) {
            sb.append("access_token=");
            sb.append(str2);
            sb.append("&");
        }
        if (!TextUtils.isEmpty(null)) {
            sb.append("identifier=null&");
        }
        if (!TextUtils.isEmpty(str4)) {
            sb.append("oauth_token_secret=");
            sb.append(str4);
            sb.append("&");
        }
        if (!TextUtils.isEmpty(str5)) {
            sb.append("code=");
            sb.append(str5);
            sb.append("&");
        }
        if (!TextUtils.isEmpty(str8)) {
            sb.append("nonce=");
            sb.append(str8);
            sb.append("&");
        }
        this.g = ka1.v(sb, "providerId=", str3);
        this.j = true;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 2, this.a);
        fo7.V(parcel, 3, this.b);
        fo7.V(parcel, 4, this.c);
        fo7.V(parcel, 5, this.d);
        fo7.V(parcel, 6, this.e);
        fo7.V(parcel, 7, this.f);
        fo7.V(parcel, 8, this.g);
        fo7.V(parcel, 9, this.h);
        boolean z = this.i;
        fo7.a0(parcel, 10, 4);
        parcel.writeInt(z ? 1 : 0);
        boolean z2 = this.j;
        fo7.a0(parcel, 11, 4);
        parcel.writeInt(z2 ? 1 : 0);
        fo7.V(parcel, 12, this.k);
        fo7.V(parcel, 13, this.l);
        fo7.V(parcel, 14, this.m);
        fo7.V(parcel, 15, this.n);
        boolean z3 = this.o;
        fo7.a0(parcel, 16, 4);
        parcel.writeInt(z3 ? 1 : 0);
        fo7.V(parcel, 17, this.p);
        fo7.d0(iC0, parcel);
    }

    @Override // defpackage.vnf
    public final String zza() throws JSONException {
        String str = this.m;
        String str2 = this.l;
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("autoCreate", this.j);
        jSONObject.put("returnSecureToken", this.i);
        String str3 = this.b;
        if (str3 != null) {
            jSONObject.put("idToken", str3);
        }
        String str4 = this.g;
        if (str4 != null) {
            jSONObject.put("postBody", str4);
        }
        String str5 = this.n;
        if (str5 != null) {
            jSONObject.put("tenantId", str5);
        }
        String str6 = this.p;
        if (str6 != null) {
            jSONObject.put("pendingToken", str6);
        }
        if (!TextUtils.isEmpty(str2)) {
            jSONObject.put("sessionId", str2);
        }
        if (TextUtils.isEmpty(str)) {
            String str7 = this.a;
            if (str7 != null) {
                jSONObject.put("requestUri", str7);
            }
        } else {
            jSONObject.put("requestUri", str);
        }
        jSONObject.put("returnIdpCredential", this.o);
        return jSONObject.toString();
    }
}
