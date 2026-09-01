package defpackage;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.internal.p000firebaseauthapi.zzzx;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ivg extends k2 implements yae {
    public static final Parcelable.Creator<ivg> CREATOR = new rkf(8);
    public String a;
    public String b;
    public String c;
    public String d;
    public String e;
    public String f;
    public boolean g;
    public String h;

    public ivg(String str, String str2, String str3, String str4, String str5, String str6, boolean z, String str7) {
        this.a = str;
        this.b = str2;
        this.e = str3;
        this.f = str4;
        this.c = str5;
        this.d = str6;
        if (!TextUtils.isEmpty(str6)) {
            Uri.parse(str6);
        }
        this.g = z;
        this.h = str7;
    }

    public static ivg d(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            return new ivg(jSONObject.optString("userId"), jSONObject.optString("providerId"), jSONObject.optString("email"), jSONObject.optString("phoneNumber"), jSONObject.optString("displayName"), jSONObject.optString("photoUrl"), jSONObject.optBoolean("isEmailVerified"), jSONObject.optString("rawUserInfo"));
        } catch (JSONException e) {
            Log.d("DefaultAuthUserInfo", "Failed to unpack UserInfo from JSON");
            throw new zzzx(e);
        }
    }

    @Override // defpackage.yae
    public final String b() {
        return this.b;
    }

    public final String e() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.putOpt("userId", this.a);
            jSONObject.putOpt("providerId", this.b);
            jSONObject.putOpt("displayName", this.c);
            jSONObject.putOpt("photoUrl", this.d);
            jSONObject.putOpt("email", this.e);
            jSONObject.putOpt("phoneNumber", this.f);
            jSONObject.putOpt("isEmailVerified", Boolean.valueOf(this.g));
            jSONObject.putOpt("rawUserInfo", this.h);
            return jSONObject.toString();
        } catch (JSONException e) {
            Log.d("DefaultAuthUserInfo", "Failed to jsonify this object");
            throw new zzzx(e);
        }
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.V(parcel, 3, this.c);
        fo7.V(parcel, 4, this.d);
        fo7.V(parcel, 5, this.e);
        fo7.V(parcel, 6, this.f);
        boolean z = this.g;
        fo7.a0(parcel, 7, 4);
        parcel.writeInt(z ? 1 : 0);
        fo7.V(parcel, 8, this.h);
        fo7.d0(iC0, parcel);
    }
}
