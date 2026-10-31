package i20;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class c extends d {

    /* renamed from: b, reason: collision with root package name */
    public final String f61198b;

    /* renamed from: c, reason: collision with root package name */
    public final long f61199c;

    public c(String str, String str2, long j11) {
        super(str);
        this.f61198b = str2;
        this.f61199c = j11;
    }

    @Override // i20.d
    public final String b() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("accessToken", this.f61200a);
        jSONObject.put("refreshToken", this.f61198b);
        jSONObject.put("expiresOn", this.f61199c);
        return jSONObject.toString();
    }

    public final long c() {
        return this.f61199c;
    }

    public final String d() {
        return this.f61198b;
    }
}
