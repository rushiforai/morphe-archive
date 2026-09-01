package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import com.google.android.gms.internal.p000firebaseauthapi.zzzx;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d99 extends y48 {
    public static final Parcelable.Creator<d99> CREATOR = new rkf(28);
    public final String a;
    public final String b;
    public final long c;
    public final String d;

    public d99(long j, String str, String str2, String str3) {
        vp7.n(str);
        this.a = str;
        this.b = str2;
        this.c = j;
        vp7.n(str3);
        this.d = str3;
    }

    public static d99 g(JSONObject jSONObject) {
        if (!jSONObject.has("enrollmentTimestamp")) {
            ay0.e("An enrollment timestamp in seconds of UTC time since Unix epoch is required to build a PhoneMultiFactorInfo instance.");
            return null;
        }
        return new d99(jSONObject.optLong("enrollmentTimestamp"), jSONObject.optString("uid"), jSONObject.optString("displayName"), jSONObject.optString("phoneNumber"));
    }

    @Override // defpackage.y48
    public final String d() {
        return "phone";
    }

    @Override // defpackage.y48
    public final JSONObject e() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.putOpt("factorIdKey", "phone");
            jSONObject.putOpt("uid", this.a);
            jSONObject.putOpt("displayName", this.b);
            jSONObject.putOpt("enrollmentTimestamp", Long.valueOf(this.c));
            jSONObject.putOpt("phoneNumber", this.d);
            return jSONObject;
        } catch (JSONException e) {
            Log.d("PhoneMultiFactorInfo", "Failed to jsonify this object");
            throw new zzzx(e);
        }
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.a0(parcel, 3, 8);
        parcel.writeLong(this.c);
        fo7.V(parcel, 4, this.d);
        fo7.d0(iC0, parcel);
    }
}
