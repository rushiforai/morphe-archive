package defpackage;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j59 {
    public final String a;
    public final int b;
    public final int c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final int h;

    public j59(JSONObject jSONObject) throws JSONException {
        String string = jSONObject.getString("class_name");
        string.getClass();
        this.a = string;
        this.b = jSONObject.optInt("index", -1);
        this.c = jSONObject.optInt("id");
        String strOptString = jSONObject.optString("text");
        strOptString.getClass();
        this.d = strOptString;
        String strOptString2 = jSONObject.optString("tag");
        strOptString2.getClass();
        this.e = strOptString2;
        String strOptString3 = jSONObject.optString("description");
        strOptString3.getClass();
        this.f = strOptString3;
        String strOptString4 = jSONObject.optString("hint");
        strOptString4.getClass();
        this.g = strOptString4;
        this.h = jSONObject.optInt("match_bitmask");
    }
}
