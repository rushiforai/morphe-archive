package com.bytedance.sdk.openadsdk.core.xkz;

import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashSet;
import java.util.Objects;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc {

    /* renamed from: dj, reason: collision with root package name */
    private final String f26422dj;
    private final String sya;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final URL f26423zb;

    private jc(String str, String str2, String str3, String str4) throws MalformedURLException {
        this.ycx = str2;
        this.f26423zb = new URL(str);
        this.sya = str3;
        this.f26422dj = str4;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jc)) {
            return false;
        }
        jc jcVar = (jc) obj;
        if (ycx(this.ycx, jcVar.ycx) && ycx(this.f26423zb, jcVar.f26423zb) && ycx(this.sya, jcVar.sya)) {
            return ycx(this.f26422dj, jcVar.f26422dj);
        }
        return false;
    }

    public int hashCode() {
        String str = this.ycx;
        int iHashCode = (this.f26423zb.hashCode() + ((str != null ? str.hashCode() : 0) * 31)) * 31;
        String str2 = this.sya;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
        String str3 = this.f26422dj;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    public URL sya() {
        return this.f26423zb;
    }

    public String ycx() {
        return this.ycx;
    }

    public String zb() {
        return this.sya;
    }

    private boolean ycx(Object obj, Object obj2) {
        return Objects.equals(obj, obj2);
    }

    public static jc ycx(String str, String str2, String str3, String str4) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            return new jc(str, str2, str3, str4);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5riR+kJ0k=", "WPwolBe5X8KOTthP", Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
            return null;
        }
    }

    public static jc ycx(JSONObject jSONObject) {
        try {
            String strOptString = jSONObject.optString("apiFramework");
            String strOptString2 = jSONObject.optString("javascriptResourceUrl");
            if ("omid".equalsIgnoreCase(strOptString) && !TextUtils.isEmpty(strOptString2)) {
                return new jc(strOptString2, jSONObject.optString("vendorKey"), jSONObject.optString("verificationParameters"), jSONObject.optString("verificationNotExecuted"));
            }
            return null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5riR+kJ0k=", "WPwolBe5X8KOTthPqgOvJXH9Ips=", Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE);
            return null;
        }
    }

    public static HashSet<jc> ycx(JSONArray jSONArray) {
        HashSet<jc> hashSet = new HashSet<>();
        if (jSONArray != null) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                try {
                    hashSet.add(ycx(jSONArray.getJSONObject(i5)));
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5riR+kJ0k=", "WPwolBe5X8KOTthPvxS0DknhIL8Qs2c=", 149);
                    return hashSet;
                }
            }
        }
        return hashSet;
    }
}
