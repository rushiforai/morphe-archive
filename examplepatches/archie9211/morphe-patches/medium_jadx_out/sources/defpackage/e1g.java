package defpackage;

import android.text.TextUtils;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e1g implements vnf {
    public static final e1g c;
    public static final e1g d;
    public static final e1g e;
    public static final e1g f;
    public static final e1g g;
    public static final e1g h;
    public static final e1g i;
    public static final e1g j;
    public static final e1g k;
    public static final e1g l;
    public static final e1g m;
    public static final e1g n;
    public static final e1g o;
    public final /* synthetic */ int a;
    public final String b;

    static {
        int i2 = 0;
        c = new e1g("SHA1", i2);
        d = new e1g("SHA224", i2);
        e = new e1g("SHA256", i2);
        f = new e1g("SHA384", i2);
        g = new e1g("SHA512", i2);
        int i3 = 1;
        h = new e1g("TINK", i3);
        i = new e1g("NO_PREFIX", i3);
        int i4 = 2;
        j = new e1g("UNKNOWN_PREFIX", i4);
        k = new e1g("TINK", i4);
        l = new e1g("LEGACY", i4);
        m = new e1g("RAW", i4);
        n = new e1g("CRUNCHY", i4);
        o = new e1g("WITH_ID_REQUIREMENT", i4);
    }

    public e1g(String str) {
        this.a = 3;
        str.getClass();
        this.b = str;
    }

    public String toString() {
        int i2 = this.a;
        String str = this.b;
        switch (i2) {
            case 0:
            case 1:
            case 2:
            case 4:
                return str;
            case 3:
            default:
                return super.toString();
        }
    }

    @Override // defpackage.vnf
    public String zza() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        String str = this.b;
        if (!TextUtils.isEmpty(str)) {
            jSONObject.put("tenantId", str);
        }
        if (!TextUtils.isEmpty("CLIENT_TYPE_ANDROID")) {
            jSONObject.put("clientType", "CLIENT_TYPE_ANDROID");
        }
        if (!TextUtils.isEmpty("RECAPTCHA_ENTERPRISE")) {
            jSONObject.put("recaptchaVersion", "RECAPTCHA_ENTERPRISE");
        }
        return jSONObject.toString();
    }

    public /* synthetic */ e1g(String str, int i2) {
        this.a = i2;
        this.b = str;
    }
}
