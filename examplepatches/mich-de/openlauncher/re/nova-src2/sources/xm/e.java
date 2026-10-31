package xm;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: h, reason: collision with root package name */
    public static final Date f96108h = new Date(0);

    /* renamed from: a, reason: collision with root package name */
    public final JSONObject f96109a;

    /* renamed from: b, reason: collision with root package name */
    public final JSONObject f96110b;

    /* renamed from: c, reason: collision with root package name */
    public final Date f96111c;

    /* renamed from: d, reason: collision with root package name */
    public final JSONArray f96112d;

    /* renamed from: e, reason: collision with root package name */
    public final JSONObject f96113e;

    /* renamed from: f, reason: collision with root package name */
    public final long f96114f;

    /* renamed from: g, reason: collision with root package name */
    public final JSONArray f96115g;

    public e(JSONObject jSONObject, Date date, JSONArray jSONArray, JSONObject jSONObject2, long j11, JSONArray jSONArray2) throws JSONException {
        JSONObject jSONObject3 = new JSONObject();
        jSONObject3.put("configs_key", jSONObject);
        jSONObject3.put("fetch_time_key", date.getTime());
        jSONObject3.put("abt_experiments_key", jSONArray);
        jSONObject3.put("personalization_metadata_key", jSONObject2);
        jSONObject3.put("template_version_number_key", j11);
        jSONObject3.put("rollout_metadata_key", jSONArray2);
        this.f96110b = jSONObject;
        this.f96111c = date;
        this.f96112d = jSONArray;
        this.f96113e = jSONObject2;
        this.f96114f = j11;
        this.f96115g = jSONArray2;
        this.f96109a = jSONObject3;
    }

    public static e a(JSONObject jSONObject) throws JSONException {
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("personalization_metadata_key");
        if (jSONObjectOptJSONObject == null) {
            jSONObjectOptJSONObject = new JSONObject();
        }
        JSONObject jSONObject2 = jSONObjectOptJSONObject;
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("rollout_metadata_key");
        if (jSONArrayOptJSONArray == null) {
            jSONArrayOptJSONArray = new JSONArray();
        }
        return new e(jSONObject.getJSONObject("configs_key"), new Date(jSONObject.getLong("fetch_time_key")), jSONObject.getJSONArray("abt_experiments_key"), jSONObject2, jSONObject.optLong("template_version_number_key"), jSONArrayOptJSONArray);
    }

    public static d d() {
        d dVar = new d();
        dVar.f96102a = new JSONObject();
        dVar.f96103b = f96108h;
        dVar.f96104c = new JSONArray();
        dVar.f96105d = new JSONObject();
        dVar.f96106e = 0L;
        dVar.f96107f = new JSONArray();
        return dVar;
    }

    public final HashMap b() throws JSONException {
        HashMap map = new HashMap();
        int i5 = 0;
        while (true) {
            JSONArray jSONArray = this.f96112d;
            if (i5 >= jSONArray.length()) {
                return map;
            }
            JSONObject jSONObject = jSONArray.getJSONObject(i5);
            if (jSONObject.has("affectedParameterKeys") && !jSONObject.getString("experimentId").startsWith("rollout")) {
                JSONArray jSONArray2 = jSONObject.getJSONArray("affectedParameterKeys");
                for (int i11 = 0; i11 < jSONArray2.length(); i11++) {
                    map.put(jSONArray2.getString(i11), jSONObject);
                }
            }
            i5++;
        }
    }

    public final HashMap c() throws JSONException {
        HashMap map = new HashMap();
        int i5 = 0;
        while (true) {
            JSONArray jSONArray = this.f96115g;
            if (i5 >= jSONArray.length()) {
                return map;
            }
            JSONObject jSONObject = jSONArray.getJSONObject(i5);
            String string = jSONObject.getString("rolloutId");
            String string2 = jSONObject.getString("variantId");
            JSONArray jSONArray2 = jSONObject.getJSONArray("affectedParameterKeys");
            for (int i11 = 0; i11 < jSONArray2.length(); i11++) {
                String string3 = jSONArray2.getString(i11);
                if (!map.containsKey(string3)) {
                    map.put(string3, new HashMap());
                }
                Map map2 = (Map) map.get(string3);
                if (map2 != null) {
                    map2.put(string, string2);
                }
            }
            i5++;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof e) {
            return this.f96109a.toString().equals(((e) obj).f96109a.toString());
        }
        return false;
    }

    public final int hashCode() {
        return this.f96109a.hashCode();
    }

    public final String toString() {
        return this.f96109a.toString();
    }
}
