package tm;

import android.text.TextUtils;
import android.util.Log;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class p {

    /* renamed from: d, reason: collision with root package name */
    public static final long f89497d = TimeUnit.DAYS.toMillis(7);

    /* renamed from: a, reason: collision with root package name */
    public final String f89498a;

    /* renamed from: b, reason: collision with root package name */
    public final String f89499b;

    /* renamed from: c, reason: collision with root package name */
    public final long f89500c;

    public p(String str, String str2, long j11) {
        this.f89498a = str;
        this.f89499b = str2;
        this.f89500c = j11;
    }

    public static String a(long j11, String str, String str2) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("token", str);
            jSONObject.put("appVersion", str2);
            jSONObject.put("timestamp", j11);
            return jSONObject.toString();
        } catch (JSONException e3) {
            Log.w("FirebaseMessaging", "Failed to encode token: " + e3);
            return null;
        }
    }

    public static p b(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (!str.startsWith("{")) {
            return new p(str, null, 0L);
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            return new p(jSONObject.getString("token"), jSONObject.getString("appVersion"), jSONObject.getLong("timestamp"));
        } catch (JSONException e3) {
            Log.w("FirebaseMessaging", "Failed to parse token: " + e3);
            return null;
        }
    }
}
