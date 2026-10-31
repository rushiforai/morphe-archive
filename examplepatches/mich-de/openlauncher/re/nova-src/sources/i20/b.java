package i20;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class b extends d {
    public b(String str) {
        super(str);
    }

    @Override // i20.d
    public final String b() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("accessToken", this.f61200a);
        return jSONObject.toString();
    }
}
