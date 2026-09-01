package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import com.google.android.gms.internal.p000firebaseauthapi.zzzx;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hqd extends y48 {
    public static final Parcelable.Creator<hqd> CREATOR = new lvf(2);
    public final String a;
    public final String b;
    public final long c;
    public final crf d;

    public hqd(String str, String str2, long j, crf crfVar) {
        vp7.n(str);
        this.a = str;
        this.b = str2;
        this.c = j;
        vp7.q("totpInfo cannot be null.", crfVar);
        this.d = crfVar;
    }

    public static hqd g(JSONObject jSONObject) {
        if (!jSONObject.has("enrollmentTimestamp")) {
            ay0.e("An enrollment timestamp in seconds of UTC time since Unix epoch is required to build a TotpMultiFactorInfo instance.");
            return null;
        }
        long jOptLong = jSONObject.optLong("enrollmentTimestamp");
        if (jSONObject.opt("totpInfo") != null) {
            return new hqd(jSONObject.optString("uid"), jSONObject.optString("displayName"), jOptLong, new crf());
        }
        ay0.e("A totpInfo is required to build a TotpMultiFactorInfo instance.");
        return null;
    }

    @Override // defpackage.y48
    public final String d() {
        return "totp";
    }

    @Override // defpackage.y48
    public final JSONObject e() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.putOpt("factorIdKey", "totp");
            jSONObject.putOpt("uid", this.a);
            jSONObject.putOpt("displayName", this.b);
            jSONObject.putOpt("enrollmentTimestamp", Long.valueOf(this.c));
            jSONObject.putOpt("totpInfo", this.d);
            return jSONObject;
        } catch (JSONException e) {
            Log.d("TotpMultiFactorInfo", "Failed to jsonify this object");
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
        fo7.U(parcel, 4, this.d, i);
        fo7.d0(iC0, parcel);
    }
}
