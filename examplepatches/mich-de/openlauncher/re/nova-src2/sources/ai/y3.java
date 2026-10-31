package ai;

import android.os.Bundle;
import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class y3 {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f13483a;

    public y3(Map map) {
        HashMap map2 = new HashMap();
        this.f13483a = map2;
        map2.putAll(map);
    }

    public final String a() {
        StringBuilder sb2 = new StringBuilder();
        xk.r2 r2Var = a4.f12842a;
        int i5 = r2Var.f96009d;
        for (int i11 = 0; i11 < i5; i11++) {
            String str = (String) r2Var.get(i11);
            HashMap map = this.f13483a;
            if (map.containsKey(str)) {
                if (sb2.length() > 0) {
                    sb2.append(";");
                }
                sb2.append(str);
                sb2.append("=");
                sb2.append((String) map.get(str));
            }
        }
        return sb2.toString();
    }

    public final Bundle b() {
        int iC;
        HashMap map = this.f13483a;
        if ("1".equals(map.get("gdprApplies")) && "1".equals(map.get("EnableAdvertiserConsentMode"))) {
            String str = "denied";
            if (map.get("Version") == null) {
                if ("1".equals(map.get("GoogleConsent")) && (iC = c()) >= 0) {
                    String str2 = (String) map.get("PurposeConsents");
                    if (TextUtils.isEmpty(str2)) {
                        return Bundle.EMPTY;
                    }
                    Bundle bundle = new Bundle();
                    if (str2.length() > 0) {
                        bundle.putString("ad_storage", str2.charAt(0) == '1' ? "granted" : "denied");
                    }
                    if (str2.length() > 3) {
                        bundle.putString("ad_personalization", (str2.charAt(2) == '1' && str2.charAt(3) == '1') ? "granted" : "denied");
                    }
                    if (str2.length() > 6 && iC >= 4) {
                        if (str2.charAt(0) == '1' && str2.charAt(6) == '1') {
                            str = "granted";
                        }
                        bundle.putString("ad_user_data", str);
                    }
                    return bundle;
                }
                return Bundle.EMPTY;
            }
            if (c() >= 0) {
                Bundle bundle2 = new Bundle();
                bundle2.putString("ad_storage", true != Objects.equals(map.get("AuthorizePurpose1"), "1") ? "denied" : "granted");
                bundle2.putString("ad_personalization", (Objects.equals(map.get("AuthorizePurpose3"), "1") && Objects.equals(map.get("AuthorizePurpose4"), "1")) ? "granted" : "denied");
                if (c() >= 4) {
                    if (Objects.equals(map.get("AuthorizePurpose1"), "1") && Objects.equals(map.get("AuthorizePurpose7"), "1")) {
                        str = "granted";
                    }
                    bundle2.putString("ad_user_data", str);
                }
                return bundle2;
            }
        }
        return Bundle.EMPTY;
    }

    public final int c() {
        try {
            String str = (String) this.f13483a.get("PolicyVersion");
            if (TextUtils.isEmpty(str)) {
                return -1;
            }
            return Integer.parseInt(str);
        } catch (NumberFormatException unused) {
            return -1;
        }
    }

    public final boolean equals(Object obj) {
        if (obj instanceof y3) {
            return a().equalsIgnoreCase(((y3) obj).a());
        }
        return false;
    }

    public final int hashCode() {
        return a().hashCode();
    }

    public final String toString() {
        return a();
    }
}
