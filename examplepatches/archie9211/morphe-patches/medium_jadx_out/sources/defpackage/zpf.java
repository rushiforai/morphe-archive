package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import com.google.android.gms.internal.p000firebaseauthapi.zzzx;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zpf extends k2 implements xnf {
    public static final Parcelable.Creator<zpf> CREATOR = new rkf(14);
    public String a;
    public String b;
    public Long c;
    public String d;
    public Long e;

    public zpf(String str, String str2, Long l) {
        this(str, str2, l, "Bearer", Long.valueOf(System.currentTimeMillis()));
    }

    public static zpf d(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            zpf zpfVar = new zpf();
            zpfVar.a = jSONObject.optString("refresh_token", null);
            zpfVar.b = jSONObject.optString("access_token", null);
            zpfVar.c = Long.valueOf(jSONObject.optLong("expires_in"));
            zpfVar.d = jSONObject.optString("token_type", null);
            zpfVar.e = Long.valueOf(jSONObject.optLong("issued_at"));
            return zpfVar;
        } catch (JSONException e) {
            Log.d("zpf", "Failed to read GetTokenResponse from JSONObject");
            throw new zzzx(e);
        }
    }

    @Override // defpackage.xnf
    public final xnf a(String str) throws zzabz {
        try {
            JSONObject jSONObject = new JSONObject(str);
            this.a = luc.a(jSONObject.optString("refresh_token"));
            this.b = luc.a(jSONObject.optString("access_token"));
            this.c = Long.valueOf(jSONObject.optLong("expires_in", 0L));
            this.d = luc.a(jSONObject.optString("token_type"));
            this.e = Long.valueOf(System.currentTimeMillis());
            return this;
        } catch (NullPointerException | JSONException e) {
            throw to7.B(e, "zpf", str);
        }
    }

    public final String e() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("refresh_token", this.a);
            jSONObject.put("access_token", this.b);
            jSONObject.put("expires_in", this.c);
            jSONObject.put("token_type", this.d);
            jSONObject.put("issued_at", this.e);
            return jSONObject.toString();
        } catch (JSONException e) {
            Log.d("zpf", "Failed to convert GetTokenResponse to JSON");
            throw new zzzx(e);
        }
    }

    public final boolean g() {
        return System.currentTimeMillis() + 300000 < (this.c.longValue() * 1000) + this.e.longValue();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 2, this.a);
        fo7.V(parcel, 3, this.b);
        Long l = this.c;
        long jLongValue = l == null ? 0L : l.longValue();
        fo7.a0(parcel, 4, 8);
        parcel.writeLong(jLongValue);
        fo7.V(parcel, 5, this.d);
        Long l2 = this.e;
        l2.getClass();
        fo7.a0(parcel, 6, 8);
        parcel.writeLong(l2.longValue());
        fo7.d0(iC0, parcel);
    }

    public zpf(String str, String str2, Long l, String str3, Long l2) {
        this.a = str;
        this.b = str2;
        this.c = l;
        this.d = str3;
        this.e = l2;
    }

    public zpf() {
        this.e = Long.valueOf(System.currentTimeMillis());
    }
}
