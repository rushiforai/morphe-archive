package defpackage;

import android.text.TextUtils;
import com.google.android.gms.common.api.Status;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qyf {
    public static final HashMap a;

    static {
        HashMap map = new HashMap();
        a = map;
        map.put("auth/invalid-provider-id", "INVALID_PROVIDER_ID");
        map.put("auth/invalid-cert-hash", "INVALID_CERT_HASH");
        map.put("auth/network-request-failed", "WEB_NETWORK_REQUEST_FAILED");
        map.put("auth/web-storage-unsupported", "WEB_STORAGE_UNSUPPORTED");
        map.put("auth/operation-not-allowed", "OPERATION_NOT_ALLOWED");
    }

    public static Status a(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("code");
            String string2 = jSONObject.getString("message");
            if (!TextUtils.isEmpty(string) && !TextUtils.isEmpty(string2)) {
                HashMap map = a;
                if (map.containsKey(string)) {
                    return hp7.K(((String) map.get(string)) + ":" + string2);
                }
            }
            return hp7.K("WEB_INTERNAL_ERROR:" + str);
        } catch (JSONException e) {
            return hp7.K("WEB_INTERNAL_ERROR:" + str + "[ " + e.getLocalizedMessage() + " ]");
        }
    }
}
